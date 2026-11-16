// Function for a singular teacher :3c
export const getSingleTeacher = async (id) => {
  const singular = await pool.query(`SELECT * FROM teachers WHERE id = $1`, [
    id,
  ]);

  return singular.rows[0];
};

// Create new teacher in database ^^
export const createTeacher = async (teacher) => {
  const { name, house_id, courses_id } = teacher;

  const newTeacher = await pool.query(
    `INSERT INTO teachers (name, house_id, courses_id)
     VALUES ($1, $2, $3)
     RETURNING *`,
    [name, house_id, courses_id],
  );

  return newTeacher.rows[0];
};

// Delete a teacher from the database :3c
export const deleteTeacher = async (id) => {
  const deletedTeacher = await pool.query(
    `DELETE FROM teachers WHERE id = $1 RETURNING *`,
    [id],
  );

  return deletedTeacher.rows[0];
};

// Updates a teacher - OLD
export const updateTeacher = async (id, teacher) => {
  const { name, house_id, courses_id } = teacher;

  const updatedTeacher = await pool.query(
    `UPDATE teachers
     SET name = $1, house_id = $2, courses_id = $3
     WHERE id = $4
     RETURNING *`,
    [name, house_id, courses_id, id],
  );

  return updatedTeacher.rows[0];
};
