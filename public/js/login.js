import { DOMAIN_NAME } from "./config.js";

document
  .querySelector(".login_form")
  .addEventListener("submit", function (event) {
    event.preventDefault();
    const data = new FormData(this);
    const email = data.get("user_email").trim();
    const password = data.get("password").trim();
    fetch(`${DOMAIN_NAME}/login`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json",
      },
      body: JSON.stringify({
        user_email: email,
        password: password,
      }),
    })
      .then((response) => response.json())
      .then((responseData) => {
        if (responseData.success) {
          window.location.href = "account.html";
        } else {
          const loginSection = document.querySelector(".login");
          loginSection.textContent = "";
          const html = `<h3>Ooops!</h3>
          <p>${responseData.reason}</p>
          <a href="login.html">
          <button type="button" class="btn btn-light rounded-pill">
            Return to login page</button></a>`;
          loginSection.insertAdjacentHTML("beforeend", html);
        }
      })
      .catch((error) => {});
  });
