function togglePaymentFields(clickedCheckbox) {
    var cardPaymentCheckbox = document.getElementById('cardPayment');
    var cashOnDeliveryCheckbox = document.getElementById('cashOnDelivery');
    var cvvField = document.getElementById('cvvField');
    var accountNumberField = document.getElementById('accountNumberField');
    var cardHolderNameField = document.getElementById('cardPaymentFields');

    // Check if the clicked checkbox is "Card payment"
    if (clickedCheckbox === cardPaymentCheckbox) {
        // If "Card payment" is checked, uncheck "Cash On Delivery"
        if (cardPaymentCheckbox.checked) {
            cashOnDeliveryCheckbox.checked = false;
        }
    } else if (clickedCheckbox === cashOnDeliveryCheckbox) {
        // If "Cash On Delivery" is checked, uncheck "Card payment"
        if (cashOnDeliveryCheckbox.checked) {
            cardPaymentCheckbox.checked = false;
        }
    }

    cvvField.style.display = cardPaymentCheckbox.checked ? 'block' : 'none';
    accountNumberField.style.display = cardPaymentCheckbox.checked ? 'block' : 'none';
    cardHolderNameField.style.display = cardPaymentCheckbox.checked ? 'block' : 'none';
}


function showCard() {
	
	updateCurrentDate();
setInterval(updateCurrentDate, 1000);
	
  // Check if the required fields are filled
  var firstName = document.querySelector('input[name="firstname"]').value;
  var lastName = document.querySelector('input[name="lastname"]').value;
  var phone = document.querySelector('input[name="phone"]').value;

  // Check if at least one payment method is selected
  var cardPaymentCheckbox = document.getElementById('cardPayment');
  var cashOnDeliveryCheckbox = document.getElementById('cashOnDelivery');

  if (
    firstName.trim() === '' ||
    lastName.trim() === '' ||
    phone.trim() === '' 
  ) {
    alert('Please fill out all required fields before proceeding to card details.');
  } else if (!cardPaymentCheckbox.checked && !cashOnDeliveryCheckbox.checked) {
    alert('Please select at least one payment method.');
  } else {
    // Proceed to show the card details section
    document.getElementById('card').style.display = 'block';
  }
}

function cancelOverlay() {
    var overlay = document.getElementById('overlay');
    var card = document.getElementById('card');

    // Show a confirmation dialog
    var isConfirmed = confirm('Are you sure you want to cancel the order?');

    if (isConfirmed) {
 		// If not confirmed, simply hide the overlay
        overlay.style.display = 'none';
        card.style.display = 'none';
        
    }
}


function formatDate(date) {
    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, '0');
    const day = String(date.getDate()).padStart(2, '0');
    return `${year}-${month}-${day}`;
}

// Function to update the currentDate span with the current date
function updateCurrentDate() {
    const currentDateElement = document.getElementById('currentDate');
    const currentDate = new Date();
    currentDateElement.textContent = formatDate(currentDate);
}



