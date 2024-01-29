

function submitQRSetupForm(e) {
	e.preventDefault();
  
	var myform = document.getElementById("qr-setup-twofa-form");
  
	var formData = new FormData(myform);
  
	fetch("/post_twofa_code/", {
	  method: "POST",
	  body: formData,
	})
	  .then((response) => {
		if (!response.ok) {
		  throw new Error("network returns error");
		}
		return response.json();
	  })
	  .then((resp) => {
		let errElem = document.getElementById("qr-setup-error-msg");

		if (resp.isValid)
		{
			errElem.style["visibility"] = "hidden";

			return showSection("welcome_view", {}, true)
		}
		else 
		{
			errElem.style["visibility"] = "visible";
		}
	  })
	  .catch((error) => {
		// Handle error
	  });
  }

var myform = document.getElementById("qr-setup-twofa-form");

if (myform)
	myform.addEventListener("submit", submitQRSetupForm);

