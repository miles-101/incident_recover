import express from "express";
import { exec } from "child_process";
import path from "path";

const router = express.Router();

router.get("/", async (req, res) => {
  const scriptPath = path.join(__dirname, "../../recover.sh");

  exec(scriptPath, (error, stdout, stderr) => {
    if (error) {
      console.error(`Error: ${error}`);
      return res.status(500).send("Internal Server Error");
    }
    console.log(`Script output: ${stdout}`);
    res.send("Script executed successfully");
  });
});

export default router;
