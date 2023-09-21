const tabBtn = document.querySelectorAll(".nav ul li");
const tab = document.querySelectorAll(".tab");

function tabs(panelIndex) {
	tab.forEach(function(node) {
		node.style.display = "none";
	});
	tab[panelIndex].style.display = "block";
	tabBtn.forEach(function(node) {
		node.classList.remove("active");
	});
	tabBtn[panelIndex].classList.add("active");
}

// Add event listeners to the tabs to update the content
tabBtn[0].addEventListener("click", function() {
	tabs(0);
	updateContent(0);
});

tabBtn[1].addEventListener("click", function() {
	tabs(1);
	updateContent(1);
});

document.addEventListener("DOMContentLoaded", function() {
	let menuBtn = document.getElementById("menuBtn");
	let sideNav = document.getElementById("sideNav");

	sideNav.style.right = "-250px";

	menuBtn.onclick = function() {
		if (sideNav.style.right === "-250px") {
			sideNav.style.right = "0";
		} else {
			sideNav.style.right = "-250px";
		}
	}

});


