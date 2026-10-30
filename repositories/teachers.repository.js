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
