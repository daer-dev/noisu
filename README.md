# Noisu

Colaborative boards, no limits!

## Development and provision

```bash
chmod +x bin/*.sh # Execute first to make all custom scripts executable.
docker-compose run web bin/rails db:setup # To have the database ready.
docker-compose up # To run the entire environment.
```

## Some useful Heroku commands

```bash
heroku login # Identification with your user in Heroku.
heroku container:login
```

```bash
heroku create -a ENV['HEROKU_PROJECT_NAME'] # [OPTIONAL] App creation. Only needed the first time and if you don't have the project created yet.
./bin/env_vars_to_heroku.sh # Exports the environment vars to Heroku.
```

```bash
heroku container:push --recursive -a ENV['HEROKU_PROJECT_NAME'] # Push container changes to the remote one.
heroku container:release web -a ENV['HEROKU_PROJECT_NAME'] # Deploy of these changes to the production environment.

heroku maintenance:off -a ENV['HEROKU_PROJECT_NAME'] # Disables the maintenance mode, just in case.
heroku restart -a ENV['HEROKU_PROJECT_NAME'] # Restarts the app.
heroku open -a ENV['HEROKU_PROJECT_NAME'] # Opens the app in a browser.
heroku maintenance:on -a ENV['HEROKU_PROJECT_NAME'] # [OPTIONAL] Enables again the maintenance mode. Useful if you're changing DNS or in the test phase.
```

```bash
heroku logs --tail -a ENV['HEROKU_PROJECT_NAME']

heroku run rails console -a ENV['HEROKU_PROJECT_NAME'] # To enter into the remote Rails console.
heroku run bash -a ENV['HEROKU_PROJECT_NAME'] # To enter into the server's terminal. Any command can be executed as if you were there like "heroku run INSERT_COMMAND_HERE -a ENV['HEROKU_PROJECT_NAME']".

heroku config -a ENV['HEROKU_PROJECT_NAME'] # Value of every environment var available.
```
