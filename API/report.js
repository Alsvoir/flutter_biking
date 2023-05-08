const express = require('express');
const mysql = require('mysql2');
const { Server } = require('ws');

const wss = new server({ server })
const app = express();
app.use(express.json());

const pool = mysql.createPool({
  host: 'localhost',
  port: 3333,
  user: 'root',
  password: 'root',
  database: 'rpl',
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});


app.post('/report', (req, res) => {
  const { class: kelas, nama, masalah, tanggal } = req.body;
  pool.query(
    'INSERT INTO reports (kelas, nama, masalah, tanggal) VALUES (?, ?, ?, ?)',
    [kelas, nama, masalah, tanggal],
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