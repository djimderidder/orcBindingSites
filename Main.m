clc, clear all, close all

cd 'H:\My Documents\MATLAB\orcBindingSites'

% Get preferences: nucleotide consenus,
config = struct();
config = Config( config);

%% Load DNA sequence

fprintf('This section imports the DNA sequence.\n')
importSequence = ImportSequence(config);

%% Analysis

fprintf('This section performs the Analysis.\n')
[ analysis ] = Analysis( config, importSequence);


%% Visualisation

fprintf('This section performs the thresholding and normalisation.\n')
[ visualisation ] = Visualisation( config, analysis);
figure()
subplot(2,1,1)
%plot(valueTop.*thresholdTop)
imagesc(visualisation.procentTop); colormap(jet(numel(visualisation.procentTop))); colorbar;

title(['ORC binding sites (top),',num2str((config.threshold*100)),'% threshold'])
pbaspect([10 1 1])
%set(gca,'xtick',[1:length(importSequence)],'xticklabel',importSequence);
set(gca,'YColor',[1 1 1]);

subplot(2,1,2)
%plot(valueBottom.*thresholdBottom)
imagesc(visualisation.procentBottom); colormap(jet(numel(visualisation.procentBottom))); colorbar;

title(['ORC binding sites (bottom),',num2str((config.threshold*100)),'% threshold'])
pbaspect([10 1 1])
%set(gca,'xtick',[1:length(importSequence)],'xticklabel',importSequence);
set(gca,'YColor',[1 1 1]);