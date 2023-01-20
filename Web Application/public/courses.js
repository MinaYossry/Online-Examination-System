const courses = JSON.parse(localStorage.getItem("courses"));
const coursesList = document.querySelector("#courses");

courses.forEach(course => {
    const courseItem = document.createElement("a");
    courseItem.classList.add("list-group-item", "list-group-item-action");
    courseItem.setAttribute("data-course-id", course.Crs_ID);
    courseItem.innerHTML = course.Cr_Name;
    coursesList.appendChild(courseItem);
});

document.getElementById("grades").addEventListener("click", function (event) {
    fetch('/see_grades', {
        method: 'POST',
        body: JSON.stringify({}),
        headers: { 'Content-Type': 'application/json' }
    })
        .then(res => res.json())
        .then(data => {
            localStorage.setItem('grades', JSON.stringify(data));
            window.location.href = "grade.html";
        })
        .catch(error => {
            console.error('Error:', error);
        });
})

// Add a click event listener to each course list item
coursesList.addEventListener('click', function (event) {
    // Check if the clicked element is a course list item
    if (event.target.classList.contains("list-group-item")) {
        // Get the course id from the clicked element
        const courseId = event.target.getAttribute("data-course-id");

        // Call the generate_exam stored procedure
        fetch('/generate_exam', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                Crs_ID: courseId,
                num_mcq: 7,
                num_tf: 3
            })
        }).then(response => response.json()).then(data => {
            let examId = data.exam_id;
            localStorage.setItem("examId", examId);
            // OR let examId = data.exam_ID;
            // Redirect to the next HTML page
            window.location.href = "exam.html";
        }).catch(error => {
            console.error('Error:', error);
        });
    }
});
