function W = init_W(numclass,ker_num)
W = cell(1,2);
W_temp = zeros(numclass,numclass,ker_num);
for t = 1:ker_num
    W_temp(:,:,t) = eye(numclass);
end
% 
W{1} = W_temp;
W{2} = W_temp;