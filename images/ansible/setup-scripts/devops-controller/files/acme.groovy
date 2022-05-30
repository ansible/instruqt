#!/usr/bin/env groovy

pipeline {
    agent any
    stages {
        stage('SCM Get Code') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'http://gitea:3000/student/acme_corp.git']]])
            }
        }

        stage('Installing packages') {
            steps {
                script {
                    sh '/usr/bin/python3 -m pip install -r app/requirements.txt'
                }
            }
        }
        
        // stage('Static Code Checking') {
        //     steps {
        //         script {
        //             sh 'find . -name \\*.py | xargs /usr/bin/python3 -m pylint --load-plugins=pylint_django -f parseable | tee pylint.log'
        //             recordIssues(
        //                 tool: pyLint(pattern: 'pylint.log'),
        //                 failTotalHigh: 10,
        //             )
        //         }
        //     }
        // }
        stage('Build and Tag') {
                                                            
                                                            //    git pull origin main --force --allow-unrelated-histories // git checkout main
                                       // git config credential.helper store
                            // echo https://${env.GIT_USERNAME}:${env.GIT_PASSWORD}@github.com &gt;&gt; \$HOME/.git-credentials
                                                    // git add .
                        // git push origin main
                    // git checkout main
                        // git fetch --tags --all --prune
                        // git pull --force origin main
            steps {
                withCredentials([gitUsernamePassword(credentialsId: 'gitea_repo', gitToolName: 'git')]) {
                    sh """
                        git checkout main
                        git fetch --tags --all --prune
                        git config --replace-all user.name ${env.GIT_USERNAME}
                        git config --replace-all user.email ${env.GIT_USERNAME}
                        cd app && /usr/bin/python3 -m bumpversion --config-file setup.cfg --allow-dirty --verbose minor --list > build_vars.env

                    """
                    script {
                        def build_vars = readProperties file: 'app/build_vars.env'
                        env.newPkgVersion = build_vars.new_version
                        env.pkgVersion = build_vars.current_version
                        echo " CURRENT - ${pkgVersion}"
                        echo " NEW  - ${newPkgVersion}"
                    }
                    sh """
                        pwd
                        git tag --force v${newPkgVersion}
                        git add .
                        git commit -m"Bump version from  v${pkgVersion} to v${newPkgVersion}"
                        git push --force origin main v${newPkgVersion}
                    """
                }
               

                
                
                // withCredentials([gitUsernamePassword(credentialsId: 'gitea_repo', gitToolName: 'git')]) {
                //     sh """
                //         git add .
                //         git commit -m "v${newPkgVersion}"
                //         git push origin main "${newPkgVersion}"
                //     """
                // }
                
                // ansibleTower(
                //     towerServer: 'JuiceShop controller',
                //     templateType: 'job',
                //     jobTemplate: 'ACME Release',
                //     importTowerLogs: true,
                //     removeColor: false,
                //     verbose: true,
                //         extraVars: '''---
                //         pkg_version: $pkgVersion
                //         tag_name: $newPkgVersion
                //         '''
                // )                         
            }
        }
        
        // stage('Build and Tag') {
        //     steps {
        //         nodejs(nodeJSInstallationName: 'nodejs') {
        //             withCredentials([
        //                 usernamePassword(credentialsId: 'juiceshop_repo', 
        //                     passwordVariable: 'GITHUB_TOKEN',
        //                     usernameVariable: 'GITHUB_USERNAME')]) {
        //                 script {
        //                     // Determine version number for next release.
        //                     env.pkgVersion = sh (
        //                       script: 'git tag --list | sort --version-sort --reverse | head -n1 | cut -d "-" -f1',
        //                       returnStdout: true
        //                     ).trim()
        //                     env.newPkgVersion = bumpPatchVersion(pkgVersion)
        //                 }
                        
        //                 // Configure author for tag and auth credentials for pushing tag to GitHub.
        //                 // See https://git-scm.com/docs/git-credential-store.
        //                 sh """
        //                     git config --replace-all user.name ${env.GITHUB_USERNAME}
        //                     git config --replace-all user.email ${env.GITHUB_USERNAME}
        //                     git config credential.helper store
        //                     echo https://${env.GITHUB_USERNAME}:${env.GITHUB_TOKEN}@github.com >> \$HOME/.git-credentials
        //                 """
                        
        //                 // Bump the package version.
        //                 sh """
        //                     git checkout master --force
        //                     git tag ${newPkgVersion}
        //                     npm --no-git-tag-version version ${newPkgVersion}
        //                     git add .
        //                     git commit -m ${newPkgVersion}
        //                     git push origin master --force
        //                     git push https://github.com/craig-br/juice-shop.git ${newPkgVersion}
        //                 """
        //                 //sleep 2 // Give GitHub a moment to realize the tag exists
        //                 // Install and Create the Dist Package. No time in demo
        //                 //sh "npm install --production && grunt package"
        //             }
        //         }
        //     }
        // }
        
        // // Create a release and deploy instances with Tower
        // stage ('Controller - Publish and Cloud') {
        //     parallel {
        //         stage('Controller - Create Release') {
        //             steps {
        //                 ansibleTower(
        //                     towerServer: 'JuiceShop controller',
        //                     templateType: 'job',
        //                     jobTemplate: 'GitHub Release',
        //                     importTowerLogs: true,
        //                     removeColor: false,
        //                     verbose: true,
        //                         extraVars: '''---
        //                         pkg_version: $pkgVersion
        //                         tag_name: $newPkgVersion
        //                         '''
        //                 )                         
        //             }
        //         }
        //         // Create instances with controller
        //         stage('Controller - Instances') {
        //             steps {
        //                 ansibleTower(
        //                     towerServer: 'JuiceShop controller',
        //                     templateType: 'workflow',
        //                     jobTemplate: 'Cloud Instances Workflow',
        //                     importTowerLogs: true,
        //                     removeColor: false,
        //                     verbose: true,
        //                     credential: '',
        //                 )   
        //             }
        //         }
        //     }
        // }
        
        // // Deploy app and create VS
        // stage ('Controller - Deploy App and Net') {
        //     parallel {
        //         stage('Controller - Deploy App') {
        //             steps {
        //                 ansibleTower(
        //                     towerServer: 'JuiceShop controller',
        //                     templateType: 'job',
        //                     jobTemplate: 'Deploy JuiceShop App',
        //                     importTowerLogs: true,
        //                     removeColor: false,
        //                     verbose: true,
        //                     extraVars: '''---
        //                     pkg_version: $pkgVersion
        //                     tag_name: $newPkgVersion
        //                     '''
        //                 )                       
        //             }
        //         }
        //         stage('Controller - Net') {
        //             steps {
        //                 ansibleTower(
        //                     towerServer: 'JuiceShop controller',
        //                     templateType: 'job',
        //                     jobTemplate: 'Create JuiceShop App VS',
        //                     importTowerLogs: true,
        //                     removeColor: false,
        //                     verbose: true,
        //                 )
        //             }
        //         }
        //     }
        // }
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
