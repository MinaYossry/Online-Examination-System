//select the login form
const loginForm = document.querySelector("#login-form");

//add event listener to the form
loginForm.addEventListener("submit", e => {
    e.preventDefault();
    //get the email and password from the form
    const email = document.querySelector("#St_Email").value;
    const password = document.querySelector("#password").value;
    //create an object to send to the server
    const data = {
        email,
        password
    };
    console.log(data);
    //send the login request to the server
    fetch("/api/student/login", {
        method: "POST",
        body: JSON.stringify(data),
        headers: {
            "Content-Type": "application/json"
        }
    })
        .then(response => {
            console.log(response);
            return response.json();
        })
        .then(data => {
            if (data.error) {
                alert(data.error);
            } else {
                // Convert the courses array to a string
                const coursesString = JSON.stringify(data);

                // Save the courses array in local storage
                localStorage.setItem('courses', coursesString);
                window.location.href = "courses.html";
            }
        });
});
