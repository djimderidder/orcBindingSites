clc, clear all

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
imagesc(visualisation.procentTop);
pbaspect([20 1 1]);  set(gca,'YColor',[1 1 1]);
%set(gca,'xtick',[1:length(importSequence)],'xticklabel',importSequence);
colormap(jet(numel(visualisation.procentTop))); colorbar;

title(['\fontsize{16}ORC binding sites top, 50% threshold'])

subplot(2,1,2)
%plot(valueBottom.*thresholdBottom)
imagesc(visualisation.procentBottom);
pbaspect([20 1 1]); set(gca,'YColor',[1 1 1]);
%set(gca,'xtick',[1:length(importSequence)],'xticklabel',importSequence);
colormap(jet(numel(visualisation.procentBottom))); colorbar;

title(['\fontsize{16}ORC binding sites bottom, 50% threshold'])
