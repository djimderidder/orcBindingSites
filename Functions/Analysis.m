function [ output ] = Analysis( config, importSequence)
    % Gets the binding value for each of the #bp frames (both top and bottom strand)
    
    % Get frame size, how many bp we look at
    frameSize = length(config.consensus.a);
    % Get amount of frames we look at
    numberFrames = length(importSequence)-frameSize;
    
    % Initialise zeros matrices
    valueTop=zeros(1,numberFrames);
    valueBottom=zeros(1,numberFrames);

    for ii=1:numberFrames
        %iteration of each frame
        bpFrame=importSequence(ii:(ii+frameSize-1));
        
        for jj=1:frameSize
             %Sum the the values of each nucleotide in the frame
             if isequal(bpFrame(jj),{'a'})
                 valueTop(ii) = valueTop(ii)+config.consensus.a(jj);
                 valueBottom(ii) = valueBottom(ii)+config.reverseConsensus.a(jj);
             elseif isequal(bpFrame(jj),{'c'})
                 valueTop(ii) = valueTop(ii)+config.consensus.c(jj);
                 valueBottom(ii) = valueBottom(ii)+config.reverseConsensus.c(jj);
             elseif isequal(bpFrame(jj),{'g'})
                 valueTop(ii) = valueTop(ii)+config.consensus.g(jj);
                 valueBottom(ii) = valueBottom(ii)+config.reverseConsensus.g(jj);
             else
                 valueTop(ii) = valueTop(ii)+config.consensus.t(jj);
                 valueBottom(ii) = valueBottom(ii)+config.reverseConsensus.t(jj);
             end
        end
    end
    output.valueTop=valueTop;
    output.valueBottom=valueBottom;
end
