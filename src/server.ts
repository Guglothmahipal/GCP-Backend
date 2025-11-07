import express from "express";
import dotenv from "dotenv";
import { pool } from "./db.js";
import cors from "cors";

dotenv.config();

const app = express();
app.use(express.json());
app.use(cors());

// ✅ Health check
app.get("/api/health", (req, res) => {
  res.json({ status: "ok" });
});

// ✅ Test route to fetch projects
app.get("/api/projects", async (req, res) => {
  try {
    const [rows] = await pool.query("SELECT * FROM projects");
    res.json(rows);
  } catch (error) {
    console.error("Error fetching projects:", error);
    res.status(500).json({ message: "Internal server error" });
  }
});

const port = process.env.PORT || 7070;
app.listen(port, () => console.log(`✅ Server running on http://localhost:${port}`));
console.log("📦 Connected to DB:", process.env.DB_HOST, process.env.DB_PORT);

