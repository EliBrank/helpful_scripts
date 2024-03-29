#!/bin/bash

read -p "Please paste your GitHub token: " gitToken
read -p "Please paste in the link to the GitHub repo you wish to clone: " gitRepo

gitRepo=$(echo "$gitRepo" | sed 's|https://||')
repoName=$(echo ${gitRepo%.git} | awk -F "/" '{print $NF}')

git clone https://$gitToken@$gitRepo ~/$repoName
