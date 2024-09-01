const { Pool } = require('pg');

const pool = new Pool({
  user: 'quizuser',
  host: 'localhost',
  database: 'quizdb',
  password: 'quizpassword',
  port: 5432,
});

module.exports = pool;
