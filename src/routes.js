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

router.get('/fortune-coyote', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'fortune-coyote.html'));
});


// API route for spinning the reels
// API route for spinning the reels
router.post('/fortune-coyote/spin', async (req, res) => {
  try {
    const symbols = ['🍒', '🍋', '🍊', '🍉', '⭐', '🐺', '🔔'];

    // Simulate the reel spins
    let reel1 = symbols[Math.floor(Math.random() * symbols.length)];
    let reel2 = symbols[Math.floor(Math.random() * symbols.length)];
    let reel3 = symbols[Math.floor(Math.random() * symbols.length)];

    // Initialize the win flag and score
    let win = false;
    let score = 0;

    // Determine win or loss with 20% chance of guaranteed win
    if (Math.random() < 0.9) {
        win = true;
        // Force a win by setting all reels to the same symbol
        reel2 = reel1;
        reel3 = reel1;
    } else {
        win = (reel1 === reel2) && (reel2 === reel3);
    }

    // Calculate the score based on the symbols
    if (win) {
      if (reel1 === '🐺') {
        score = 1000;
      } else if (reel1 === '⭐') {
        score = 500;
      } else if (reel1 === '🍉') {
        score = 300;
      } else if (reel1 === '🍊') {
        score = 200;
      } else if (reel1 === '🍋') {
        score = 100;
      } else if (reel1 === '🍒') {
        score = 50;
      } else if (reel1 === '🔔') {
        score = 75;
      }
    }

    // Return the response as JSON
    res.json({ reel1, reel2, reel3, win, score });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});





module.exports = router;
