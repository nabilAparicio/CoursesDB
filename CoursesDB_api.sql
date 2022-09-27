CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "name" varchar NOT NULL,
  "email" varchar NOT NULL,
  "password" varchar NOT NULL,
  "age" integer NOT NULL,
  "role" uuid NOT NULL,
  "is_active" bool DEFAULT true
);

CREATE TABLE "courses" (
  "id" uuid PRIMARY KEY,
  "title" varchar NOT NULL,
  "categorie" uuid NOT NULL,
  "description" text NOT NULL,
  "level" uuid NOT NULL,
  "teacher" uuid NOT NULL
);

CREATE TABLE "course_videos" (
  "id" uuid PRIMARY KEY,
  "title" varchar NOT NULL,
  "course_id" uuid NOT NULL,
  "url" varchar NOT NULL
);

CREATE TABLE "categories" (
  "id" uuid PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "roles" (
  "id" uuid PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "user_courses" (
  "id" uuid PRIMARY KEY,
  "curso_id" uuid NOT NULL,
  "user_id" uuid NOT NULL
);

CREATE TABLE "levels" (
  "id" uuid PRIMARY KEY,
  "level" varchar NOT NULL
);

ALTER TABLE "users" ADD FOREIGN KEY ("role") REFERENCES "roles" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("categorie") REFERENCES "categories" ("id");

ALTER TABLE "course_videos" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "user_courses" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "user_courses" ADD FOREIGN KEY ("curso_id") REFERENCES "courses" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("level") REFERENCES "levels" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("teacher") REFERENCES "users" ("id");

insert into levels 
values(
'da415183-c88e-4ed1-bdd8-8f94ebd778b3',
'principiantes'
),(
'd8c8f7b9-0e0c-48f3-81ab-9e735e960591',
'intermedio'
),(
'88fa3294-d267-4eff-9481-0f6142e37dd2',
'avanzado'
);

select * from levels;

insert into roles 
values(
'846fd48d-a7d8-46b2-897a-c360e82195d8',
'teacher'
),
(
'8b34e65b-82ae-4892-b63b-53ead1c48d3c',
'student'
),
(
'9b6b8499-33db-4bfe-8c29-43b27b32ad3a',
'admin'
);

select * from roles;

insert into categories
values(
'ad874ec5-bcfd-44d9-8fb3-6af396c69dd4',
'desarrollo web'
),(
'e62a0214-ed6b-4d05-bfe4-31d09c2bcb1b',
'analisis de datos'
),(
'2dd5d31a-6096-421c-895d-ee8406c36ff9',
'matematicas'
);

select * from categories;

insert into users (id, name, email, password, age, role, is_active )
values(
'0fc489b8-134a-4f76-bb06-5cda3e0c4f08',
'marieth',
'mariethl@gmail.com',
'pass1234',
24,
'8b34e65b-82ae-4892-b63b-53ead1c48d3c',
true
),
(
'8f992708-1b68-4a55-8798-6636d5e793be',
'Pucho',
'mariethl@gmail.com',
'pass1234',
37,
'846fd48d-a7d8-46b2-897a-c360e82195d8',
true
),
(
'0f586331-c758-4470-8d40-cc694239a881',
'orlando',
'orlando.nabil@gmail.com',
'pass1234',
25,
'9b6b8499-33db-4bfe-8c29-43b27b32ad3a',
false
);

select * from users;

insert into Courses (id, title, categorie, description, level, teacher)
values(
'6661ad83-7ff3-476f-954c-dda8c4b86bf4',
'como ser millonario en 3 sencillos pasos',
'2dd5d31a-6096-421c-895d-ee8406c36ff9',
'curso especial del master munos para hacerte millonario vendiendo cursos',
'da415183-c88e-4ed1-bdd8-8f94ebd778b3',
'8f992708-1b68-4a55-8798-6636d5e793be'
),
(
'0beabc23-2ad9-4712-bac4-4c522ffedbcf',
'como ser millonario en 2 sencillos pasos',
'e62a0214-ed6b-4d05-bfe4-31d09c2bcb1b',
'curso especial del master munos para hacerte millonario vendiendo cursos de analisis de datos',
'd8c8f7b9-0e0c-48f3-81ab-9e735e960591',
'8f992708-1b68-4a55-8798-6636d5e793be'
),
(
'c14e8c61-b2a0-47e5-81be-49b50011e3bb',
'como ser millonario en 1 sencillo pasos',
'ad874ec5-bcfd-44d9-8fb3-6af396c69dd4',
'curso especial del master munos para hacerte millonario vendiendo cursos de programacion',
'88fa3294-d267-4eff-9481-0f6142e37dd2',
'8f992708-1b68-4a55-8798-6636d5e793be'
);

select * from courses;

insert into user_courses (id, curso_id, user_id)
values(
'd564927a-65b7-418b-a404-3d94d66211d1',
'6661ad83-7ff3-476f-954c-dda8c4b86bf4',
'8f992708-1b68-4a55-8798-6636d5e793be'
),
(
'aff88d72-bd40-46ca-b070-f9a9df21c278',
'0beabc23-2ad9-4712-bac4-4c522ffedbcf',
'8f992708-1b68-4a55-8798-6636d5e793be'
),
(
'7b4a00d6-acc2-4d9c-8024-fcc8e11ac99c',
'c14e8c61-b2a0-47e5-81be-49b50011e3bb',
'8f992708-1b68-4a55-8798-6636d5e793be'
);

select * from user_courses;

insert into course_videos (id, title, course_id, url)
values(
'62b21a71-88e6-4013-8df6-8e8c67bcc10d',
'regueton para perrear hasta el sub-suelo mientras te haces millonario en 3 sencillos pasos',
'6661ad83-7ff3-476f-954c-dda8c4b86bf4',
'https://www.youtube.com/watch?v=lPDrWED1Eh4'
),
(
'5cd23cba-4201-4f7a-8d82-38f6a2026c19',
'rick roll para trolear mientras te haces millonario en 2 sencillos pasos',
'0beabc23-2ad9-4712-bac4-4c522ffedbcf',
'https://www.youtube.com/watch?v=dQw4w9WgXcQ'
),
(
'58c6a341-eef6-47a1-a458-aba6c23e0a0d',
'rock puro y duro mientras odias a la humanidad y te haces millonario en 1 sencillos pasos',
'c14e8c61-b2a0-47e5-81be-49b50011e3bb',
'https://www.youtube.com/watch?v=W3q8Od5qJio'
);

select * from course_videos;








