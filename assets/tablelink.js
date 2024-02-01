const tableRows = document.querySelectorAll(".table-clickable tbody tr");

for (const tableRow of tableRows) {
  tableRow.addEventListener("click", function () {
    window.open(this.dataset.href, "_blank");
  });
}