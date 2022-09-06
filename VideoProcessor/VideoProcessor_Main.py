import VideoProcessingMethods as vpm
from pathlib import Path
import sys
from time import sleep

postInit_DF_path = Path(sys.argv[1])

if __name__ == "__main__":
    arg = int(sys.argv[2])
    print(arg)
    sleep(arg)
    print(postInit_DF_path)
    vpm.runFullVideoAnalysis(arg-1, postInit_DF_path)


# example running video processor in parallel on each chunk
# parallel python3 VideoProcessor_Main.py ::: $POSTINIT_DF_PATH ::: $(seq 60)
