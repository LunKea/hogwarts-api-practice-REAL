import express from "express";
import { pool } from "./db.js";
import { housesRouter } from "./routers/houses.router.js";
import { teachersRouter } from "./routers/teachers.router.js";
import { studentsRouter } from "./routers/students.router.js";
import { coursesRouter } from "./routers/courses.router.js";

const app = express();
const port = 3000;

app.use(express.urlencoded({ extended: true }));
app.use(express.json()); // parse JSON bodies

// get all houses
// app.get("/houses", async (req, res) => {
//   try {
//     const result = await pool.query("SELECT * FROM houses");

//     console.table(result.rows);
//     res.json(result.rows);
//   } catch (err) {
//     console.log(err);
//     res.status(500).json({ error: "database error", code: err.code });
//   }
// });

// Refere til houses routeren når URL'en bruger /houses
app.use("/houses", housesRouter);

//Teachers
app.use("/teachers", teachersRouter);

// Students
app.use("/students", studentsRouter);

// Courses
app.use("/courses", coursesRouter);

app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});
