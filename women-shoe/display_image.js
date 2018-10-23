function openImg(imgs) {
  // Get the expanded image
  var expandImg = document.getElementById("expandedImg");

  // Use the same src in the expanded image as the image being clicked on from the grid
  expandImg.src = imgs.src;
}
