# ffmpeg \
#     -pattern_type glob -i 'images/*.jpg' \
#     -vf "fps=30,format=yuv420p" \
#     pineta.mp4

ffmpeg -y \
    -i pineta.mp4 \
    -filter_complex 'fps=10,scale=830:-1:flags=lanczos,split [o1] [o2];[o1] palettegen [p]; [o2] fifo [o3];[o3] [p] paletteuse' \
    pineta.gif
