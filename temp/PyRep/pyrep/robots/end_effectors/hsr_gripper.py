from pyrep.robots.end_effectors.gripper import Gripper


class HSRGripper(Gripper):

    def __init__(self, count: int = 0):
        super().__init__(count, 'HSR',
                         ['HSR_joint7', 'HSR_joint8'])
