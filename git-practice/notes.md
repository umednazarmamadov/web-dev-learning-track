# Git Practice Notes

## Basic Commands

### Setup
git config --global user.name "Your Name"
git config --global user.email "your@email.com"

### Daily Workflow
git status          # check what changed
git add .           # stage all changes
git commit -m "msg" # save changes
git push            # upload to GitHub
git pull            # download latest changes

### Branches
git branch          # list branches
git branch feature  # create new branch
git checkout feature # switch to branch
git merge feature   # merge branch

## What I Learned
- Always write clear commit messages
- Commit small changes frequently
- Pull before pushing to avoid conflicts
- Use branches for new features