function [U_best,gamma,obj_list] = multi_spectral_late_fusion(H,aver_feature,lambda,delta,numclass)
ker_num = size(H{1},3);
gamma = ones(ker_num,1)/ker_num;
W = init_W(numclass,ker_num);
obj_old = 0;
M = construct_M(H,lambda);
H_star = combine_H(H,gamma,W);
obj = callObj(H_star,H,W,M,aver_feature,gamma,delta);
cout = 0;
obj_list = [];
while abs((obj - obj_old)/obj)>1e-4
    cout = cout + 1;
    obj_old = obj;
    %%%% update gamma
    gamma = update_gamma(H_star,H,W,M);
    %%% update W
    W = update_W(H_star,gamma,H);
    %%% update H
    H_star = update_H(gamma,aver_feature,delta,H,W,numclass);
    obj = callObj(H_star,H,W,M,aver_feature,gamma,delta);
    obj_list = [obj_list obj];
end

U_best = H_star;
