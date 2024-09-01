const express = require('express');
const app = express();
const routes = require('./routes');
const path = require('path');

app.set('view engine', 'ejs');  // Configura o EJS como motor de templates
app.set('views', path.join(__dirname, 'views'));

app.use(express.json());
app.use(express.static(path.join(__dirname, 'public')));
app.use('/api', routes);

app.listen(3000, () => {
  console.log('Server is running on http://localhost:3000');
});
