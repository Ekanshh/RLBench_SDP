# RLBench_SDP
SDP course project. In this project we have to create a task with Toyota HSR robot in RLBench

## Process of downloading all dependencies.

- First download Coppeliasim from https://www.coppeliarobotics.com/files/CoppeliaSim_Edu_V4_1_0_Ubuntu16_04.tar.xz and extract the files in a folder. Rename the extracted folder "CoppeliaSim"

- Go to “CoppeliaSim/system/usrset.txt” and scroll at the end and paste "allowOldEduRelease=7501"

- Then edit bashrc file by “sudo gedit ~/.bashrc” and at the end write
    - export COPPELIASIM_ROOT=~/path-to-coppeliasim/CoppeliaSim
    - export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$COPPELIASIM_ROOT
    - export QT_QPA_PLATFORM_PLUGIN_PATH=$COPPELIASIM_ROOT

- Now clone Pyrep directory from https://github.com/stepjam/PyRep
- Now create new conda environment of the name “SDP” by using: 
    - conda create --name SDP python=3.8 --channel pkgs/main
    - conda activate SDP
    - pip install opencv-python-headless

- List of package in an environment can be viewed by “conda list -n SDP”
- Goto Pyrep folder
    - pip3 install -r requirements.txt
    - pip3 install .
    - cd examples
    - python example_baxter_pick_and_pass.py
    - If the examples run then pyrep has been installed correctly.

- Now instal RLBench from https://github.com/stepjam/RLBench#install
    - First clone the repository
    - cd RLBench
    - pip3 install -r requirements.txt
    - pip3 install .

- Now what we have done using Coppeliasim is that we compiled the model of Toyota HSR robot using ros and then imported it in coppeliasim. After the model was correctly compiled then we exported the .ttm hsr model file so that the hsr model can be imported easily anytime.

- Get respective files from temp_sdp repository


- After copying all the files of PyRep from temp_sdp in the respective folder, now we need to compile it. Goto PyRep folder and then run:
    - “python3 setup.py install --user”
    - (optional)After all the files have been copied. Check that hsr is running by going into the examples folder and then running the “hsr stack cubes” file.

- Now copy all the files of RlBench from temp_sdp in their respective folder. After this we need to compile it. Goto to the main RLBench folder and then run:
    - “python3 setup.py install --user”


- After all the RlBench files have been copied then go to “tools” folder and then run:
    - “Python3 task_builder.py”
    - Write “test_hsr_task.py” and enter
    - Write “+” and enter
    - Write “d” and enter
