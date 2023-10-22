import express from "express";
import cors from "cors";
import recoverRouter from "./controller/recover.js";

const app = express();
app.use(express.json());
app.use(cors());

app.use("/recover", recoverRouter);

app.listen(8888, () => {
  console.log(`Server started on port ${8888}`);
});
