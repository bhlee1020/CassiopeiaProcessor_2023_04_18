# CassiopeiaProcessor_v2

## Used by Harland Lab at UC Berkeley

### Contributors:
#### Initialization, FFMPEGProcessor, and VideoProcessor
- Authored by Konnor von Emster, Edited by Lilian Zhang and Brandon Lee
- Original Version: https://github.com/konnorve/CassiopeaProcessor

#### OrientationProcessor
- Authored by Brandon Lee

## Description
Software developed and used by the Harland Lab at UC Berkeley to process Cassiopeia jellyfish recordings. 

![alt text](https://github.com/bhlee1020/CassiopeiaProcessor_v2/blob/main/images/labelled_jelly.gif)

<!--- ## Table of Contents --->

## Installation
This program can be installed by pulling the repository from github, or, if you are a user of UC Berkeley's high performance computing cluster, Savio, you can copy the program directly from: /global/scratch/users/bhlee1020/CassiopeiaProcessor.

## Usage
This program was designed to be run on UC Berkeley's high performance computing cluster, Savio, with jellyfish videos recorded at 120 frames per second. Each process in the pipeline has an associated shell script that executes the Python code in parallel to efficiently process large amounts of data. Initialization is first run on a local computer to verify different parameters. Then, on Savio, FFMPEGProcessor is run and then VideoProcessor. OrientationProcessor can be run on Savio at any time during this pipeline. Videos which are < 120 frames per second may receive variable results.

## How does it work? 
Video recordings are first analyzed to determine parameters best suited for the tracking of ganglia on a particular jellyfish. Pulse times and angle of initiating ganglia were calculated for 30 seconds using the Initialization program. These values were calculated using a gradient of different parameters, such as image grayscale level, pulse thresholds, and refractory periods. Calculations for the full videos are then done on Savio, using FFMPEGProcessor and VideoProcessor.

However, this program does not account for the potential movement and rotation of the jellyfish throughout the recording. This makes the location of each ganglia variable, so the values calculated need to be offset by the relative orientation of the jellyfish. This was achieved using the Python software package, DeepLabCut (https://github.com/DeepLabCut/DeepLabCut). Using DeepLabCut, a ResNet-50 convolutional neural network was trained on an initial dataset of 24 hours of recording, with seventeen labels which were used to estimate the location of rhopalia. Since DeepLabCut is often used to track the different body parts on an animal, it is difficult for the program to locate and differentiate rhopalia. Instead, labels were initially placed on random points on the circumference of the jellyfish, which are tracked throughout the whole duration of the video. After this processing, the positions of the rhopalia are measured by-hand and compared to these labels in order to offset them to the correct positions. By combining the values of the rhopalia positions with the angles of initiating ganglia, we are able to track ganglia activity levels for long periods of time.

## Program Flow

## Credits
- Programs have been written and edited by Konnor von Emster, Lilian Zhang, and Brandon Lee
- Written for the Harland Lab at UC Berkeley, under the guidance of Dr. Michael Abrams
- Dependencies: FFMPEG, GNU Parallel, DeepLabCut

## License
This program is not currently licensed in any way. If you use code or data, please cite us!
