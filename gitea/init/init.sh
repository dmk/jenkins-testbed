#!/bin/bash

set -xe

GITEA_URL="http://gitea:3000"
USERNAME="jenkins"
PASSWORD="changeme"
GITEA_GIT_URL="http://$USERNAME:$PASSWORD@gitea:3000"
EMAIL="jenkins@local"

# Configure git
git config --global init.defaultBranch main
git config --global user.email "$EMAIL"
git config --global user.name "$USERNAME"

#
until gitea admin user list && curl $GITEA_URL; do
    sleep 5;
done;

# Create user
gitea admin user create \
    --username $USERNAME --password $PASSWORD --email $EMAIL \
    --admin --must-change-password=false

GITEA_API_TOKEN=$(gitea admin user generate-access-token --raw --scopes all -u $USERNAME)

# Function to create a repository
create_repo() {
    local repo_name=$1
    curl -X POST "${GITEA_URL}/api/v1/user/repos?token=${GITEA_API_TOKEN}" \
        -H "Content-Type: application/json" \
        -d '{
            "name": "'${repo_name}'",
            "private": false
        }'
}

# Function to populate a repository with initial content
populate_repo() {
    local repo_name=$1
    cd "/init/repos/${repo_name}" || exit

    git config --global --add safe.directory /init/repos/$repo_name

    rm -rf .git

    git init
    git remote add origin "${GITEA_GIT_URL}/${USERNAME}/${repo_name}.git"
    git add .
    git commit -m "Initial commit"
    git push origin main

    rm -rf .git
    cd ..
}

# Create repositories
for dir in $(ls -1 /init/repos); do
    create_repo $dir
    populate_repo $dir
done
