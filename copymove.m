%fft-based detection of copy- move forgery in images

%BLURRÝNG E DAYANIKLI, SIKIÞTIRMA+BLUR
%SIKISTIRMA, AWGN VE 5 DÖNMEYE dayanýklý
clc,clear,close all
 tic
% % %%%%
 resim=imread('IMG_3661.jpg');figure,imshow(resim,[]);
 resimgri = rgb2gray(resim); %resmi griye dönüþtürdük
 figure,imshow(resimgri,[]);
  %colormap(jet(64)), %colorbar;
%DCT sonrasý 8*8 lýk bloklar lazým görüntü matrisimizi k adet 8*8 lýk
%bloklara bölüyoruz
%2.adým bloklama
 [M,N]=size(resimgri);%size of image
 B=8;%size of block
 k=(M+1-B)*(N+1-B); %k, number of block
 

  newB = zeros(k,18);
  for i=1:(M+1-B)
    for j=1:(N+1-B)
       Blok = zeros(8,8);
       for abc=1:8
           for cba=1:8
                Blok(abc,cba) = resimgri(i+abc-1,j+cba-1);
           end
       end
       
       J = dct2(Blok);
        W=zigzag(J);
        for h=1:16
            newB(((i-1)*8)+j,h)= W(1,h);
        end
        newB(((i-1)*(M-7))+j, 17) = i;
        newB(((i-1)*(M-7))+j, 18) = j;
       
    end
  end

%newC = sortrows(newB);
 
