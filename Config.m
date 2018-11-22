function [ config ] = Config( config)
    % Config - File where the user can specify his/her preferences
    
    % Make sure we can use the functions
    addpath( genpath('./Functions'))
    addpath( genpath('./Input'))
    
    %Name imput sequence
    config.SequenceFile = 'sequence_48502.txt';
    
    %Import concensus
    importConsensus = readtable('ForwardConsensus.xlsx');
    
    % Split nucleotide Consensus
    config.consensus.a = importConsensus.A;
    config.consensus.c = importConsensus.C;
    config.consensus.g = importConsensus.G;
    config.consensus.t = importConsensus.T;
    
    % Get reverse consenus for the bottom strand
    config.reverseConsensus.a = flipud(config.consensus.t);
    config.reverseConsensus.c = flipud(config.consensus.g);
    config.reverseConsensus.g = flipud(config.consensus.c);
    config.reverseConsensus.t = flipud(config.consensus.a);
    
    % Fill in the percentage threshold of max binding value
    config.threshold = 0.5; %between 1 and 0
end
