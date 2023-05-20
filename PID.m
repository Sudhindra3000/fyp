TunedBlocks = {'PD1', 'PD2', 'PD3'};
ST0 = slTuner('RobotPID', TunedBlocks);

addPoint(ST0, TunedBlocks)

addPoint(ST0, 'Robot/qm')

RefSignals =  {...
    'RobotPID/S1', 'RobotPID/S2', 'RobotPID/S3', 
};
addPoint(ST0, RefSignals);

Controls = TunedBlocks;
Measurements = 'RobotPID/Robot/1';
options = looptuneOptions('RandomStart', 80', 'UseParallel', false);
TR = TuningGoal.StepTracking(RefSignals, Measurements, 0.05, 0);
ST1 = looptune(ST0, Controls, Measurements, TR, options);

writeBlockValue(ST1)