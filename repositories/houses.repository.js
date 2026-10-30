import { pool } from "../db.js";

// Function for all houses :3
export const getAllHouses = async () => {
  const list = await pool.query("SELECT * FROM houses");

  return list.rows;
};

// Function for a singular house :3c
export const getSingleHouse = async (id) => {
  const singular = await pool.query("SELECT * FROM houses WHERE id = $1", [id]);

  return singular;
};
