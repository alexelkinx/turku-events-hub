import { DOMAIN_NAME } from "./config.js";

fetch(`${DOMAIN_NAME}/account`)
  .then((response) => response.json())
  .then((json) => {
    if (json.data.logged_in == true) {
      const user = json.data.user;
      const account = document.querySelector(".account-container");
      const html = `<div class="account-nav container-xl d-flex justify-content-evenly">
      <a href="#">
        <button
          type="button"
          class="active_event event-type btn btn-light rounded-pill border"
        >
          Personal Info
        </button></a
      >
      <a href="#">
        <button
          type="button"
          class="event-type btn btn-light rounded-pill border"
        >
          Favourites
        </button></a
      >
      <button
        type="button"
        class="logout event-type btn btn-light rounded-pill border"
      >
        Log out
      </button>
    </div>

    <section class="account container">
      <div class="account-info">
      <form class="account-form" action="#">
      <input hidden name="action" value="update_info" />
      <p>
        <label for="first_name">First Name</label>
        <input
          id="first_name"
          class="account-form-info account-name"
          name="first_name"
          type="text"
          placeholder="First Name"
          value="${user.first_name}"
          disabled
        />
      </p>
      <p>
        <label for="last_name">Last Name</label>
        <input
          id="last_name"
          class="account-form-info account-lastname"
          name="last_name"
          type="text"
          placeholder="Last Name"
          value="${user.last_name}"
          disabled
        />
      </p>
      <p>
        <label for="email">Email</label>
        <input
          id="email"
          class="account-form-info account-email"
          name="email"
          type="email"
          placeholder="Email"
          value="${user.user_email}"
          disabled
        />
      </p>
    </form>
    </div>
    </section>`;
      account.insertAdjacentHTML("beforeend", html);

      const logout = document.querySelector(".logout");
      logout.addEventListener("click", () => {
        fetch(`${DOMAIN_NAME}/logout`)
          .then((response) => response.json())
          .then((json) => {
            window.location.href = "login.html";
          })
          .catch((error) => {});
      });
    } else {
      console.log("logout");
      window.location.href = "login.html";
    }
  })
  .catch((error) => {});
