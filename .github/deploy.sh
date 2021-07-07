set -euxo pipefail
branch=$1
if ! [ -e app ]; then
    git clone git@github.com:x-yuri/aws-express.git app
fi
cd app
git checkout "$branch"
git pull --rebase origin "$branch"
dc() {
    sudo /usr/local/bin/docker-compose -p "$USER" -f docker-compose-production.yml "$@";
}
dc build
dc up -d
