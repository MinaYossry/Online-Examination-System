# Online Examination System

This repository contains the source code for an online examination system that utilizes a MS SQL Server database. The system allows students to take exams, view their results, and browse through a catalog of available courses.

##### It is built using:

- Node.js
- Express.js
- MS SQL Server.

## ERD and Mapping

![](https://github.com/MinaYossry/Online-Examination-System/blob/master/ERD%20and%20Mapping/ERD.jpg)


The online examination system utilizes a relational database management system, specifically Microsoft SQL Server, to store and retrieve data.

The database is comprised of several tables that are linked together through relationships, as shown in the ERD diagram below.

The main tables in the database are:

- `Courses`: stores information about the different courses offered in the system, including the course ID and name.

- `Department`: stores information about the different departments, including the department ID, name, description, location, and manager ID.

- `Exam`: stores information about the exams, including the exam ID and name.

- `Exam_Answers`: stores answers given by students during exams, including the exam ID, student ID, question ID, and student's answer.

- `Exam_Questions`: stores information about the questions in an exam, including the exam ID, question ID, and question text.

- `Student`: stores information about the students, including the student ID, name, phone, email, street, city, department ID, and password.

The relationships between the tables are as follows:

- A `Department` can have many `Students`.

- A `Course` can have many `Exams`.

- An `Exam` can have many `Exam_Questions` and many `Exam_Answers`.

- A `Student` can have many `Exam_Answers`.

## Normalization

The database has been normalized to the third normal form (3NF) to ensure data integrity and reduce data redundancy. The process of normalization includes breaking down tables into smaller, more manageable tables and establishing relationships between them.

In this database, we have used foreign keys to establish relationships between tables. For example, the `Department_ID` column in the `Student` table is a foreign key referencing the `Dept_ID` column in the `Department` table.

Additionally, we have used the primary key-foreign key relationship to prevent insertion of duplicate and orphan data. For example, the `St_ID` column in the `Student` table is a primary key, and it is referenced by the `St_ID` column in the `Exam_Answers` table as a foreign key.

By using these techniques, we can ensure data consistency, minimize data redundancy, and improve the performance of the database.

## Demo of Web Application

![](https://github.com/MinaYossry/Online-Examination-System/blob/master/Application%20Demo.gif)

## Run Locally

Clone the repository to your local machine by running

```bash
  git clone https://github.com/MinaYossry/Online-Examination-System.git
```

Create a new SQL Server database and import the provided SQL file
Update the server.js file with your database credentials

Go to the project directory

```bash
  cd Online-Examination-System
```

Install dependencies

```bash
  npm install
```

Start the server

```bash
  npm server.js
```

## Features

- User authentication
- Exam creation and management
- Question creation and management
- Exam taking and grading

## Team Members

- [@Bassant Mahgoub](https://github.com/Bassant557)
- [@Raouf Alaadin](https://github.com/RaoufAlaadin)
- [@Eman Mohammed](https://github.com/eman120)
- [@Sara Gaber](https://github.com/SaraGaber19)
