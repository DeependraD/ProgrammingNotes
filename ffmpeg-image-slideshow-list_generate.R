require(tidyverse)

# write name of images to a text file
paste0("file '", list.files("./", pattern = "*.jpg", full.names = TRUE)) %>%
  stringr::str_c("'") %>%
  writeLines("./ffmpeg-image-slideshow-file-list.txt", sep = "\n")

# read exif data

file_list <- list.files("./", pattern = "*.jpg", full.names = FALSE)

# system2 command encourages single command use only
system2(command = "identify", args = c("-format '%[EXIF:*]'", file_list[1]),
        stdout = TRUE) %>% 
  str_remove_all("^\\'") %>% 
  strsplit(split = "=", fixed = TRUE) %>% 
  discard(~is_empty(.x)) %>% 
  map(~set_names(.x[[2]], .x[[1]])) %>% 
  unlist() %>% 
  bind_rows()
  
# but let us map it over all files
all_image_exifs <- map_dfr(file_list, ~system2(command = "identify", args = c("-format '%[EXIF:*]'", .x),
                                 stdout = TRUE) %>% 
          str_remove_all("^\\'") %>% 
          strsplit(split = "=", fixed = TRUE) %>% 
          discard(~is_empty(.x)) %>% 
          map(~set_names(.x[[2]], .x[[1]])) %>% 
          unlist())

bad_orientation <- all_image_exifs %>% 
  mutate(file_name = file_list) %>% 
  filter(`exif:Orientation` != 1) %>% 
  pull(file_name)

# reset orientation value in exif metadata
walk(paste0('mogrify -auto-orient ', bad_orientation), ~system(command = .x))

# check the auto orientation result
map_dfr(bad_orientation, ~system2(command = "identify", args = c("-format '%[EXIF:*]'", .x),
                            stdout = TRUE) %>% 
          str_remove_all("^\\'") %>% 
          strsplit(split = "=", fixed = TRUE) %>% 
          discard(~is_empty(.x)) %>% 
          map(~set_names(.x[[2]], .x[[1]])) %>% 
          unlist()) %>% 
  View()
