# RLBench_SDP
SDP course project. In this project we have to create a task with Toyota HSR robot in RLBench

## Process of downloading all dependencies.

- This project assumes that
  -  the pc contains ubuntu 16.04, 18.04 or 20.04
  -  Anconda is already installed.
  -  Any variables related to Coppelaisim are not present in the .bashrc file.


- clone this repository using "git clone https://github.com/Ekanshh/temp_sdp.git"


- go to this repository folder using 
  - "cd temp_sdp"

- open terminal in the repository folder and run 
  - "./setup.sh"

- After the setup is finished activate the conda environment using the following command in the terminal 
  - "conda activate RLBench_SDP"

- Goto RLBench tools folder by 
  - "cd RLBench/tools"

- Now in this folder run:
  - “Python3 task_builder.py”
  - Write “test_hsr_task.py” and enter
  - Write “+” and enter
  - Write “d” and enter

- Now the task will be running and the HSR robot arm will be reaching the ball in the environment.
