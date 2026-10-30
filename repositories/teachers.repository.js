import { pool } from "../db.js";

// Function for all teachers :3
export const getAllTeachers = async () => {
  const list = await pool.query("SELECT * FROM teachers");

  return list.rows;
};

// Function for a singular teacher :3c
export const getSingleTeacher = async (id) => {
  const singular = await pool.query("SELECT * FROM teachers WHERE id = $1", [
    id,
  ]);

  return singular;
};

// Create new teacher in database ^^

export const createTeacher = async (req, res) => {
  const { name, house_id, courses_id } = req.body;

  const newTeacher = await pool.query(
    "INSERT INTO teachers (name, house_id, courses_id) VALUES ($1, $2, $3) RETURNING *",
    [name, house_id, courses_id],
  );

  return newTeacher.rows[0];
};

// Delete a teacher from the database :3c
export const deleteTeacher = async (id) => {
  const deletedTeacher = await pool.query(
    "DELETE FROM teachers WHERE id = $1 RETURNING *",
    [id],
  );
  return deletedTeacher.rows[0];
};
