clear all
close all
clc

format long
R = VideoReader ('visiontraffic.avi'); %creates object v to read video data from the file named filename
X_Data = Matrix_video(R,171,200);%Put the 30 frames in a matrix
[n,m] = size(X_Data);
X = double(X_Data);

L=randn(n,m);
S=randn(n,m);
crit=rank(L);   %criteriu de pornire
ro = 0.007;
la = 0.0002;
ep = 0.1;
iter=0;                 
lama=la*eye(n,m);       %initializare lambda mare
rezi=[];                %initializare vector de reziduuri

while crit>1

    [U,SI,V]=svd(X-S-1/ro*lama,"econ"); %obtinere U si V 
    SI=max(SI-1/ro,0);      %aflare sigma real
    L=U*SI*V';              %actualizare L
    S=X-L-1/ro*lama;
    S=sign(S).*max(abs(S)-la/ro,0); %actualizare S
    lama=lama+ro*(L+S-X);   %actualizare lambda mare

    rez=norm(L+S-X);    %calculul rezidului
    rezi=[rezi,rez];    %introducere valori reziduri
    crit=rank(L);       %actualizare criteriu
    iter=iter+1         %contorizare iteratii

end

figure(1)

bx=cast(X(:,7),"uint8");
imshow(reshape(bx,360,640));

figure(2)

bl=cast(L(:,7),"uint8");
imshow(reshape(bl,360,640));

figure(3)

bs=cast(S(:,7),"uint8");
imshow(reshape(bs,360,640));

figure(4)

hold on

semilogy(rezi);
xlabel('Iteratii');
ylabel('||L+S-X||');
grid on;

hold off

