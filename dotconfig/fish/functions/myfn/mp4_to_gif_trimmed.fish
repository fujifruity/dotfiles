function mp4_to_gif_trimmed --argument mp4

    set dur (ffprobe -i $mp4 -show_entries format=duration -v quiet -of csv="p=0")
    ffmpeg \
        -i $mp4 \
        -r 15 \
        -vf scale=512:-1 \
        -ss 00:00:00 -to (math $dur-0.3) \
        $mp4.gif

end
