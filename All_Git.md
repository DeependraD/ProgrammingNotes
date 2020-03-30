# Starting from the scratch one would ideally:

1. `cd` to a suitable directory
2. `mkdir` a new directory, to be used as the root in repo.
3. `git init` to initialize the repo.
4. create some files with command line option, or we could use a text editor.
 - echo "# We will have the nice contents in this file" >> nice_file.md
 - echo "# Here we discuss how to make best use of this repo" >> README.md
5. `git add README.md nice_file.md` to track the changes to the files.
6. `git comit -m "fully committed for the first time"`
7. `git remote add origin <repo_url>`
8. `git push -u origin master` # Hold on, I have a link for what's up with that ["u"](http://stackoverflow.com/questions/5697750/what-exactly-does-the-u-do-git-push-u-origin-master-vs-git-push-origin-ma).

_Note: It took me almost one year to just mind the "u". I could, at least, have noticed earlier. But I didn't, so the pain._

- After the files have been added by `git add` command, to reset all the files (or to say, don't track any one of em!)
git reset

- After adding the files to the staging area, before the commit, use the following command to unstage/untrack each individual files:

```
git reset HEAD "file_name"
git reset HEAD "*.ext"` # ext is the extension of the files that will be unstaged/unadd. Afterall, patterns are recogized in filename specification.
```
## Tracking while I'm learing git

1. When you want to rename a file, use

 ```
 git mv old_file_name new_file_name
 ```
 It's better this way because you would'nt have to go through the hassle of adding with option `--all` each of the old_file_name and new_file_name before commiting them.
 This `mv` command automatically detects the changes in the file as rename. Great!

 Once, I had a file renamed with a general renaming tool (That time, Rstudios's file rename option from the file explorer window) that led me to go through this writeup.

 Then in the local repo I had added both the two new_file_name and the old_file_name with

 ```
 git add new_file_name old_file_name
 ```
 But, to the surprise some warning came along suggesting to use `git add --all ...` option instead of the default `--ignore-removal` so that removal of paths from the working tree will be recorded as well. And this came out right about what I actually wanted to do. Then only, when using

 ```
 git status
 ```
 I was relieved seeing that git had identified the file having been **renamed**.

 _Note: This renaming stuff was anchored to my sense through an stackoverflow [post](http://stackoverflow.com/questions/6628539/how-to-tell-git-that-its-the-same-directory-just-a-different-name)._

2. This is an outlandishly correct way to move files between repos in github

 Please stick to the rules with cautions to avoid so much so of foresaken, if not hostile, territories out there.

 https://stackoverflow.com/questions/1365541/how-to-move-files-from-one-git-repo-to-another-not-a-clone-preserving-history

### Undoing things with git

Essentially, version control system such as git acts by storing a snapshot of your repository at moment when you do the commit. So, when some thing has been changed through the new commit record, there also are some elegant ways of reverting back to the previous commit, which will therefore be synoymous to undoing of a commit.

#### Undoing a "public" change

After the git push has been ran, sending the changes to github, one can always undo that last commit by:

```
git revert <SHA>
```
This will create a new commit that is replica of the old commit that occured before the disasterous one commit took place. This is the most basic "undo" scenario because it does not alter history- so you can now `git push` the new "inverse" commit to undo your mistaken commit.

#### Fix the last commit message

It should be very clear by now that your last commit message contains a typo. For instance, you did:

```
git commit -m "Fixies bog #91"
```
Now, don't worry and just give a try to:

```
git commit --amend -m "Fixes bug #91"
```
This will update and replace the most recent commit with a new commit that combines any staged changes with the contents of the previous commit. With nothing currently staged, this just rewrites the previous commit message.

#### Undo "local" changes

You are trying adding new features to the code, but looking back you find out that this is more perilous than the existing commit record. Plus you are too damn lazy to hit backspace in the editor to taking care of all the changes you made. However, you are lucky enough to not have it commited, though. Thus you want to undo everything in that file, going back to the way it looked in the last commit. Just sway your wand around with the spell:

```
git checkout -- <bad_filename>
```
This alters files in the working directory to a state previously known to git. You could provide a branch name or specific SHA you want to go back to or, by default, Git will assume you want to checkout `HEAD`, the last commit on the currently-checked-out branch.

Remember that any "Undoing" this way will cause the record to really be gone, since they were never commited. It's impossible to recover from this action.

*For a complete account visit*: https://github.com/blog/2019-how-to-undo-almost-anything-with-git
