function M = construct_M(H,lambda_value)
order = size(H,2);
H_matrix_N = cell(1,order);
M = zeros(size(H{1},3));
% M = zeros(size(H{1},3));
for o = 1:order
    H_matrix_N{o} = Cor_Calculation(H{o});
    M = M + H_matrix_N{o};
end
M = M*lambda_value;
end



function H_Correlation = Cor_Calculation(H)
ker = size(H,3);
%H_Correlation = gpuArray(zeros(ker));
for ii = 1:ker
    for jj = ii:ker
%         a = gpuArray(norm(H(:,:,ii),'fro'));
%         b = gpuArray(norm(H(:,:,jj),'fro'));
        a = norm(H(:,:,ii),'fro');
        b = norm(H(:,:,jj),'fro');
        H_Correlation(ii,jj) = trace(H(:,:,ii)'*H(:,:,jj))/(a*b);
    end
end
H_Correlation = (H_Correlation+H_Correlation')/2;
end