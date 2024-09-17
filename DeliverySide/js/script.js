// /js/script.js

// Function to get query parameters from URL
function getQueryParams() {
  var params = {};
  window.location.search
    .substring(1)
    .split("&")
    .forEach(function (pair) {
      var keyValue = pair.split("=");
      params[keyValue[0]] = decodeURIComponent(keyValue[1]);
    });
  return params;
}

// Get location and time slot from URL
var params = getQueryParams();
var location = params.location || "Unknown";
var timeSlot = params.timeSlot || "Not specified";

// Update the page with location and time slot
document.getElementById("location").textContent =
  location.charAt(0).toUpperCase() + location.slice(1);
document.getElementById("timeSlot").textContent = timeSlot;

// Define coordinates for different locations
var coordinates = {
  solapur: [17.6599, 75.9064],
  pune: [18.5204, 73.8567],
  mumbai: [19.076, 72.8777],
  delhi: [28.6139, 77.209],
};

// Set map location based on selected delivery
var selectedCoordinates = coordinates[location.toLowerCase()] || [
  17.6599, 75.9064,
]; // Default to Solapur if location not found

// Initialize the map
var map = L.map("map").setView(selectedCoordinates, 13);

// Load the base map tiles
L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
  maxZoom: 19,
  attribution:
    '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors',
}).addTo(map);

// Add a marker for the delivery location
L.marker(selectedCoordinates).addTo(map);

// delivery selection

// Define deliveries with location and time slot
const deliveries = [
  { id: 1, location: "Solapur", timeSlot: "09:00 AM - 10:00 AM" },
  { id: 2, location: "Solapur", timeSlot: "10:00 AM - 11:00 AM" },
  { id: 3, location: "Solapur", timeSlot: "11:00 AM - 12:00 PM" },
  { id: 4, location: "Solapur", timeSlot: "12:00 PM - 01:00 PM" },
  { id: 5, location: "Solapur", timeSlot: "01:00 PM - 02:00 PM" },
  { id: 6, location: "Solapur", timeSlot: "02:00 PM - 03:00 PM" },
  { id: 7, location: "Solapur", timeSlot: "03:00 PM - 04:00 PM" },
  { id: 8, location: "Solapur", timeSlot: "04:00 PM - 05:00 PM" },
  { id: 9, location: "Solapur", timeSlot: "05:00 PM - 06:00 PM" },
  { id: 10, location: "Solapur", timeSlot: "06:00 PM - 07:00 PM" },
];

// Sort deliveries by time slot in ascending order
deliveries.sort((a, b) => {
  const timeToValue = (time) => {
    const [hour, minute] = time.split(":").map(Number);
    return hour * 60 + minute;
  };

  const timeSlotToValue = (timeSlot) => {
    const [startTime] = timeSlot.split(" - ")[0].split(" ");
    return timeToValue(startTime);
  };

  return timeSlotToValue(a.timeSlot) - timeSlotToValue(b.timeSlot);
});

// Populate the list
const listElement = document.getElementById("delivery-list");
deliveries.forEach((delivery) => {
  const listItem = document.createElement("li");
  listItem.innerHTML = `<a href="../html/delivery-details.html?location=${delivery.location.toLowerCase()}&timeSlot=${encodeURIComponent(
    delivery.timeSlot
  )}">
              Delivery ${delivery.id}: ${delivery.location}, ${
    delivery.timeSlot
  }
          </a>`;
  listElement.appendChild(listItem);
});
