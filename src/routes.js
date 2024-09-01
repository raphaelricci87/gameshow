const express = require('express');
const router = express.Router();
const pool = require('./db');
const path = require('path');

// Rota para o jogo de perguntas e respostas (mantido)
router.get('/question', async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM questions ORDER BY RANDOM() LIMIT 1');
    res.json(result.rows[0]);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

router.post('/answer', async (req, res) => {
  const { id, answer } = req.body;
  try {
    const result = await pool.query('SELECT correct_option FROM questions WHERE id = $1', [id]);
    if (result.rows[0].correct_option === answer) {
      res.json({ correct: true });
    } else {
      res.json({ correct: false });
    }
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

router.get('/image', async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM images ORDER BY RANDOM() LIMIT 1');
    res.json(result.rows[0]);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});


router.get('/image-reveal', async (req, res) => {
  try {
    res.sendFile(path.join(__dirname, 'public', 'image-reveal.html'));
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

router.get('/frames', async (req, res) => {
  try {
      res.sendFile(path.join(__dirname, 'public', 'frame.html'));
  } catch (err) {
      res.status(500).json({ error: err.message });
  }
});

router.get('/corrida', async (req, res) => {
  try {
      res.sendFile(path.join(__dirname, 'public', 'corrida_shihiro.html'));
  } catch (err) {
      res.status(500).json({ error: err.message });
  }
});


router.get('/frame-group', async (req, res) => {
  try {
      const groupResult = await pool.query(`
          SELECT group_name FROM (
              SELECT DISTINCT group_name FROM frame_groups
          ) AS distinct_groups
          ORDER BY RANDOM() LIMIT 1
      `);
      const groupName = groupResult.rows[0].group_name;

     
      const result = await pool.query('SELECT * FROM frame_groups WHERE group_name = $1 ORDER BY frame_order', [groupName]);
      res.json(result.rows);
  } catch (err) {
      res.status(500).json({ error: err.message });
  }
});

router.post('/check-frame-order', async (req, res) => {
  const { orderedFrames, groupName } = req.body;
  try {
      const result = await pool.query('SELECT image_path FROM frame_groups WHERE group_name = $1 ORDER BY frame_order', [groupName]);
      const correctFrames = result.rows.map(row => row.image_path);
      console.log(result);
      const correctOrder = orderedFrames.map((framePath, index) => framePath === correctFrames[index]);

      const correct = correctOrder.every(Boolean);
      res.json({ correct, correctOrder});
  } catch (err) {
      res.status(500).json({ error: err.message });
  }
});


module.exports = router;
