// const tableRows = document.querySelectorAll(".table-clickable tbody tr");

// for (const tableRow of tableRows) {
//   tableRow.addEventListener("click", function () {
//     window.location.href = this.dataset.href;
//   });
// }

const tableRows = document.querySelectorAll(".table-clickable tbody tr");

for (const tableRow of tableRows) {
  tableRow.addEventListener("click", function (event) {
    // Prevent the link's default behavior if clicked
    event.preventDefault();

    // Ensure the row's data-href link always wins
    window.open(this.dataset.href, "_blank");
  });
}
