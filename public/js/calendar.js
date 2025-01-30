const isCheckYear = (year) => {
  return (
    (year % 4 === 0 && year % 100 !== 0 && year % 400 !== 0) ||
    (year % 100 === 0 && year % 400 === 0)
  );
};

const getFebDays = (year) => {
  return isCheckYear(year) ? 29 : 28;
};

let monthList = document.querySelector(".month-list");

export const generateCalendar = (month, year) => {
  let monthPicker = document.querySelector("#month-picker");
  monthPicker.onclick = () => {
    monthList.classList.add("show");
  };

  let calendarDay = document.querySelector(".calendar-day");
  calendarDay.innerHTML = "";

  let calendarHeaderYear = document.querySelector("#year");
  let daysOfMonth = [
    31,
    getFebDays(year),
    31,
    30,
    31,
    30,
    31,
    31,
    30,
    31,
    30,
    31,
  ];
  let currDate = new Date();

  monthPicker.textContent = monthNames[month];
  calendarHeaderYear.textContent = year;

  let firstDay = new Date(year, month, 1);

  for (let i = 0; i <= daysOfMonth[month] + firstDay.getDay() - 1; i++) {
    let day = document.createElement("div");
    if (i >= firstDay.getDay()) {
      const dayNumber = i - firstDay.getDay() + 1;
      day.textContent = dayNumber;

      if (
        dayNumber === currDate.getDate() &&
        year === currDate.getFullYear() &&
        month === currDate.getMonth()
      ) {
        day.classList.add("currDate");
      }

      if (
        year < currDate.getFullYear() ||
        (year === currDate.getFullYear() && month < currDate.getMonth()) ||
        (year === currDate.getFullYear() &&
          month === currDate.getMonth() &&
          dayNumber < currDate.getDate()) ||
        dayNumber === ""
      ) {
        day.classList.add("disable");
        day.disabled = true;
      }
    } else {
      day.classList.add("disable");
      day.disabled = true;
    }
    calendarDay.appendChild(day);
  }
};

export const monthNames = [
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December",
];

let monthPicker = document.querySelector("#month-picker");
monthPicker.onclick = () => {
  monthList.classList.add("show");
};
