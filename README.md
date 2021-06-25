## Running locally

```
$ docker-compose pull
$ docker-compose build
$ docker-compose run --rm app npm install
$ docker-compose up -d
$ docker-compose ps
```

`.env` file variables:

`UID` - id of the user to run under in the container (default: 1000)
