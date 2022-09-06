import multiprocessing as mp
import VideoProcessingMethods as vpm
import DataMethods as dm
from pathlib import Path
import concurrent.futures
import sys
from time import sleep
import pandas as pd

image_Stacks_Path = Path(sys.argv[1])

post_Init_Path = Path(sys.argv[2])

post_Init_DF = pd.read_csv(post_Init_Path)

chunkname_idx = post_Init_DF[post_Init_DF['ChunkName'] == image_Stacks_Path.stem].index[0]
print(image_Stacks_Path.stem)
print(chunkname_idx)
sleep(chunkname_idx)
vpm.runFullVideoAnalysis(chunkname_idx, post_Init_Path)
