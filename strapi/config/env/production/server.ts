export default ({ env }) => ({
  proxy: true,
  url: env('HEROKU_URL'),
  app: {
    keys: env.array('APP_KEYS')
  },
});
