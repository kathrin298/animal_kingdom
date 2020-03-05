import 'flatpickr/dist/flatpickr.min.css'

// First we define two variables that are going to grab our inputs field. You can check the ids of the inputs with the Chrome inspector.
const startDateInput = document.getElementById('booking_start_date');
const endDateInput = document.getElementById('booking_end_date');

// Check that the query selector id matches the one you put around your form.
if (startDateInput) {
const unavailableDates = JSON.parse(document.querySelector('#animal-booking-dates').dataset.unavailable)

const newUnavailableDates = unavailableDates.filter((uDate) => {
  if (uDate.from !== startDateInput.value) {
    return uDate;
  }
})

endDateInput.disabled = true

flatpickr(startDateInput, {
  minDate: "today",
  disable: newUnavailableDates,
  dateFormat: "Y-m-d",
});

startDateInput.addEventListener("change", (e) => {
  if (startDateInput != "") {
    endDateInput.disabled = false
  }
  flatpickr(endDateInput, {
    minDate: e.target.value,
    disable: newUnavailableDates,
    dateFormat: "Y-m-d"
    });
  })
};
