function [images mode] = RunTestCase(n)
directory = "1. Upright front-back Single";
mode = 'D';
switch(n)
    case 1
        directory = 'TestCases/1. Upright front-back Single';
        mode = 'D';
    case 2
        directory = 'TestCases/2. Upright front-back all-in-one none-intersect';
        mode = 'D';
    case 3
        directory = 'TestCases/3. Rotated-none-intersect';
        mode = 'R';
    case 4
        directory = 'TestCases/Bonus/4. All-in-one intersect/';
        mode = 'S';
    case 6
        directory = 'TestCases/Bonus/6. Noisy/';
        mode = 'N';
end
images = getAllFiles(directory);



end

