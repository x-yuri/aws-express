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
* type "ubuntu" and press Enter
* choose Ubuntu Server 20.04 LTS (HVM), SSD Volume Type - ami-05f7491af5eef733a (64-bit x86)
* (step 2) t2.micro (the default)
* (step 6) choose Create a new security group
* specify a name and a description
* create 2 records:
    * ssh tcp 22 0.0.0.0/0
    * http tcp 80 my ip

On the server:

```
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
$ echo \
"deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
$ sudo apt update
$ sudo apt install docker-ce docker-compose
$ sudo usermod -aG docker ubuntu
// relogin
$ ssh-keyscan github.com >> ~/.ssh/known_hosts
$ ssh-keygen
```

Also:

* Add the ssh key to `~/.ssh/authorized_keys`, GitHub secrets (`SSH_PRIVATE_KEY`), and deploy keys.
* Update the `USER_HOST` and `HOST_KEY` variables in `.github/workflows/deploy.yml`.
