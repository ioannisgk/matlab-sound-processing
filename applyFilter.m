function [] = applyFilter(handles, source)
% Function to apply high pass and low pass filters

global sound1;
global sound2;

% https://www.youtube.com/watch?v=CCmw0O_CwWk&index=18&list=FLqHBsoiLE4YBTomc_zBaDCA&t=319s
% http://faculty.petra.ac.id/resmana/private/matlab-help/toolbox/signal/fir1.html
% https://www.mathworks.com/help/matlab/ref/filter.html

f = 0.8;
n = 6;

a = fir1(n, f, 'high');
b = fir1(n, f, 'low');

if source == 1
    
    o = filter(a, 1, sound1);
    p = filter(b, 1, o);
    
elseif source == 2
    
    o = filter(a, 1, sound2);
    p = filter(b, 1, o);
    
end