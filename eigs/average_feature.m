function aver_feature = average_feature(L,classnum)
opt.disp = 0;
average_L = combine_L(L);
[aver_feature,~] = eigs(average_L,classnum,'sm',opt);
end


function average_L = combine_L(L)
order = size(L,2);
n = size(L{1},1);
ker_num = size(L{1},3);
average_L = zeros(n);
for i = 1:order
    L_temp = L{i};
    for j = 1:ker_num
        average_L = average_L + L_temp(:,:,j);
    end
end
average_L = average_L/(order*ker_num);
end