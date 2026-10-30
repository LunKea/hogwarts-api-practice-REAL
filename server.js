import express from "express";
import { pool } from "./db.js";
import { housesRouter } from "./routers/houses.router.js";
import { teachersRouter } from "./routers/teachers.router.js";

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

// ---- students ---- //

// get all students
app.get("/students", async (req, res) => {
  try {
    const result = await pool.query("SELECT * FROM students");

    console.table(result.rows);
    res.json(result.rows);
  } catch (err) {
    console.log(err);
    res.status(500).json({ error: "database error", code: err.code });
  }
});

// get specific student
app.get("/students/:id", async (req, res) => {
  try {
    const one = await pool.query("SELECT * FROM students WHERE id = $1", [
      req.params.id,
    ]);
    if (one.rowCount === 0) return res.sendStatus(404);
    res.status(200).json(one.rows[0]);
  } catch (err) {
    console.log(err);
    res.status(500).json({ error: "database error" });
  }
});

app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});
