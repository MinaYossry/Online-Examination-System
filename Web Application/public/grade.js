const grades = JSON.parse(localStorage.getItem("grades"));
const container = document.getElementById("grades-container");

grades.forEach(grade => {
    const card = document.createElement("div");
    card.classList.add("card");
    card.classList.add("col-8");
    card.classList.add("col-md-4");
    card.classList.add("m-2");

    const cardBody = document.createElement("div");
    cardBody.classList.add("card-body");

    const cardTitle = document.createElement("h5");
    cardTitle.classList.add("card-title");
    cardTitle.innerText = grade.Cr_Name;

    const cardText = document.createElement("p");
    cardText.classList.add("card-text");
    cardText.innerHTML = `<b>Instructor:</b> ${grade.Ins_Name} <br> <b>Grade:</b> ${grade.St_Grade}`;

    cardBody.appendChild(cardTitle);
    cardBody.appendChild(cardText);

    card.appendChild(cardBody);

    container.appendChild(card);
})
