nx = 60;
ny = 50;

G = sparse(nx*ny);
V = zeros(nx,ny);

part9 = 0;

for i = 1:nx
    for j = 1:ny
        n = j + (i-1)*ny; %Node Mapping
        nxp = j + i*ny;
        nxm = j + (i-2)*ny;
        nyp = n + 1;
        nym = n - 1;
        
        if i == 1
           G(n,:) = 0;
           G(n,n) = 1;
        elseif i == nx
            G(n,:) = 0;
            G(n,n) = 1;
        elseif j == 0
            G(n,:) = 0;
            G(n,n) = 1;
        elseif j == ny
            G(n,:) = 0;
            G(n,n) = 1;
        else
            if (part9 == 1)
                if(i > 10 && i < 20 && j > 10 && j < 20)
                    G(n,n) = -2;
                else
                    G(n,n) = -4;
                end
            else
                G(n,n) = -4;
            end
            G(n,nxm) = 1;
            G(n,nxp) = 1;
            G(n,nym) = 1;
            G(n,nyp) = 1;
            
        end
    end
end

figure(1)
spy(G);

[E,D] = eigs(G,9,'SM'); %E is eigenvetors, D is eigenvalues
figure(2)
plot(diag(D),'*');

figure(3)
for i = 1:9
    a = reshape(E(:,i), [nx ny]);
    subplot(3,3,i), surf(a, 'linestyle', 'none');
end

%When nx and ny are not equal: 
%   When they are not equal the modes don't mix

%Part 9:
% Lot of high order modes in that region
%Optically you can think of this as increasing the index of refraction in
%that region
