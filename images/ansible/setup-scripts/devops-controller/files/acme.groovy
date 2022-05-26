#!/usr/bin/env groovy

pipeline {
    agent any
    stages {
        stage('SCM Get Code') {
            steps {
                // checkout([$class: 'GitSCM', branches: [[name: '*/main']], userRemoteConfigs: [[url: 'http://10.88.0.6:3000/student/acme_corp.git']]])
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'http://gitea:3000/student/acme_corp.git']]])
            }
        }
        
        // Takes too long for demo
        // stage('Code Analysis') {
        //     node {
        //         def scannerHome = tool 'sonarqube'
        //             withSonarQubeEnv('sonarqube'){
        //                 // sh "${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=craig-br_juice-shop2 -Dsonar.sources=. -Dsonar.exclusions=node_modules/*/**,test/**/* -Dsonar.tests=test"
        //                 sh "${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=craig-br_juice-shop -Dsonar.sources=. -Dsonar.exclusions=node_modules/*/**,test/**/*,frontend/node_modules/*/**"
        //         }
        //     }
        // }

        // stage('Code Analysis') {
        //     steps {
        //         nodejs(nodeJSInstallationName: 'nodejs') {
        //             sh ";""
        //                 npm install
        //                 npm run lint
        //             """
        //         }
        //     }
        // }
        
        // Takes too long. need more power captain
        // stage('Unit Tests') {
        //     steps {
        //         nodejs(nodeJSInstallationName: 'nodejs') {
        //             sh "npm test"
        //         }
        //     }
        // }
        
        stage('Build and Tag') {
            steps {
                nodejs(nodeJSInstallationName: 'nodejs') {
                    withCredentials([
                        usernamePassword(credentialsId: 'juiceshop_repo', 
                            passwordVariable: 'GITHUB_TOKEN',
                            usernameVariable: 'GITHUB_USERNAME')]) {
                        script {
                            // Determine version number for next release.
                            env.pkgVersion = sh (
                              script: 'git tag --list | sort --version-sort --reverse | head -n1 | cut -d "-" -f1',
                              returnStdout: true
                            ).trim()
                            env.newPkgVersion = bumpPatchVersion(pkgVersion)
                        }
                        
                        // Configure author for tag and auth credentials for pushing tag to GitHub.
                        // See https://git-scm.com/docs/git-credential-store.
                        sh """
                            git config --replace-all user.name ${env.GITHUB_USERNAME}
                            git config --replace-all user.email ${env.GITHUB_USERNAME}
                            git config credential.helper store
                            echo https://${env.GITHUB_USERNAME}:${env.GITHUB_TOKEN}@github.com >> \$HOME/.git-credentials
                        """
                        
                        // Bump the package version.
                        sh """
                            git checkout master --force
                            git tag ${newPkgVersion}
                            npm --no-git-tag-version version ${newPkgVersion}
                            git add .
                            git commit -m ${newPkgVersion}
                            git push origin master --force
                            git push https://github.com/craig-br/juice-shop.git ${newPkgVersion}
                        """
                        //sleep 2 // Give GitHub a moment to realize the tag exists
                        // Install and Create the Dist Package. No time in demo
                        //sh "npm install --production && grunt package"
                    }
                }
            }
        }
        
        // Create a release and deploy instances with Tower
        stage ('Controller - Publish and Cloud') {
            parallel {
                stage('Controller - Create Release') {
                    steps {
                        ansibleTower(
                            towerServer: 'JuiceShop controller',
                            templateType: 'job',
                            jobTemplate: 'GitHub Release',
                            importTowerLogs: true,
                            removeColor: false,
                            verbose: true,
                                extraVars: '''---
                                pkg_version: $pkgVersion
                                tag_name: $newPkgVersion
                                '''
                        )                         
                    }
                }
                // Create instances with controller
                stage('Controller - Instances') {
                    steps {
                        ansibleTower(
                            towerServer: 'JuiceShop controller',
                            templateType: 'workflow',
                            jobTemplate: 'Cloud Instances Workflow',
                            importTowerLogs: true,
                            removeColor: false,
                            verbose: true,
                            credential: '',
                        )   
                    }
                }
            }
        }
        
        // Deploy app and create VS
        stage ('Controller - Deploy App and Net') {
            parallel {
                stage('Controller - Deploy App') {
                    steps {
                        ansibleTower(
                            towerServer: 'JuiceShop controller',
                            templateType: 'job',
                            jobTemplate: 'Deploy JuiceShop App',
                            importTowerLogs: true,
                            removeColor: false,
                            verbose: true,
                            extraVars: '''---
                            pkg_version: $pkgVersion
                            tag_name: $newPkgVersion
                            '''
                        )                       
                    }
                }
                stage('Controller - Net') {
                    steps {
                        ansibleTower(
                            towerServer: 'JuiceShop controller',
                            templateType: 'job',
                            jobTemplate: 'Create JuiceShop App VS',
                            importTowerLogs: true,
                            removeColor: false,
                            verbose: true,
                        )
                    }
                }
            }
        }
    }
}


// Increment the minor part of a `MAJOR.MINOR.PATCH` semver version.
String bumpMinorVersion(String version) {
    def parts = version.tokenize('.')
    if (parts.size() != 3) {
        error "${version} is not a valid MAJOR.MINOR.PATCH version"
    }
    def newMinorVersion = parts[1].toInteger() + 1

    return "${parts[0]}.${newMinorVersion}.${parts[2]}"
}

// Increment the patch part of a `MAJOR.MINOR.PATCH` semver version.
String bumpPatchVersion(String version) {
    def parts = version.tokenize('.')
    if (parts.size() != 3) {
        error "${version} is not a valid MAJOR.MINOR.PATCH version"
    }
    def newPatchVersion = parts[2].toInteger() + 1

    return "${parts[0]}.${parts[1]}.${newPatchVersion}"
}