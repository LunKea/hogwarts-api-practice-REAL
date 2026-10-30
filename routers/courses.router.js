import express from "express";
import * as coursesController from "../controllers/courses.controller.js";

export const coursesRouter = express.Router();

coursesRouter.get("/", coursesController.getAllCourses);

coursesRouter.get("/:id", coursesController.getSingleCourse);

coursesRouter.post("/", coursesController.createCourse);

coursesRouter.delete("/:id", coursesController.deleteCourse);

coursesRouter.put("/:id", coursesController.updateCourse);
