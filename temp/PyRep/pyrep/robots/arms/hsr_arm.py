from pyrep.robots.arms.arm import Arm


class HSRArm(Arm):

    def __init__(self, count: int = 0):
        super().__init__(count, 'HSR', 6)
