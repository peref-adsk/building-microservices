import express, { Request, Response, Application } from 'express';
import dotenv from 'dotenv';
import axios from 'axios';

dotenv.config();

const app: Application = express();
const port = process.env.PORT || 8000;

app.get('/', async (req: Request, res: Response) => {
    res.send('Welcome to Express & TypeScript Server');
})

app.get('/carts', async (req: Request, res: Response) => {
   try {
        const response = await axios.get('http://localhost/carts');
        res.send(`This is the carts service response: ${response.data}`);
    } catch (error: any) {
        res.send(`Internal error: ${error.message}`);
    }
})

app.listen(port, () => {
    console.log(`Server is Fire at port: ${port}`);
})