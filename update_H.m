function H = update_H(gamma,aver_feature,delta,H,W,numclass)
U = combine_H(H,gamma,W)+delta*aver_feature;
[H_star,~,V] = svd(U,'econ');
H = H_star*V';
end