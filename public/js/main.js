import { DOMAIN_NAME } from "./config.js";
import { generateCalendar, monthNames } from "./calendar.js";
import { plusSlides, currentSlide, fetchTopEvents } from "./carusel.js";

function fetchEvents(day, event = "all") {
  const date = day.toISOString().split("T")[0];
  console.log(day);
  const events = document.querySelector(".events");
  events.textContent = "";

  fetch(`${DOMAIN_NAME}/${event}?date=${date}`)
    .then((response) => response.json())
    .then((responseData) => {
      let eventsList = responseData.data.events;
      for (const event of eventsList) {
        const html = `
          <a class="card-link" href="${DOMAIN_NAME}/${event.event_type.toLowerCase()}.html?id=${
          event.id
        }">
            <div class="card">
              <img
                src="assets/${event.event_type.toLowerCase()}/${
          event.image
        }.png"
                class="card-img-top"
                alt="event picture"
              />
              <div class="card-body text-center">
                <h4 class="card-title">${event.title}</h4>
                <p class="card-subtitle">${event.event_type}</p>
              </div>
            </div>
          </a>`;
        events.insertAdjacentHTML("beforeend", html);
      }
    })

    .catch((error) => {
      // console.log(error);
    });
}

//Generate Calendar
let monthList = document.querySelector(".month-list");

let currDate = new Date();
let currMonth = { value: currDate.getMonth() };
let currYear = { value: currDate.getFullYear() };
let eventType = "all";
const eventBtns = document.querySelectorAll(".event-type");

monthNames.forEach((e, index) => {
  let month = document.createElement("div");
  month.innerHTML = `<div>${e}</div>`;
  month.onclick = () => {
    monthList.classList.remove("show");
    currMonth.value = index;
    generateCalendar(currMonth.value, currYear.value);

    document.querySelectorAll(".calendar-day div").forEach((day) => {
      selectDay(day);
    });
  };
  monthList.appendChild(month);
});

function selectDay(day) {
  day.addEventListener("click", () => {
    document.querySelector(".currDate")?.classList.remove("currDate");
    day.classList.add("currDate");

    const selectedDay = parseInt(day.textContent);

    const selectedDate = new Date(
      Date.UTC(currYear.value, currMonth.value, selectedDay)
    );

    document.querySelector(".active_event").classList.remove("active_event");
    currDate = selectedDate;
    fetchEvents(currDate);
    document.querySelector(".all").classList.add("active_event");
  });
}

generateCalendar(currMonth.value, currYear.value);

document.querySelectorAll(".calendar-day div").forEach((day) => {
  selectDay(day);
});

eventBtns.forEach((btn) => {
  btn.addEventListener("click", (event) => {
    document.querySelector(".active_event").classList.remove("active_event");
    eventType = event.target.textContent.toLowerCase().trim();
    btn.classList.add("active_event");
    fetchEvents(currDate, eventType);
  });
});

fetchEvents(currDate, eventType);

// Carusel
fetchTopEvents();

const btnPrev = document.querySelector(".prev");
const btnNext = document.querySelector(".next");

btnPrev.addEventListener("click", () => plusSlides(-1));
btnNext.addEventListener("click", () => plusSlides(1));

const dots = document.querySelectorAll(".dot");

dots.forEach((dot, inx) => {
  dot.addEventListener("click", () => currentSlide(inx + 1));
});
