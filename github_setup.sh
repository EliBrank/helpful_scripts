#!/bin/bash

read -p "Please enter your GitHub email: " gitEmail
read -p "Please enter your GitHub username: " gitUser

git config --global user.email "$gitEmail"
git config --global user.name "$gitUser"

