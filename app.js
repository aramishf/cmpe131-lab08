const express = require('express');
const path = require('path');

const app = express();
const port = 3000;

// Serve static files from the project directory
app.use(express.static(__dirname));

// Serve index.html at the root path
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'index.html'));
});

// Only listen when run directly (not when required by tests)
if (require.main === module) {
  app.listen(port, () => {
    console.log(`Server listening at http://localhost:${port}`);
  });
}

module.exports = app;
