
function showcaseAni(){

    // let skillsGrid = document.querySelector('.sc-skills-grid');
    let projGrid = document.querySelector('.sc-projects-container');
    let expGrid = document.querySelector('.sc-exp-grid');

    // let skillPos = skillsGrid.getBoundingClientRect().top;
    let projPos = projGrid.getBoundingClientRect().top;
    let expPos = expGrid.getBoundingClientRect().top;

    let screenPos = window.innerHeight;


    // if(skillPos < screenPos){
    //   skillsGrid.classList.add('skill-appear')
    // }

    if(projPos < screenPos){
      projGrid.classList.add('pro-appear')
    }

    if(expPos < screenPos){
      expGrid.classList.add('exp-appear')
    }
};

window.addEventListener('scroll', showcaseAni);

