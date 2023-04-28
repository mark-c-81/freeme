const hideExpGrid = () => {
  const sortExperience = document.querySelector('#sort-experience');
  const expGrid = document.querySelector('#exp-grid');

  console.log(sortExperience.childNodes.length);

  if (sortExperience.childNodes.length < 2) {
    expGrid.style.display = "none";
  } else {
    expGrid.style.display = "";
  }

}

export { hideExpGrid };
