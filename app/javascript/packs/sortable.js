import Sortable from 'sortablejs';

const initSortable = () => {
  const sortSkills = document.querySelector('#sort-skill');

  let sortableSkill = Sortable.create(sortSkills, {
    ghostClass: "ghost",
    animation: 150,
  });

  const sortProject = document.querySelector('#sort-project');

  let sortableProject = Sortable.create(sortProject, {
    ghostClass: "ghost",
    animation: 150,
  });

  const sortExperience = document.querySelector('#sort-experience');

  let sortableExperience = Sortable.create(sortExperience, {
    ghostClass: "ghost",
    animation: 150,
  })

  const skillSavedMessage = document.getElementById('skill-saved-message');

  if (sortSkills.childNodes.length > 1) {
    document.querySelector('#save-skill').addEventListener('click', (e) => {
      let order = sortableSkill.toArray();

      skillSavedMessage.classList.add('fade');
      setTimeout(function() {
        skillSavedMessage.classList.remove('fade')}, 5000);

      // set all posotions
      const newPositions = []
      // get all skill ids
      document.querySelectorAll('#sort-skill li').forEach((e, index) => {
        // console.log(e.dataset.skill, index)
        newPositions.push({skill: e.dataset.skill, position: index})
      })

      fetch(`https://www.hellofree.me/api/v1/skills`, {
        method: 'POST',
        headers: {
          "Content-type": "application/json",
        },
        body: JSON.stringify({
          position: newPositions
        })
      })
    })
  }

  const projectSavedMessage = document.getElementById('project-saved-message');

  if (sortProject.childNodes.length > 1) {
    document.querySelector('#save-project').addEventListener('click', (e) => {
      let order = sortableProject.toArray();

      projectSavedMessage.classList.add('fade');
      setTimeout(function() {
        projectSavedMessage.classList.remove('fade')}, 5000);

      const newPositions = []

      document.querySelectorAll('#sort-project li').forEach((e, index) => {
        newPositions.push({project: e.dataset.project, position: index})
      })

      fetch(`https://www.hellofree.me/api/v1/projects`, {
        method: 'POST',
        headers: {
          "Content-type": "application/json",
        },
        body: JSON.stringify({
          position: newPositions
        })
      })
    })
  }

  const experienceSavedMessage = document.getElementById('experience-saved-message');


  if (sortExperience.childNodes.length > 1) {
    document.querySelector('#save-experience').addEventListener('click', (e) => {
      let order = sortableExperience.toArray();

      experienceSavedMessage.classList.add('fade');
      setTimeout(function() {
        experienceSavedMessage.classList.remove('fade')}, 5000);

      const newPositions = []

      document.querySelectorAll('#sort-experience li').forEach((e, index) => {
        newPositions.push({experience: e.dataset.experience, position: index})
      })

      fetch(`https://www.hellofree.me/api/v1/experiences`, {
        method: 'POST',
        headers: {
          "Content-type": "application/json",
        },
        body: JSON.stringify({
          position: newPositions
        })
      })
    })
  }
};

export { initSortable };
