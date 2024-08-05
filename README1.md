## Ways to clone github repo
HTTPS, SSH, Github CLI



### HTTPS
``` sh
git clone https://github.com/<user_name>/<repo_name>.git
```

To allow commit and push through **PAT**


### SSH
```sh
git clone git@github.com:<<username>/<repo_name>>.git
```
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
git commit
```

change the editor by below command
```sh
git config --global core.editor emacs
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

```
touch ## create a file
code  ## edit a file
```


