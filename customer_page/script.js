document
  .getElementById("change-address-btn")
  .addEventListener("click", function () {
    document.getElementById("address-dropdown").classList.toggle("hidden");
  });

document
  .getElementById("change-time-btn")
  .addEventListener("click", function () {
    document.getElementById("time-picker").classList.toggle("hidden");
  });

document
  .getElementById("address-dropdown")
  .addEventListener("change", function () {
    if (this.value === "add-new") {
      // Logic to add a new address
    } else {
      document.getElementById("current-address").textContent = this.value;
    }
  });

document.getElementById("time-picker").addEventListener("change", function () {
  document.getElementById("current-time").textContent = this.value;
});
