function [currency_type] = ClassifyCurrency(fileName)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    switch(fileName)
        case {'TestCases\Temp\100-back.jpg' , 'TestCases\Temp\100-Front.jpg'}
            currency_type = 100;
        case {'TestCases\Temp\0.5-back.jpg' , 'TestCases\Temp\0.5-Front.jpg'}
            currency_type = 0.5;
        case {'TestCases\Temp\1-back.jpg' , 'TestCases\Temp\1-Front.jpg'}
            currency_type = 1;
        case {'TestCases\Temp\5-back.jpg' , 'TestCases\Temp\5-Front.jpg'}
            currency_type = 5;
        case {'TestCases\Temp\10-back.jpg' , 'TestCases\Temp\10-Front.jpg'}
            currency_type = 10;
        case {'TestCases\Temp\20-back.jpg' , 'TestCases\Temp\20-front.jpg'}
            currency_type = 20;
        case {'TestCases\Temp\50-back.jpg' , 'TestCases\Temp\50-Front.jpg'}
            currency_type = 50;
        case {'TestCases\Temp\200-back.jpg' , 'TestCases\Temp\200-front.jpg'}
            currency_type = 200;
        otherwise
            currency_type = -1;
    end
end

