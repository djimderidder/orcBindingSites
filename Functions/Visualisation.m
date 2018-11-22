function [ output ] = Visualisation( config, analysis);
    % Gets the binding value for each of the #bp frames (both top and bottom strand)
    
%     maxTop = max(analysis.valueBottom);
%     maxBottom = max(analysis.valueTop);
    maxValue = 12.743055;
    minValue = 0.315971;
    
%     thresholdTop=analysis.valueTop>=9;
%     thresholdBottom=analysis.valueBottom>=9;
%     thresholdTop=analysis.valueTop>=(maxTop*config.threshold);
%     thresholdBottom=analysis.valueBottom>=maxBottom*config.threshold;
    thresholdTop=analysis.valueTop>=(maxValue*config.threshold);
    thresholdBottom=analysis.valueBottom>=maxValue*config.threshold;
    
%     output.procentTop=(analysis.valueTop.*thresholdTop)./maxTop;
%     output.procentBottom=(analysis.valueBottom.*thresholdBottom)./maxBottom;
    output.procentTop=((analysis.valueTop.*thresholdTop)-minValue)./(maxValue-minValue);
    output.procentBottom=((analysis.valueBottom.*thresholdBottom)-minValue)./(maxValue-minValue);
end
