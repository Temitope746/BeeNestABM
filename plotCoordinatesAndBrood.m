function [] = plotCoordinatesAndBrood(nestData, brood, frame, cols)
    
    %% Inputs
    % nestData: tracked nest data matrix, of form "preNest" (m x n x 5)
    % brood: brood, formatted as output of 'relabelBroodObject'
    % frame: what frame/timestep number to plot
    %
    %Plot brood
    addBroodPlot(brood);
    hold on
    
    %Plot queen separately
    plot(nestData(frame,1,1), nestData(frame,1,2), 'o', 'MarkerSize', 30, 'Color', [0.9 0.5 0.5], 'LineWidth', 3);
    
    %Plot rest of bees
    onNestInd = nestData(frame,:,7) == 1;
    scatter(nestData(frame,onNestInd,1), nestData(frame,onNestInd,2), [], cols(onNestInd,:), 'filled');
    scatter(nestData(frame,~onNestInd,1), nestData(frame,~onNestInd,2), [], cols(~onNestInd,:));

    % fix the camera viewing window on the nest chamber
    axis([0 0.25 0 0.2]) % nestMaxX = 25 cm and nestMaxY = 20 cm
    hold off
