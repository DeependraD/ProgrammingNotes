require(tidyverse)

setwd("C:/Users/Dell/songs/")

file_list <- list.files(".") %>% 
  str_subset("conversion_script", negate = TRUE)

non_mp3_files <- file_list[tools::file_ext(file_list) != "mp3"]
only_mp3_files <- file_list[tools::file_ext(file_list) == "mp3"]

# remove '_convert' string from mp3 files
only_mp3_sans_ext <- str_remove_all(tools::file_path_sans_ext(only_mp3_files), "_convert") # an identifier suffix to imply that conversion has already been done.
non_mp3_sans_ext <- tools::file_path_sans_ext(non_mp3_files)

# which among non-mp3-files is not converted yet
yet_to_convert <- non_mp3_files[!non_mp3_sans_ext %in% only_mp3_sans_ext]

# ff_command <- paste0('ffmpeg -i "', file_list, '"  -vn -ar 48000 -ac 2 -b:a 192k "', tools::file_path_sans_ext(file_list), '_convert.mp3"')
# purrr::map(ff_command, ~system(.x))

# convert remaining files
ff_command <- paste0('ffmpeg -i "', yet_to_convert, '"  -vn -ar 48000 -ac 2 -b:a 192k "', tools::file_path_sans_ext(yet_to_convert), '_convert.mp3"')
purrr::map(ff_command, ~system(.x))

# to mux together streams (i.e. video and audio stream)

file_list <- list.files("some_reference_directory", full.names = TRUE, pattern = ".webm$|.mp4$|.m4a")
file_list_out <- stringr::str_replace_all(file_list, ".webm$|.mp4$|.m4a", ".mp3")

io_stream_join_ffmpeg <- function(x, y){
  paste0("ffmpeg -i ", "'", x, "'", " -vn -acodec libmp3lame -ac 2 -b:a 256k ", "'", y, "'")
}

all_streams <- io_stream_join_ffmpeg(file_list, file_list_out)

purrr::map(all_streams, ~system(.x))
