#!/bin/bash
# Chris Gibs 2020
# Automates git pushing with message input

echo "Initialising push..."
git add .
git status
echo "Please type the commit message: "
read message
echo "Committing..."
git commit -m "$message"
git log
echo "Pushing to Github..."
git push -u origin main
echo "All done!"