import { DOMAIN_NAME } from "./config.js";

const urlParams = new URLSearchParams(window.location.search);
const eventId = urlParams.get("id");

function formatDate(inputDate) {
  const parts = inputDate.split("-");
  const formattedDate = `${parts[2]}.${parts[1]}.${parts[0]}`;

  return formattedDate;
}

// Fetch event data based on the event ID
fetch(`${DOMAIN_NAME}/theatre?id=${eventId}`)
  .then((response) => response.json())
  .then((responseData) => {
    const theatre = responseData.data;
    const schedule = theatre.schedule;

    const title = document.querySelector("title");
    title.textContent = theatre.title;

    const cardBg = document.querySelector(".event-img-bg");
    const cardInfo = cardBg.querySelector(".card");
    const imgHtml = `<div class="card-body text-center py-5">
    <p class="lead card-text mt-3">Theatre</p>
    <h2 class="card-title"><strong>${theatre.title}</strong></h2>
    <p class="lead card-subtitle">${theatre.genre}</p>
  </div> `;
    cardInfo.insertAdjacentHTML("beforeend", imgHtml);
    cardBg.style.backgroundImage = `url("../assets/theatre/${theatre.image}.png")`;

    const eventDetails = document.querySelector("#event-details");
    const eventDesc = eventDetails.querySelector("#event-desc");
    eventDesc.textContent = theatre.description;

    const eventDetailsList = eventDetails.querySelectorAll(
      ".col-10 .list-group-item"
    );
    eventDetailsList[0].textContent = theatre.director;
    eventDetailsList[1].textContent = theatre.cast;
    eventDetailsList[2].textContent = theatre.location;

    const eventSchedule = document.querySelector(".schedule-bg");
    for (const el of schedule) {
      if (!eventSchedule.querySelector(`[data-date="${el.date}"]`)) {
        const scheduleHtml = `
            <div class="row justify-content-center" data-date="${el.date}">
                <div class="col-4 my-5">
                    <h3 class="cinema-margins mt-1">${formatDate(el.date)}</h3>
                </div>
                <div class="col-8 my-5">
                    <div class="time-group ms-5 mt-1" role="group" aria-label="screen times">
                    </div>
                </div>
                <hr class="line-style rounded-pill" />
            </div>
        `;
        eventSchedule.insertAdjacentHTML("beforeend", scheduleHtml);
      }
      const timeGroup =
        eventSchedule.lastElementChild.querySelector(".time-group");

      const timeHtml = `<p><a href="${el.url}">${el.time}</a></p>`;
      timeGroup.insertAdjacentHTML("beforeend", timeHtml);
    }
  })
  .catch((error) => {
    console.error(error);
  });
