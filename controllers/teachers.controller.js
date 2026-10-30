import * as teachersRepository from "../repositories/teachers.repository.js";

// get all teachers
export const getAllTeachers = async (req, res) => {
  try {
    const allTeachers = await teachersRepository.getAllTeachers();

    console.table(allTeachers);
    res.json(allTeachers);
  } catch (err) {
    console.log(err);
    res.status(404).json({ error: "database error", code: err.code });
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
    res.status(404).json({ error: "database error :/", code: err.code });
  }
};

export const createTeacher = async (req, res) => {
  try {
    const newTeacher = await teachersRepository.createTeacher(req, res);
    res.status(202).json(newTeacher);
  } catch (err) {
    res.status(500).json({ error: "database error :/", code: err.code });
  }
};

export const deleteTeacher = async (req, res) => {
  const { id } = req.params;

  try {
    await teachersRepository.deleteTeacher(id);
    return res.status(200).send("teacher deleted");
  } catch (err) {
    res.status(500).json({ error: "database error :/", code: err.code });
  }
};
