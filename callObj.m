function obj = callObj(H_star,H,W,M,feature,gamma,delta)

U = combine_H(H,gamma,W);

obj = trace(H_star'*U) + delta*trace(H_star'*feature)- gamma'*M*gamma;

end