paste0("file '", list.files("./", pattern = "*.jpg", full.names = TRUE)) %>%
  stringr::str_c("'") %>%
  writeLines("./ffmpeg-image-slideshow-file-list.txt", sep = "\n")
