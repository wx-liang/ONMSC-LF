function HC = recover_feature(label)
n = length(label);
numclass = length(unique(label));
HC = zeros(n,numclass);

for kk = 1:numclass
    for i = 1:n
        if label(i) == kk
            HC(i,kk) = 1/sqrt(sum(label == kk));
        end
    end
end