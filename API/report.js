const express = require('express');
const mysql = require('mysql2');

const app = express();
app.use(express.json());

const pool = mysql.createPool({
  host: 'localhost',
  user: 'root',
  password: 'password',
  database: 'biking',
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});

app.post('/report', (req, res) => {
  const { class: reportClass, name, problems, date } = req.body;
  pool.query(
    'INSERT INTO reports (class, name, problems, date) VALUES (?, ?, ?, ?)',
    [reportClass, name, problems, date],
    (error, results, fields) => {
      if (error) {
        console.error(error);
        res.sendStatus(500);
      } else {
        console.log('Report added:', results.insertId);
        res.sendStatus(200);
      }
    }
  );
});

app.listen(3000, () => {
  console.log('Server started on port 3000');
});