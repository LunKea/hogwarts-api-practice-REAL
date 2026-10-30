import express from "express";
import * as studentsController from "../controllers/students.controller.js";

export const studentsRouter = express.Router();

studentsRouter.get("/", studentsController.getAllStudents);

studentsRouter.get("/:id", studentsController.getSingleStudents);

studentsRouter.post("/", studentsController.createStudent);

studentsRouter.delete("/:id", studentsController.deleteStudent);

studentsRouter.put("/:id", studentsController.updateStudent);
