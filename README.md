# Noisu

Colaborative boards, no limits!

## Intro

This project is heavily based on Docker, and **after building the environment** you'd be unable to even execute Git locally due to Overcommit's hooks. To use it properly you'd be forced to do it inside the "web" container, so using the following "make" command will come in handy:

```bash
make web
```

That way you can type `gitac -m 'Some commit message'` inside the container to Git add+commit using one of its loaded aliases, or execute any other command.

To know other useful commands, execute "make" or inspect the "Makefile" file.

## Dependencies

- Development:
    * Docker Compose: https://docs.docker.com/compose/install/
    * Git: https://www.atlassian.com/es/git/tutorials/install-git
- Integration:
    * CircleCI-CLI: https://circleci.com/docs/2.0/local-cli/
- Deployment:
    * Heroku-CLI: https://devcenter.heroku.com/articles/heroku-cli#download-and-install

## Badges

[![Maintainability](https://api.codeclimate.com/v1/badges/565515be775b0f60382f/maintainability)](https://codeclimate.com/github/d-herrero/noisu/maintainability)

[![Test Coverage](https://api.codeclimate.com/v1/badges/565515be775b0f60382f/test_coverage)](https://codeclimate.com/github/d-herrero/noisu/test_coverage)