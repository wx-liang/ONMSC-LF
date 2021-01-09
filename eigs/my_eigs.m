function [U,D,H,H_average,HC,label] = my_eigs(L,numclass)
order = size(L,2);
view = size(L{1},3);
U = cell(1,order);
D = cell(1,order);
H = cell(1,order);
HC = cell(1,order);
label = cell(1,order);
n = size(L{1},1);
H_average = average_feature(L,numclass);
for i = 1:order
    U_temp = zeros(n,5*numclass,view);
    D_temp = zeros(5*numclass,5*numclass,view);
    H_temp = zeros(n,numclass,view);
    HC_temp = zeros(n,numclass,view);
    label_temp = zeros(n,1,view);
    for j = 1:view  
        [eigvector,D_tt,~] = svd(L{i}(:,:,j));
        eigvector = eigvector(:,end-5*numclass+1:end);
        D_temp(:,:,j) = D_tt(end-5*numclass+1:end,end-5*numclass+1:end);
        U_temp(:,:,j) = eigvector;
        H_temp(:,:,j) = eigvector(:,end-numclass+1:end);
        H_temp(:,:,j) = normlization(H_temp(:,:,j));
        label_temp(:,:,j) = kmeans(H_temp(:,:,j),numclass);
%         HC_temp(:,:,j) = recover_feature(label_temp(:,:,j));
        HC_temp(:,:,j) = 0;
    end
    U{i} = U_temp;
    H{i} = H_temp;
    HC{i} = HC_temp;
    D{i} = D_temp;
    label{i} = label_temp;
end
