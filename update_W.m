function W = update_W(H_star,gamma,H)
order = size(H,2); %% 阶数
m = size(H{1},3);%% 视图数量
d = size(H{1},2);%%% 维度
W = cell(1,2);
% W_temp = zeros(d,d,m);
W_temp = zeros(d,d,m);
for kk = 1:order
    H_temp = H{kk};
    for i = 1:m
        V_temp = gamma(i)*H_temp(:,:,i)'*H_star;
        [U_temp,~,V] = svd(V_temp);
        W_temp(:,:,i) = U_temp*V';
    end
    W{kk} = W_temp;
end