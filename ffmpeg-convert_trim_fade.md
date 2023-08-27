## Convert multistream media to mp3 (single stream) with 192k bitrate and no video stream.

ffmpeg -i input_file_name.webm -c:a libmp3lame -b:a 192k -ac 2 -ar 48000 -vn output_file_name.mp3


# Trimming mp3 file and fade in/out audio stream

## Trimming
# note that '-to' command trims to given time while earlier (only available) '-t' command specifies the duration from the point indicated by '-ss'

ffmpeg -i "extra_long_song.mp3" -ss 00:00:04.5 -to 00:05:56 -c copy "long_song.mp3"

## Fading in

ffmpeg -i "audio.mp3" -af afade=in:0:d=1.5 -b:a 256k -c:a libmp3lame "audio_fadedin.mp3"

## Fading out
# note that 'afade=out:595' is the time point in seconds after which the fade (of 5 seconds in this case) is applied. To fade audio of a stream at the end, stream length in seconds should be determined and fade duration (5 seconds) should be substracted to get the correct length. Thus, here the audio.mp3 is (595+5) seconds in length.

ffmpeg -i "audio.mp3" -af afade=in:0:d=1.5,afade=out:595:5 -b:a 256k -c:a libmp3lame "audio_fadedin_fadedout.mp3"
