function best_res = best_kmeans( inXCell, y)
numclass = length(unique(y));
res = zeros(3,3);
for i = 1:3
    x = inXCell{i};
    label = litekmeans(x,numclass, 'MaxIter',100, 'Replicates',50);
    res(i,:) = myNMIACC_lite(label,y);
end

best_res =  max(res);