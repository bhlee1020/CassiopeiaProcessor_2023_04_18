import os

import shutil

import deeplabcut as dlc

import sys

from moviepy.editor import *

config_path = '/global/scratch/users/bhlee1020/DLC/Savio_Test1/config.yaml'

# Change this when running
video_path = '/global/scratch/users/bhlee1020/RNAi/Lorde/Empty/Orientation_Chunks/Unfinished'

# Change this to your scratch username
source_prefix = '/global/scratch/users/bhlee1020'

VIDPATH = sys.argv[1]

vid_name = os.path.basename(os.path.normpath(VIDPATH))

new_vid_name_array = [os.path.splitext(vid_name)[0], '_30fps.mp4']

new_vid_name = ''.join(new_vid_name_array)

new_vid = VideoFileClip(VIDPATH)
new_vid.write_videofile(new_vid_name, fps=30)
source_path = os.path.join(source_prefix, new_vid_name)
new_vid_path = os.path.join(video_path, new_vid_name)
shutil.move(source_path, new_vid_path)

message1 = [new_vid_name, ' has begun analysis.']
print(''.join(message1))
dlc.analyze_videos(config_path, new_vid_path, shuffle=1, save_as_csv=True)
message2 = [new_vid_name, ' has been analyzed.']
print(''.join(message2))

