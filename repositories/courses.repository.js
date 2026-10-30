import { pool } from "../db.js";

// Function for all courses :3
export const getAllCourses = async () => {
  const list = await pool.query("SELECT * FROM courses");

  return list.rows;
};

// Function for a singular course :3c
export const getSingleCourse = async (id) => {
  const singular = await pool.query("SELECT * FROM courses WHERE id = $1", [
    id,
  ]);

  return singular;
};

// Create new course in database ^^

export const createCourse = async (req, res) => {
  const { name, year, house_id } = req.body;

  const newCourse = await pool.query(
    "INSERT INTO courses (name, year, house_id) VALUES ($1, $2, $3) RETURNING *",
    [name, year, house_id],
  );

  return newCourse.rows[0];
};

// Delete a course from the database :3c
export const deleteCourse = async (id) => {
  const deletedCourse = await pool.query(
    "DELETE FROM courses WHERE id = $1 RETURNING *",
    [id],
  );
  return deletedCourse.rows[0];
};

// Updates a course
export const updateCourse = async (id, course) => {
  const { name, year, house_id } = course;

  const updatedCourse = await pool.query(
    "UPDATE courses SET name = $1, year = $2, house_id = $3 WHERE id = $4 RETURNING *",
    [name, year, house_id, id],
  );
  return updatedCourse;
};
