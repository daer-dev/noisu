# Noisu

Colaborative boards, no limits!

## Development and provision

```bash
docker-compose up                                               # Builds and run the entire environment. Run with "--force-recreate" if needed.

docker-compose exec web bash                                    # To enter the CLI of the web container.
docker-compose run web bundle install --binstubs                # Installs new gems with their executable file in /bin.
docker-compose up --build                                       # Runs the entire environment building it first -again-.
```

## Docker commands

```bash
docker ps -a                                                    # Lists all the containers.
docker images                                                   # Lists all the images.
docker volume ls                                                # Lists all the volumes.

./scripts/reset-docker.sh                                       # Deletes all Docker's volumes and containers. Run with "--destroy-images" to delete them too.
```

## Heroku commands

```bash
heroku login                                                    # Identification with your user in Heroku.
heroku container:login
```

```bash
heroku create -a ENV['HEROKU_PROJECT_NAME']                     # [OPTIONAL] App creation. Only needed the first time and if you don't have the project created yet.
./scripts/send-env-to-heroku.sh                                 # Exports the environment vars to Heroku.
```

```bash
heroku container:push --recursive -a ENV['HEROKU_PROJECT_NAME'] # Push container changes to the remote one.
heroku container:release web -a ENV['HEROKU_PROJECT_NAME']      # Deploy of these changes to the production environment.

heroku maintenance:off -a ENV['HEROKU_PROJECT_NAME']            # Disables the maintenance mode, just in case.
heroku restart -a ENV['HEROKU_PROJECT_NAME']                    # Restarts the app.
heroku open -a ENV['HEROKU_PROJECT_NAME']                       # Opens the app in a browser.
heroku maintenance:on -a ENV['HEROKU_PROJECT_NAME']             # [OPTIONAL] Enables again the maintenance mode. Useful if you're changing DNS or in the test phase.
```

```bash
heroku logs --tail -a ENV['HEROKU_PROJECT_NAME']

heroku run rails console -a ENV['HEROKU_PROJECT_NAME']          # To enter into the remote Rails console.
heroku run bash -a ENV['HEROKU_PROJECT_NAME']                   # To enter into the server's terminal. Any command can be executed as if you were there like "heroku run INSERT_COMMAND_HERE -a ENV['HEROKU_PROJECT_NAME']".

heroku config -a ENV['HEROKU_PROJECT_NAME']                     # Value of every environment var available.
```
