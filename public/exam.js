function createMCQCard(question) {
    // Create card element
    const card = document.createElement("div");
    card.classList.add("card");
    card.classList.add("col-8");
    card.classList.add("m-2");

    // Create card body
    const cardBody = document.createElement("div");
    cardBody.classList.add("card-body");

    // Create card title
    const cardTitle = document.createElement("h5");
    cardTitle.classList.add("card-title");
    cardTitle.innerText = `Question ${question.number}`;

    // Create card text
    const cardText = document.createElement("p");
    cardText.classList.add("card-text");
    cardText.innerText = question.Q_Statement;

    // Create form element
    const form = document.createElement("form");
    form.classList.add("row")

    // Create radio buttons for each answer
    const answer1Card = document.createElement("div");
    answer1Card.classList.add("col-12");
    answer1Card.classList.add("col-md-6");
    answer1Card.classList.add("col-md-3");
    const answer1 = document.createElement("input");
    answer1.setAttribute("type", "radio");
    answer1.setAttribute("name", `question${question.Q_ID}`);
    answer1.setAttribute("value", question['Answer-1']);
    const label1 = document.createElement("label");
    label1.innerText = question['Answer-1'];
    answer1Card.appendChild(answer1);
    answer1Card.appendChild(label1);

    const answer2Card = document.createElement("div");
    answer2Card.classList.add("col-12");
    answer2Card.classList.add("col-md-6");
    answer2Card.classList.add("col-md-3");
    const answer2 = document.createElement("input");
    answer2.setAttribute("type", "radio");
    answer2.setAttribute("name", `question${question.Q_ID}`);
    answer2.setAttribute("value", question['Answer-2']);
    const label2 = document.createElement("label");
    label2.innerText = question['Answer-2'];
    answer2Card.appendChild(answer2);
    answer2Card.appendChild(label2);

    const answer3Card = document.createElement("div");
    answer3Card.classList.add("col-12");
    answer3Card.classList.add("col-md-6");
    answer3Card.classList.add("col-md-3");
    const answer3 = document.createElement("input");
    answer3.setAttribute("type", "radio");
    answer3.setAttribute("name", `question${question.Q_ID}`);
    answer3.setAttribute("value", question['Answer-3']);
    const label3 = document.createElement("label");
    label3.innerText = question['Answer-3'];
    answer3Card.appendChild(answer3);
    answer3Card.appendChild(label3);

    const answer4Card = document.createElement("div");
    answer4Card.classList.add("col-12");
    answer4Card.classList.add("col-md-6");
    answer4Card.classList.add("col-md-3");
    const answer4 = document.createElement("input");
    answer4.setAttribute("type", "radio");
    answer4.setAttribute("name", `question${question.Q_ID}`);
    answer4.setAttribute("value", question['Answer-4']);
    const label4 = document.createElement("label");
    label4.innerText = question['Answer-4'];
    answer4Card.appendChild(answer4);
    answer4Card.appendChild(label4);

    form.appendChild(answer1Card);
    form.appendChild(answer2Card);
    form.appendChild(answer3Card);
    form.appendChild(answer4Card);

    // Append elements to card body
    cardBody.appendChild(cardTitle);
    cardBody.appendChild(cardText);
    cardBody.appendChild(form);

    // Append card body to car
    card.appendChild(cardBody);

    return card;
}

function createTFQCard(question) {
    // Create card element
    const card = document.createElement("div");
    card.classList.add("card");
    card.classList.add("col-8");
    card.classList.add("m-2");

    // Create card body
    const cardBody = document.createElement("div");
    cardBody.classList.add("card-body");

    // Create card title
    const cardTitle = document.createElement("h5");
    cardTitle.classList.add("card-title");
    cardTitle.innerText = `Question ${question.number}`;

    // Create card text
    const cardText = document.createElement("p");
    cardText.classList.add("card-text");
    cardText.innerText = question.Q_Statement;

    // Create form element
    const form = document.createElement("form");
    form.classList.add("row")

    // Create radio buttons for each answer
    const answer1Card = document.createElement("div");
    answer1Card.classList.add("col-12");
    answer1Card.classList.add("col-md-6");
    answer1Card.classList.add("col-md-3");
    const answer1 = document.createElement("input");
    answer1.setAttribute("type", "radio");
    answer1.setAttribute("name", `question${question.Q_ID}`);
    answer1.setAttribute("value", "TRUE");
    const label1 = document.createElement("label");
    label1.innerText = "True";
    answer1Card.appendChild(answer1);
    answer1Card.appendChild(label1);

    const answer2Card = document.createElement("div");
    answer2Card.classList.add("col-12");
    answer2Card.classList.add("col-md-6");
    answer2Card.classList.add("col-md-3");
    const answer2 = document.createElement("input");
    answer2.setAttribute("type", "radio");
    answer2.setAttribute("name", `question${question.Q_ID}`);
    answer2.setAttribute("value", "FALSE");
    const label2 = document.createElement("label");
    label2.innerText = "False";
    answer2Card.appendChild(answer2);
    answer2Card.appendChild(label2);

    form.appendChild(answer1Card);
    form.appendChild(answer2Card);

    // Append elements to card body
    cardBody.appendChild(cardTitle);
    cardBody.appendChild(cardText);
    cardBody.appendChild(form);

    // Append card body to card
    card.appendChild(cardBody)

    return card;
}

function saveAnswers(questions) {
    const answers = [];
    questions.forEach(question => {
        const answer = document.querySelector(`input[name=question${question.Q_ID}]:checked`).value;
        answers.push({
            Q_ID: question.Q_ID,
            St_Answer: answer
        });
    });
    return answers;
}

let allQuestion;

document.getElementById("submit").addEventListener('click', function () {
    const exam_ID = localStorage.getItem("examId");
    const answers = saveAnswers(allQuestion);
    fetch('/exam_answers', {
        method: 'POST',
        body: JSON.stringify({
            exam_ID: exam_ID,
            answers: answers
        }),
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
});

let examId = localStorage.getItem("examId");
fetch("/exam", {
    method: "POST",
    body: JSON.stringify({
        Ex_ID: examId
    }),
    headers: {
        "Content-Type": "application/json"
    }
})
    .then(res => res.json())
    .then(data => {
        allQuestion = data;
        data.forEach(question => {
            let questionCard;

            if (question.Q_Type == 0)
                questionCard = createMCQCard(question);
            else
                questionCard = createTFQCard(question);


            document.querySelector("#questions-container").appendChild(questionCard);
        });
    })
    .catch(error => {
        console.log(error);
    });
