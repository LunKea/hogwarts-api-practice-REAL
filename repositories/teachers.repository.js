import { pool } from "../db.js";
import HTTPError from "../errorhandlers/HTTPErrors.js";

// Function for all teachers :3
export const getAllTeachers = async () => {
  const list = await pool.query(`SELECT teachers.id, teachers.name, houses.name
                                  FROM teachers
                                  JOIN houses
                                  ON teachers.house_id = houses.id`);

  return list.rows;
};

// Function for a singular teacher :3c
export const getSingleTeacher = async (id) => {
  const singular = await pool.query("SELECT * FROM teachers WHERE id = $1", [
    id,
  ]);

  return singular.rows[0];
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

// Updates a teacher - OLD
// export const updateTeacher = async (id, teacher) => {
//   const { name, house_id, courses_id } = teacher;

//   const updatedTeacher = await pool.query(
//     "UPDATE teachers SET name = $1, house_id = $2, courses_id = $3 WHERE id = $4 RETURNING *",
//     [name, house_id, courses_id, id],
//   );

//   return updatedTeacher;
// };

// Update teacher with NEW
const id = req.params.id;
const { name, house } = req.body;

const updatedTeacher2 = await reportory.updateTeacher(id, { name, house });

if (updatedTeacher2.rowCount) {
  return res.send(201).json(updatedTeacher2);
} else {
  throw new HTTPError(404, "Teacher not found");
}

// ZOD EXTENSION JOINING IN
export async function updateTeacher2(req, res) {
  const id = req.params.id;
  const data = req.body;

  const teacher = UpdatedTeacherDTO.parse(data);

  const updatedTeacher = await repository.updateTeacher(id, teacher);

  if (updateTeacher) {
    return res.send(201).json(updatedTeacher);
  } else {
    throw new HTTPError(404, "Teacher not found");
  }
}
