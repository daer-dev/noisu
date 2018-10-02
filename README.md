# Noisu

Colaborative boards, no limits!

## Development and provision

```bash
chmod +x bin/start.sh # Execute first to make the start script executable.
docker-compose run web bin/rails db:setup # To have the database ready.
docker-compose up # To run the entire environment.
```

## Some useful Heroku commands

```bash
heroku login # Identification with your user in Heroku.
heroku container:login
heroku create --app noisu # [OPTIONAL] App creation. Only needed the first time and if you're referring
heroku container:push --recursive --app noisu # Push container changes to the remote one.
heroku container:release web --app noisu # Deploy of these changes to the production environment.
heroku maintenance:off # Disables the maintenance mode, just in case.
heroku open --app noisu # Opens the app in a browser.
heroku maintenance:on # [OPTIONAL] Enables again the maintenance mode. Useful if you're changing DNS or in the test phase.
heroku logs --tail
heroku run rails console # To enter the remote Rails console. Any command could be executing followed by "heroku run": bash, rake, etc.
```
