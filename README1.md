## Ways to clone github repo
HTTPS, SSH, Github CLI

Install the github cli just like other linux commands

```sh
### not added GPG keys and apt-repo command here
sudo apt update
sudo apt install gh -y

gh auth login  ## login to github (prompt for url, name, key(if ssh) etc)
gh repo clone <<repo_path>> # clone the repo 
```


On cloning no need to set remote for .git local repo, only local repo needed


### HTTPS
``` sh
git clone https://github.com/<user_name>/<repo_name>.git
```


#### Push the changes to git for non-users thrugh PAT **To Be Tried**
To allow commit and push through **PAT**. 

create and use the PAT token by the below steps

1. Goto User profile -> Settings -> Tokens
2. Create toekn with the expire date, repository allowed, actions (commit, content changes, codespaces create, etc.)
2.1. For push, content & commit access -> read-write. by default no-action is set on the actions.
3. copy the generated PAT token and share to the non-user
4. If git push commit enabled means, the the non-user prompted for git login on git push, where the username, and PAT has to be given. 
5. This one will prompt for every time on remote changes, like pushes.where it can be cached for time being(not know how to).

example PAT (Personal Access Token): github_pat_<<SOME_HASH_CODE>>


### SSH (to be Tried)

You can see the below command , where the SSH & HTTPS arguments are different, but command is same.

```ssh
git clone git@github.com:<<username>/<repo_name>>.git
```

### Use SSH keys on git push
 on pushing the changes from local to repo need SSH key on the local machine. if there is no git login is provided. Below are the steps to create ssh keys.

1. Create SSH key
```sh
ssh-keygen -t rsa ## prompt for key name, pass-phrase
```

2. Add public key in Github (key-type as authentication key)

  once generated the public, private key , COPY the public key contents and PASTE it in Profile-> Settings-> SSH & GPG Keys -> add new SSH keys

3. To test SSH connection

```sh
ssh -T git@github.com
```

4. Add ssh private key in local's  authorized-keys by below command. If not working on push

```sh
eval 'ssh-agent'  ## open connection to auth agent
ssh-add /home/user/.ssh/key_id_rsa ## add private key
```

5. Perform git push !!! Thats it!!


## Git hidden folder
inside .git folder contains the config and commit details etc. if this removed, git capabilities removed. to create a git repo from a folder and .git use the below command

For create a repo from csratch 
```sh
mkdir /workspace/tmp
cd /workspace/tmp
```
To mark the folder as a git repo
``` sh 
git init
```
create a new file, add and commit
``` sh
touch Readme.md  ##create
code Readme.md   ##edit
git add .
git commit -a  -m "Message"
```

on changing also run 'git add' before git commit command.

## Default editor for git commit/others
Here without -m  in git commit will open the commit message editor in codespace . To set the default editor change in git config. this git config file is present inside .git folder

```sh
git commit   ## run git add or add -a if not file changes are added
```

change the editor by below command
```sh
git config --global core.editor emacs
```

## git branches

```sh
git branch  ## list the branches
git branch <new_name>  ## create the new branch
git checkout <branch_name>  ## switch to other branch(remote/local), on this uncommited changes moved from current to switched branch
git branch -d -f <branch_name>  ## delete branch forcefully
```
If the branch is not in remote, the push will be failed. To set the git to create the branch in remote from local, set the upstream like below

```sh
git push --set-upstream origin <new_branch_name>
```


## git commands

to see the current status of repo will list which files are staged and to be commited , etc.

```sh 
git status
```

to reset the current local changes to clean (from staged changes to unstaged)
```sh 
git reset
```
To see the config of git, which present inside .git folder . git config will show the username, editor and other details fetched from .git/gitconfig

```sh
git config --list --show-origin
```
To set the user name and email 

```sh
git config --global user.name <<user>>
git config --global user.email <<email>>
```

_NOTE: in codespace with command 'code .git' will open the .git folfer in new web page of codespace_

To see the recent history of commits logs run below command

```sh
git log
```

to push the changes from local to remote repo. before pushing the changes the local repo should have added with remote, the remote origin is set in .git/config. without remote cant perform the push

```sh 
git push
```
To add remote branch , but add remote via upstream while adding a branch

```sh
git remote add ... ## not tried
git  branch -u orignin <<branch_name>>  ## set before merge and push to reflect changes in remote 
```

To Merge the changes to master or otehr branch use the below command

```sh
## execute git fetch , to check uptodate from remote

## checkout require both, example current is beta, target is main 
git checkout <<current_branch & target_branch>>    
git merge <<current_branch>>  ## so the merge is on, 'git merge beta' from main(checked out), to pull changes from main to beta, run 'git merge main' from beta
git push ## push to remote
```

Stash is for,  the changes to not commit the changes in local/remote

```sh
git stash   ## without name added
git stash save <<name>>   ## added with name
git stash list  ## list the stash entries
git stash pop   ## remove the last stash entry and apply the changes back
git stash apply  ## the same like git stash pop
```

```sh
touch ___ ## create a file
code  ___ ## edit a file
```

__Note__:
  1. VS Code extensions like Git graph, git tree, etc used to visualize the git commits,branches, etc. Once installed, that can be viewed in *Source control* menu.
  

