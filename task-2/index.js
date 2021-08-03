const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const appRouter = require('./routes.js')(app);

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

const server = app.listen(3101, () => {
    console.info('listening on port %s...', server.address().port);
});
