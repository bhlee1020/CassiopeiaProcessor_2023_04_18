import VideoProcessingMethods as vpm
from pathlib import Path
import sys
from time import sleep
import pandas as pd

print('argv 1 is '+sys.argv[1])
print('argv 2 is '+sys.argv[2])
print('argv 3 is '+sys.argv[3])

tmp_ImgStacks = Path('/tmp/Image_Stacks') # path to the /tmp/Image_Stacks directory within each overlay
postInit_DF_path = Path('/global/scratch/users/bhlee1020/RNASeq2/20210901/AnyaTaylorJoy/Baseline/Baseline_PostInitializationDF.csv') 
# path to csv

# TO DO: loop through subdirectories of /tmp/Image_Stacks to get video name
if __name__ == "__main__":

    postInit_DF = pd.read_csv(postInit_DF_path)

    for file in tmp_ImgStacks.iterdir():

        if file.is_dir() and not (postInit_DF[postInit_DF['ChunkName'] == file.stem].empty):

            chunkName_idx = postInit_DF[postInit_DF['ChunkName'] == file.stem].index[0]
            # arg = int(sys.argv[2]) # need to obtain arg as the index
            arg = chunkName_idx
            print(file.stem)
            print(arg)
            sleep(arg)
            print(postInit_DF_path)
            vpm.runFullVideoAnalysis(arg, postInit_DF_path) # remove -1 because this is DF index already
