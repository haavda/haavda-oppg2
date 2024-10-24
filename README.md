# haavda-oppg2

## How the whole process works
- You start of in one of the environment branches (dev/staging/prod), then you create a feature branch with the command: git checkout -b feature/name
- Then you create the feature/make the changes. Then you do the common prosedure with:
    - git add .
    - git commmit -m "Added x feature"
    - git push origin feature/name

- Then you go into the GitHub repo, and navigate to the repository. You will see a message "Compare & Pull Request". Click on this one. Select the base branch as the environment branch you want to pull the changes to, for example dev, stage or prod. Then click "Create Pull Request"

- Once this pull request is created the first workflow (pr-check.yml) starts automatically. This will do a review of the code created in the feature branch. It will perform terraform init, fmt, validate and tfsec. If all checks pass, then you are ready to merge. 

- Then go into the environment you chose as base branch in the pull request. Then do the merge with the command:
    - git merge feature/name

- After the merge you push the changes:
    - git push origin dev (if you are pushing to dev)

- Then the seccond workflow starts (main.yml) which does terraform plan and apply (with the terraform.tfvars file for the specific branch). This workflow also does init, fmt, validate, tfsec etc to be on the safe side. 

- For dev and staging, this workflows goes automaically. For prod you will recieve an email where you have to approve. 

## GitHub Repo
https://github.com/haavda/haavda-oppg2

