// Get a reference to the date input field
		const dateInput = document.getElementById("date");

		// Add an event listener to the input field
		dateInput.addEventListener("change", function() {
			// Get the selected date value
			const selectedDate = new Date(dateInput.value);

			// Get today's date
			const today = new Date();

			// Compare the selected date with today's date
			if (selectedDate <= today) {
				// Valid date, do nothing
			} else {
				// Invalid date, reset the input field
				dateInput.value = "";
				alert("Please select a date that is today or earlier.");
			}
		});