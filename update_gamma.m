function gamma = update_gamma(H_star,H,W,M)
order = size(H,2);
m = size(H{1},3);
d = size(H{1},2);
n = size(H{1},1);
f = zeros(m,1);
H_W_sum = zeros(n,d,m);

for kk = 1:order
    H_temp = H{kk};
    W_temp = W{kk};
    for tt = 1:m
        H_W_sum(:,:,tt) = H_temp(:,:,tt)*W_temp(:,:,tt);
    end
end
for i = 1:m
    f(i) = trace(H_star'*H_W_sum(:,:,i));
end
options = optimset('Display','off');
gamma = quadprog(M/2,-f,[],[],ones(1,m),1,zeros(m,1),ones(m,1),[],options);
end
