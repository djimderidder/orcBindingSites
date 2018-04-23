function [ output ] = ImportSequence( config )
    % Import Sequence - Imports the DNA sequence
    % Imports sequence from excel document
    
%     importExcel = readtable('sequence.xlsx');
%     importSequence.sequence = importExcel.Nucleotides;
%     output = importSequence;
    
    file = fopen(config.SequenceFile);
    importSequence = textscan(file,'%s');
    importSequence = importSequence{:};
    file = fclose(file);
    output = importSequence;
end
