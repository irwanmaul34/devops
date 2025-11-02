import express from "express";
import mysql from "mysql2/promise";

const app = express();
const port = 3000;

// Ambil config dari environment
const dbConfig = {
  host: process.env.DB_HOST || "localhost",
  user: process.env.DB_USER || "root",
  password: process.env.DB_PASSWORD || "secret",
  database: process.env.DB_NAME || "myapp",
};

// Endpoint test koneksi DB
app.get("/test-db", async (req, res) => {
  try {
    const connection = await mysql.createConnection(dbConfig);
    const [rows] = await connection.query("SELECT NOW() AS now");
    await connection.end();

    res.json({
      status: "success",
      message: "Database connected!",
      time: rows[0].now,
    });
  } catch (err) {
    res.status(500).json({ status: "error", error: err.message });
  }
});

// Root endpoint
app.get("/", (req, res) => {
  res.send("Backend is running 🚀");
});

app.listen(port, () => {
  console.log(`Backend running on http://localhost:${port}`);
});
