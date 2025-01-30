import { DOMAIN_NAME } from "./config.js";

document
  .querySelector(".registration_form")
  .addEventListener("submit", function (event) {
    event.preventDefault();

    const data = new FormData(this);
    const email = data.get("user_email").trim();
    const firstName = data.get("first_name").trim();
    const lastName = data.get("last_name").trim();
    const password = data.get("password").trim();
    fetch(`${DOMAIN_NAME}/registration`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json",
      },
      body: JSON.stringify({
        user_email: email,
        first_name: firstName,
        last_name: lastName,
        password: password,
      }),
    })
      .then((response) => response.json())
      .then((responseData) => {
        const userName = responseData.data.user;

        const regSection = document.querySelector(".registration");
        regSection.textContent = "";
        const html = `<h3>REGISTRATION COMPLETE!</h3>
        <p>Thank you, ${userName}, for registering on Turku Event Hub.</p>
        <div class="container-xl d-flex justify-content-center">
        <a href="login.html">
        <button type="button" class="btn btn-light rounded-pill">
          Return to login page</button></a>
        </div>`;

        regSection.insertAdjacentHTML("beforeend", html);
      })
      .catch((error) => {
        // console.error("Error:", error);
        const regSection = document.querySelector(".registration");
        regSection.textContent = "";
        const html = `<h3>Ooops!</h3>
        <p>Something wrong happened!</p>
        <div class="container-xl d-flex justify-content-center">
        <a href="register.html">
        <button type="button" class="btn btn-light rounded-pill">
          Return to registration page</button></a>
        </div>`;

        regSection.insertAdjacentHTML("beforeend", html);
      });
  });
