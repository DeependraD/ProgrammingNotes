# # renaming utility
# 
# setwd("~/../Downloads/Economics/")
# 
# # save files to be renamed
# html_chms <- list.files(".", recursive = TRUE, 
#            pattern = "*.html",
#            ignore.case = TRUE, 
#            include.dirs = TRUE, 
#            full.names = TRUE)
# 
# # get the names for using as names
# chm_only <- gsub(pattern = ".html$", replacement = "", x = html_chms)
# 
# # rename
# file.rename(from = html_chms, to = chm_only)

# file extension search
# to prevent recursed directories from being listed use "include.dirs = FALSE"
table(gsub(pattern = ".*\\.", replacement = "", x = list.files("E:/Movies and Shows/", recursive = TRUE, 
                        pattern = "",
                        ignore.case = TRUE, 
                        include.dirs = FALSE)))

# # if no subdirectories exist "include.dirs" has no effect.
# gsub(pattern = ".*\\.", replacement = "", x = list.files("./Popular Economics/", recursive = TRUE, 
#                                                              pattern = "",
#                                                              ignore.case = TRUE, 
#                                                              include.dirs = TRUE))

# To unnest desired files to a destination

orig_files_list <- list.files("C:/Users/Acer/Downloads/BTPRT Trance Pack (17-02-2018) [EDM RG]/", 
           recursive = T, pattern = "*.mp3", full.names = TRUE)
replacement_names <- stringr::str_replace(orig_files_list, ".*/", "")

dest_files_list <- paste("C:/Users/Acer/Downloads/BTPRT Trance Pack (17-02-2018) [EDM RG]/", 
                         replacement_names, sep = "")
file.rename(orig_files_list[1:20], to = dest_files_list[1:20])
