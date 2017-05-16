clear all;
close all;
clc;

figure(1);
A = imread('cola.png');
imshow(A);

figure(2);
%RGB -> GREY
G = A(:,:,1).*0.21 + A(:,:,2)*0.72 + A(:,:,3).*0.07; 
imshow(G);

[N,M] = size(G);
H = zeros(256,1);

%Histogram
for i=1:N
    for j=1:M
        H(G(i,j)+1) = H(G(i,j)+1)+1;
    end
end
figure(3);
plot(H);

%Thresholding
for i=1:N
    for j=1:M
        if(G(i,j) > 250)
            G(i,j) = 255;
        else 
            G(i,j) = 0;
        end
    end
end
figure(4);
imshow(G);