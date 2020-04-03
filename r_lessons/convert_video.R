# use the other build
"C:\Users\Dell\ddhakal\applications\ffmpeg-20200110-3d894db-win64-static"

# to convert webm video to mp4 video
command_list <- 'C:\\Users\\Dell\\ddhakal\\applications\\ffmpeg-4.2.1-win64-static\\bin>ffmpeg.exe -i "C:\\Users\\Dell\\ddhakal\\music\\OneRepublic, Seeb - Rich Love.webm" -c:v libx264 -crf 32 -c:a aac -b:a 256k "C:\\Users\\Dell\\ddhakal\\music\\OneRepublic, Seeb - Rich Love.mp4"'

# to convert webm audio stream to mp3 audio
command_list <- 'C:\\Users\\Dell\\ddhakal\\applications\\ffmpeg-4.2.1-win64-static\\bin>ffmpeg.exe -i "C:\\Users\\Dell\\ddhakal\\music\\OneRepublic, Seeb - Rich Love.webm" -c:v libx264 -crf 32 -c:a aac -b:a 256k "C:\\Users\\Dell\\ddhakal\\music\\OneRepublic, Seeb - Rich Love.mp4"'


# file list to convert to audio
nepali_audio <- list.files("C:/Users/Dell/ddhakal/music/", pattern = ".webm", 
           full.names = T)[-1]

nepali_audio_names <- nepali_audio %>% 
  stringr::str_remove_all(".*(?=/)/")

