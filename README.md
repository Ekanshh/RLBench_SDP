# RLBench_SDP

This repository contains the project "RLBench: Mobile Manipulator
Extension" to fulfill the requirements of the course-work 'Software Development Project' at Hochschule Bonn-Rhein-Sieg

Project Advisors:	
- Prof. Dr. Nico Hochgeschwender
- Alex Mitrevski

Team Members:	
- Syed Musharraf Ali
- Ekansh Sharma 
- Hamza Ullah Khan 


## How to run?

- Pre-requisites: This project assume the following system specification/software components installation:
  -  Ubuntu 16.04, 18.04 or 20.04
  -  Anaconda
  -  No prior installation of CoppeliaSim (If installed already, edit the .bashrc file to delete the existing COPPELIASIM_ROOT path variable)

- Clone this repository using: 
	`https://github.com/musharrafleo95/RLBench_SDP.git`

- Go to this repository directory:
	`cd RLBench_SDP`

- Open terminal inside the repository directory and run:
	`./setup.sh` 

- Now in the existing terminal, run the following commands:

  - `Python3 task_builder.py`
  - Enter the task name as: `test_hsr_task.py` and press Enter
  - Wait for the task to load and then in the terminal enter `+` to run the simulation
  - Enter `d` to see the demo in CoppeliaSim

- Now the task will be running and the HSR robot arm will be reaching the ball in the environment.
