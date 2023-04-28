// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import { initSortable } from './sortable.js'; // <-- add this


Rails.start()
Turbolinks.start()
ActiveStorage.start()
initSortable()

// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import { available } from './available.js';
import { hideExpGrid } from './hideExpGrid.js';
import { initSweetalert } from './init_sweetalert.js';
import { showcaseAni } from './showcase.js';

available();
hideExpGrid();


document.querySelectorAll('#sort-skill li').forEach(e => {
  const id = e.dataset.skill

  initSweetalert(`#skill-alert-${id}`, {
    title: "Delete this skill?",
    text: "This action cannot be reversed",
    icon: "warning",
    dangerMode: true,
    buttons: ["cancel", "delete"]
  }, (value) => {
    if (value) {
      const link = document.querySelector(`#delete-skill-${id}`);
      link.click();
    }
  });
})

document.querySelectorAll('#sort-project li').forEach(e => {
  const id = e.dataset.project

  initSweetalert(`#project-alert-${id}`, {
    title: "Delete this project?",
    text: "This action cannot be reversed",
    icon: "warning",
    dangerMode: true,
    buttons: ["cancel", "delete"]
  }, (value) => {
    if (value) {
      const link = document.querySelector(`#delete-project-${id}`);
      link.click();
    }
  });
})

document.querySelectorAll('#sort-experience li').forEach(e => {
  const id = e.dataset.experience

  initSweetalert(`#experience-alert-${id}`, {
    title: "Delete this experience?",
    text: "This action cannot be reversed",
    icon: "warning",
    dangerMode: true,
    buttons: ["cancel", "delete"]
  }, (value) => {
    if (value) {
      const link = document.querySelector(`#delete-experience-${id}`);
      link.click();
    }
  });
})

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
});


// getIcon('html')




