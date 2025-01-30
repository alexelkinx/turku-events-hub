import { DOMAIN_NAME } from "./config.js";

export let slideIndex = 1;

// Next/previous controls
export function plusSlides(n) {
  showSlides((slideIndex += n));
}

// Thumbnail image controls
export function currentSlide(n) {
  showSlides((slideIndex = n));
}

export function showSlides(n) {
  let i;
  let slides = document.getElementsByClassName("slide");
  let dots = document.getElementsByClassName("dot");
  if (n > slides.length) {
    slideIndex = 1;
  }
  if (n < 1) {
    slideIndex = slides.length;
  }
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex - 1].style.display = "block";
  dots[slideIndex - 1].className += " active";
}

function formatDate(inputDate) {
  const parts = inputDate.split("-");
  const formattedDate = `${parts[2]}.${parts[1]}.${parts[0]}`;

  return formattedDate;
}

export function fetchTopEvents() {
  const slideshow = document.querySelector(".slideshow-container");

  fetch(`${DOMAIN_NAME}/top`)
    .then((response) => response.json())
    .then((responseData) => {
      const eventsList = responseData.data.topEvents;
      for (const event of eventsList) {
        let html = `
        <figure class="slide faded">
              <a href="${DOMAIN_NAME}/${event.event_type.toLowerCase()}.html?id=${
          event.id
        }">
                <div class="slide-image">
                  <img src="assets/${event.event_type.toLowerCase()}/${
          event.image
        }.png" alt="${event.title}" />
                  <div class="image-overlay"></div>
                </div>
                <figcaption class="slide-info">
                  <h3 class="slide-heading">${event.title}</h3>
                  <p class="slide-text">${formatDate(event.date)}</p>
                </figcaption>
              </a>
            </figure>`;
        slideshow.insertAdjacentHTML("beforebegin", html);
      }
      showSlides(slideIndex);
    })

    .catch((error) => {
      // console.log(error);
    });
}
