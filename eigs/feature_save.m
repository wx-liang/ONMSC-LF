clear all
clc
warning off;


Data = cell(1,4);

Data{1} = 'flower17';



for name = 1
    load([Data{name},'_Kmatrix'],'KH','Y');
    numclass = length(unique(Y));
    n = size(KH,1);
    ker_num = size(KH,3);
    KH = kcenter(KH);
    KH = knorm(KH);
    NNrate = 0.1:0.1:1;
    for i = 1:length(NNrate)
        KHN = LocalKernelCalculation(KH , NNrate(i), numclass);
        L = laplacian_generation(KHN);
        [U,D,H,H_average,HC,label] = my_eigs(L,numclass);
        save(['./eig_save/',Data{name},'_',num2str(NNrate(i)),'.mat'],'H','H_average','Y');
    end
        
end