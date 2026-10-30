import { pool } from "../db.js";

// Function for all students :3
export const getAllStudents = async () => {
  const list = await pool.query("SELECT * FROM students");

  return list.rows;
};

// Function for a singular student :3c
export const getSingleStudent = async (id) => {
  const singular = await pool.query("SELECT * FROM students WHERE id = $1", [
    id,
  ]);

  return singular;
};

// Create new student in database ^^

export const createStudent = async (req, res) => {
  const { name, year, house_id } = req.body;

  const newStudent = await pool.query(
    "INSERT INTO students (name, year, house_id) VALUES ($1, $2, $3) RETURNING *",
    [name, year, house_id],
  );

  return newStudent.rows[0];
};

// Delete a student from the database :3c
export const deleteStudent = async (id) => {
  const deletedStudent = await pool.query(
    "DELETE FROM students WHERE id = $1 RETURNING *",
    [id],
  );
  return deletedStudent.rows[0];
};

// Updates a student
export const updateStudent = async (id, student) => {
  const { name, year, house_id } = student;

  const updatedStudent = await pool.query(
    "UPDATE students SET name = $1, year = $2, house_id = $3 WHERE id = $4 RETURNING *",
    [name, year, house_id, id],
  );
  return updatedStudent;
};
