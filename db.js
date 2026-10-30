import "dotenv/config";

import { Pool } from "pg";

// require("dotenv").config();
// const { Pool } = require("pg");

export const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
});

// module.exports = pool;
