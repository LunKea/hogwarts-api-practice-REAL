import express from "express";
import * as housesController from "../controllers/houses.controller.js";

export const housesRouter = express.Router();

housesRouter.get("/", housesController.getAllHouses);

housesRouter.get("/:id", housesController.getSingleHouses);
