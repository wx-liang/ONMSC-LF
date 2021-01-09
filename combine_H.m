function U = combine_H(H,gamma,W)

n = size(H{1},1);   %%% number of samples
d = size(H{1},2);   %%% number of clusterings

U = zeros(n,d);
for j = 1:size(H,2)
    for i = 1:length(gamma)
        H_temp = H{j};
        W_temp = W{j};
        U = U + gamma(i)*H_temp(:,:,i)*W_temp(:,:,i);
    end
end