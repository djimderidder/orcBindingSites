function [ output ] = Visualisation( config, analysis);
    % Gets the binding value for each of the #bp frames (both top and bottom strand)
    
    thresholdTop=analysis.valueTop>=(max(analysis.valueTop)*config.threshold);
    thresholdBottom=analysis.valueBottom>=max(analysis.valueBottom)*config.threshold;
    %thresholdTop=analysis.valueTop>=9;
    %thresholdBottom=analysis.valueBottom>=9;
    
    output.procentTop=(analysis.valueTop.*thresholdTop)./max(analysis.valueTop);
    output.procentBottom=(analysis.valueBottom.*thresholdBottom)./max(analysis.valueBottom);
end
