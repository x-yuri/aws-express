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

## Provisioning

In the AWS console:

* click Launch instances
* (step 1) check Free tier only
* type "red hat" and press Enter
* choose Red Hat Enterprise Linux 8 with High Availability - ami-06ec8443c2a35b0ba
* (step 2) t2.micro (the default)
* (step 6) choose Create a new security group
* specify a name and a description
* create 2 records:
    * ssh tcp 22 0.0.0.0/0
    * http tcp 80 my ip

On the server:

```
$ sudo dnf install docker git
$ sudo systemctl enable --now podman.socket
$ sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
$ sudo chmod u+x /usr/local/bin/docker-compose
$ ssh-keyscan github.com >> ~/.ssh/known_hosts
$ ssh-keygen
```

Also:

* Add the ssh key to `~/.ssh/authorized_keys`, GitHub secrets (`SSH_PRIVATE_KEY`), and deploy keys.
* Update the `USER_HOST` and `HOST_KEY` variables in `.github/workflows/deploy.yml`.
