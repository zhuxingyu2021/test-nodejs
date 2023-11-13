import {Router} from "express";

const router = Router();

router.get("/", (req, res) => {
    console.log("HELLO_WORLD 200")
    res.json({message: "Hello world"})
})

router.get("/health", (req, res) => {
    console.log("HEALTH 200")
    res.status(200).json({message: "Everything is good here"})
})

export default router;
