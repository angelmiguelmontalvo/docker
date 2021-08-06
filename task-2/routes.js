const execute = require('./utils');

const appRouter = (app) => {
  app.get('/', async (req, res) => {
      const result = await execute();
      console.info(result);
      res.json(result);
  });
};

module.exports = appRouter;
