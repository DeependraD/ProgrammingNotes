# Programming Notes

## R, excel, python, bash, vim and git

Should contain petty notes on problems I face in day-to-day programming. It's kindda dumping ground for small tasks that have not yet been organized into projects. This repo hosts mostly disorganized scripts that fit nowhere but are too valuable that they impinge when I have to search around elsewhere for them.

There also are some fancy ones that caught my eyes in the web. Those mostly relate to concepts in computing, mathematics and statistics.

- [Excel tips and tricks](./excel_lessons/)
- [R lessons](./r_lessons/)
  - [Create hex sticker using R](./r_lessons/r_hex_sticker.R)
  - Utility functions and scripts in R for easing chores

- [Python lessons](./python_lessons/)
  - [Recursion based sudoku solver using Python](./python_lessons/recursion_based_sudoku_solver.ipynb): Copied and pasted from youtube webcast by [NerdFirst programmer](https://www.youtube.com/watch?v=y1ahOBeyM40)

- [Configuration files](./dotfiles/)

## Configuring Ubuntu

Right after installation, install:

- git (`sudo apt-get install git`)
- vim (`sudo apt-get install vim`)
- tmux (`sudo apt-get install tmux`)
- zsh (`sudo apt-get install zsh`)
  - Configure z-shell with [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh/) configuration.
- Configure dotfiles (https://github.com/deependrad/ProgrammingNotes/dotfiles/)
  - clone and paste the dotfiles directory of this repo to home
  - run `make.sh` file. It backs up existing dotfiles and copies the links for new dotfiles to home directory. Before running the `make.sh` change the permission to grant it execution rights (`chmod +x .make.sh`).
- R (add PPA)
- Rstudio (debain package available at website)
- R packages (lmer, tidyverse, bookdown, blogdown)
- Latest python3 distribution
- pdfgrep (preferably expenimental)
  - With required dependencies (libpoppler-dev, libunac1-dev, ...)
- TeX distribution with tinytex (from Rstudio)
  - For installation, follow instructions at: https://yihui.org/tinytex/
- Install calibre
