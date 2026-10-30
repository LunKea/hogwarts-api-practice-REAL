import * as studentsRepository from "../repositories/students.repository.js";

// get all students
export const getAllStudents = async (req, res) => {
  try {
    const allStudents = await studentsRepository.getAllStudents();

    console.table(allStudents);
    res.json(allStudents);
  } catch (err) {
    console.log(err);
    res.status(404).json({ error: "database error", code: err.code });
  }
};

export const getSingleStudents = async (req, res) => {
  try {
    const singleStudent = await studentsRepository.getSingleStudent(
      req.params.id,
    );
    if (singleStudent.rowCount === 0) return res.sendStatus(404);
    res.status(200).json(singleStudent.rows[0]);
  } catch (err) {
    res.status(404).json({ error: "database error :/", code: err.code });
  }
};

export const createStudent = async (req, res) => {
  try {
    const newStudent = await studentsRepository.createStudent(req, res);
    res.status(202).json(newStudent);
  } catch (err) {
    res.status(500).json({ error: "database error :/", code: err.code });
  }
};

export const deleteStudent = async (req, res) => {
  const { id } = req.params;

  try {
    await studentsRepository.deleteStudent(id);
    return res
      .status(200)
      .send("Sayonara (Goodbye in japanese) student-kun-chan");
  } catch (err) {
    res.status(500).json({ error: "database error :/", code: err.code });
  }
};
export const updateStudent = async (req, res) => {
  const { id } = req.params;

  try {
    const updatedStudent = await studentsRepository.updateStudent(id, req.body);

    if (updatedStudent.rowCount === 0) return res.sendStatus(404);
    res.status(200).json(updatedStudent.rows[0]);
  } catch (err) {
    console.log(err);
    res.status(500).json({ error: "database error :/", code: err.code });
  }
};
