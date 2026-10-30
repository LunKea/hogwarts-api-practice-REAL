import express from "express";
import * as teachersController from "../controllers/teachers.controller.js";

export const teachersRouter = express.Router();

teachersRouter.get("/", teachersController.getAllTeachers);

teachersRouter.get("/:id", teachersController.getSingleTeachers);
