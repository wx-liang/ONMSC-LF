function H_normlization = normlization(H)

H_normlization = H ./ repmat(sqrt(sum(H.^2, 2)), 1, size(H, 2));