clear all
clc
warning off;
path = '.\eigs\eig_save\';
addpath(genpath(path));
Data = cell(1,3);



Data{1} = 'flower17';


NNrate = 0.1:0.1:1;
for name = 1
    for i = 1
        total = zeros(11,11,3);
    %%% spectral clustering of different multiview and different order
        load([path,Data{name},'_',num2str(NNrate(i)),'.mat'],'H','H_average','Y');
        numclass = length(unique(Y));
        %%% initial set
        deata = 2.^(-15:3:15);
        lambda = 2.^(-15:3:15);
        for lam = 1:length(deata)
            for kk = 1:length(lambda)
                [H_star,~,obj] = multi_spectral_late_fusion(H,H_average,lambda(lam),deata(kk),numclass);
                fprintf('NNrate %f,lambda %f,Deata %f\n',[NNrate(i),lambda(lam),deata(kk)]);
                total(lam,kk,:) = myNMIACC(H_star,Y,numclass);
            end
        end
        save(['./result/',Data{name},'_',num2str(NNrate(i)),'.mat'], 'total');
    end
end




