clear;
clc;

image1 = imread('Image1/exposure1.jpg');
image2 = imread('Image1/exposure2.jpg');
image3 = imread('Image1/exposure3.jpg');
image4 = imread('Image1/exposure4.jpg');
image5 = imread('Image1/exposure5.jpg');
image6 = imread('Image1/exposure6.jpg');
image7 = imread('Image1/exposure7.jpg');
image8 = imread('Image1/exposure8.jpg');
image9 = imread('Image1/exposure9.jpg');
image10 = imread('Image1/exposure10.jpg');
image11 = imread('Image1/exposure11.jpg');
image12 = imread('Image1/exposure12.jpg');
image13 = imread('Image1/exposure13.jpg');
image14 = imread('Image1/exposure14.jpg');
image15 = imread('Image1/exposure15.jpg');
image16 = imread('Image1/exposure16.jpg');


time_exposures = [1/2500, 1/1000, 1/500, 1/250, 1/125, 1/60, 1/30, 1/15, 1/8, 1/4, 1/2, 1, 2, 4, 8, 15];

[~, ~,channels] = size(image1);

%weightfunction = "uniform";
%weightfunction = "tent";
weightfunction = "Gaussian";
%weightfunction = "photon";

for i = 1:channels
    images = {image1(:,:,i), image2(:,:,i), image3(:,:,i), image4(:,:,i), image5(:,:,i), image6(:,:,i), image7(:,:,i), image8(:,:,i), image9(:,:,i), image10(:,:,i), image11(:,:,i), image12(:,:,i), image13(:,:,i), image14(:,:,i), image15(:,:,i), image16(:,:,i)};
    radianceMap = mergeLDRStack(images , time_exposures , weightfunction);
    figure(i)
    imagesc(radianceMap)
    colorbar
    colormap(turbo)
    title(weightfunction +' function channel ' + i);
    figure(3+i)
    histogram(radianceMap)
    title(weightfunction +' function channel ' + i);
end



