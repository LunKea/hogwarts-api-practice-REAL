import express from "express";
import * as teachersController from "../controllers/teachers.controller.js";

export const teachersRouter = express.Router();

teachersRouter.get("/", teachersController.getAllTeachers);

teachersRouter.get("/:id", teachersController.getSingleTeachers);

teachersRouter.post("/", teachersController.createTeacher);

teachersRouter.delete("/:id", teachersController.deleteTeacher);

teachersRouter.put("/:id", teachersController.updateTeacher);
