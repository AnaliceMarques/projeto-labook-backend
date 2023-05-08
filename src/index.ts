import express from "express";
import cors from "cors";
import { userRouter } from "./router/userRouter";
import { postRouter } from "./router/postRouter";
import dotenv from "dotenv";

dotenv.config();

const app = express();

app.use(cors());
app.use(express.json());

app.listen(Number(process.env.PORT) || 3003, () =>
  console.log(`Servidor rodando na porta ${Number(process.env.PORT) || 3003}`)
);

app.use("/users", userRouter);
app.use("/posts", postRouter);

app.get("/ping", async (req, res) => {
  try {
    res.status(200).send("Pong!");
  } catch (error) {
    console.log(error);
  }
});
