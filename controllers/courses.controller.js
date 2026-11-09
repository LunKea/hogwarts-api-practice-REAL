import * as coursesRepository from "../repositories/courses.repository.js";

// get all courses
export const getAllCourses = async (req, res) => {
  try {
    const allCourses = await coursesRepository.getAllCourses();

    console.table(allCourses);
    res.json(allCourses);
  } catch (err) {
    console.log(err);
    res.status(500).json({ error: "database error", code: err.code });
  }
};

export const getSingleCourse = async (req, res) => {
  try {
    const singleCourse = await coursesRepository.getSingleCourse(req.params.id);
    if (!singleCourse) {
      return res.status(404).json({ error: "Course not found" });
    }
    res.status(200).json(singleCourse);
  } catch (err) {
    res.status(500).json({ error: "database error :/", code: err.code });
  }
};

export const createCourse = async (req, res) => {
  try {
    const newCourse = await coursesRepository.createCourse(req, res);
    res.status(202).json(newCourse);
  } catch (err) {
    res.status(500).json({ error: "database error :/", code: err.code });
  }
};

export const deleteCourse = async (req, res) => {
  const { id } = req.params;

  try {
    await coursesRepository.deleteCourse(id);
    return res.status(200).send("Course deleted");
  } catch (err) {
    res.status(500).json({ error: "database error :/", code: err.code });
  }
};

export const updateCourse = async (req, res) => {
  const { id } = req.params;

  try {
    const updatedCourse = await coursesRepository.updateCourse(id, req.body);

    if (!updatedCourse) {
      return res.status(404).json({ error: "Course not found" });
    }
    res.status(200).json(updatedCourse);
  } catch (err) {
    console.log(err);
    res.status(500).json({ error: "database error :/", code: err.code });
  }
};
