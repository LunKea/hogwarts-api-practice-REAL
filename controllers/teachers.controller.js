import * as teachersRepository from "../repositories/teachers.repository.js";

// get all teachers
export const getAllTeachers = async (req, res) => {
  try {
    const allTeachers = await teachersRepository.getAllTeachers();

    console.table(allTeachers);
    res.json(allTeachers);
  } catch (err) {
    console.log(err);
    res.status(500).json({ error: "database error", code: err.code });
  }
};

export const getSingleTeachers = async (req, res) => {
  try {
    const singleTeacher = await teachersRepository.getSingleTeacher(
      req.params.id,
    );
    if (singleTeacher.rowCount === 0) return res.sendStatus(404);
    res.status(200).json(singleTeacher.rows[0]);
  } catch (err) {
    res.status(500).json({ error: "database error :/", code: err.code });
  }
};
