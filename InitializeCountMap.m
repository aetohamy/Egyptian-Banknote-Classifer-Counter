function [count_map] = InitializeCountMap()
count_map = containers.Map;
count_map('0.5') = 0;
count_map('1') = 0;
count_map('5') = 0;
count_map('10') = 0;
count_map('20') = 0;
count_map('50') = 0;
count_map('100') = 0;
count_map('200') = 0;
count_map('-1') = 0;
end

