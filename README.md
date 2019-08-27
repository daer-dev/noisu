# Noisu

Colaborative boards, no limits!

## Intro

This project is heavily based on Docker, and after building the environment you'd be unable to even execute Git locally due to Overcommit's hooks. To use it properly you'd be forced to do it inside the "web" container, so adding this alias to your host machine will come in handy:

```bash
echo 'alias noisu='docker-compose run --no-deps --rm web bash -l' >> ~/.bash_aliases
```

That way, you could type `noisu` to enter the container and `gitac -m 'Some commit message'` to Git add+commit using one of its loaded aliases.

## Useful commands

Command cheat-sheet to make the dev life less painful:

### Docker

```bash
docker-compose up                                               # Builds and runs the entire environment. Run with "--force-recreate" or "--build" if needed.
docker-compose exec container_name bash -l                      # To enter to the CLI of a container.
noisu bundle install --binstubs                                 # Installs new gems with their executable file in /bin.
docker system prune -af --volumes                               # Deletes all Docker's containers, networks, volumes, images and cache.
docker ps -a                                                    # Lists all the containers.
docker images                                                   # Lists all the images.
docker volume ls                                                # Lists all the volumes.
```

### Heroku

* Identification:

```bash
heroku login                                                    # User login in Heroku.
heroku container:login                                          # Container registry.
```

* To be used -probably- only once:

```bash
heroku create -a ENV['HEROKU_PROJECT_NAME']                     # [OPTIONAL] App creation. Only needed the first time and if you don't have the project created yet.
./docker/scripts/send-env-to-heroku.sh                          # Exports the environment vars to Heroku.
```

* Deployment:

```bash
heroku container:push --recursive -a ENV['HEROKU_PROJECT_NAME'] # Push container changes to the remote one.
heroku container:release web -a ENV['HEROKU_PROJECT_NAME']      # Deploy of these changes to the production environment.

heroku maintenance:off -a ENV['HEROKU_PROJECT_NAME']            # Disables the maintenance mode, just in case.
heroku restart -a ENV['HEROKU_PROJECT_NAME']                    # Restarts the app.
heroku open -a ENV['HEROKU_PROJECT_NAME']                       # Opens the app in a browser.
heroku maintenance:on -a ENV['HEROKU_PROJECT_NAME']             # [OPTIONAL] Enables again the maintenance mode. Useful if you're changing DNS or in the test phase.
```

* Debugging:

```bash
heroku logs --tail -a ENV['HEROKU_PROJECT_NAME']

heroku run rails console -a ENV['HEROKU_PROJECT_NAME']          # To enter into the remote Rails console.
heroku run bash -a ENV['HEROKU_PROJECT_NAME']                   # To enter into the server's terminal. Any command can be executed as if you were there like "heroku run INSERT_COMMAND_HERE -a ENV['HEROKU_PROJECT_NAME']".

heroku config -a ENV['HEROKU_PROJECT_NAME']                     # Returns the value of every environment var available.
```
