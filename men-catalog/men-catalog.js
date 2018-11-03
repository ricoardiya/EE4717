function close() {
  modal.style.display = "none";
}
span.onclick = function () {
  modal.style.display = "none";
}
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
