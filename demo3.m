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

image1r = imresize(image1,0.05);
image2r = imresize(image2,0.05);
image3r = imresize(image3,0.05);
image4r = imresize(image4,0.05);
image5r = imresize(image5,0.05);
image6r = imresize(image6,0.05);
image7r = imresize(image7,0.05);
image8r = imresize(image8,0.05);
image9r = imresize(image9,0.05);
image10r = imresize(image10,0.05);
image11r = imresize(image11,0.05);
image12r = imresize(image12,0.05);
image13r = imresize(image13,0.05);
image14r = imresize(image14,0.05);
image15r = imresize(image15,0.05);
image16r = imresize(image16,0.05);
time_exposures = [1/2500, 1/1000, 1/500, 1/250, 1/125, 1/60, 1/30, 1/15, 1/8, 1/4, 1/2, 1, 2, 4, 8, 15];

[~, ~,channels] = size(image1);
weightfunction = "uniform";
%weightfunction = "tent";
%weightfunction = "Gaussian";
%weightfunction = "photon";
 smoothingLamda = 1.5;
for i = 1:1
    images = {image1r(:,:,i), image2r(:,:,i), image3r(:,:,i), image4r(:,:,i), image5r(:,:,i), image6r(:,:,i), image7r(:,:,i), image8r(:,:,i), image9r(:,:,i), image10r(:,:,i), image11r(:,:,i), image12r(:,:,i), image13r(:,:,i), image14r(:,:,i), image15r(:,:,i), image16r(:,:,i)};
    responseCurve = estimateResponseCurve(images ,time_exposures , smoothingLamda , weightfunction);
    figure(i)
    plot(responseCurve)
    title(weightfunction +' function channel ' + i);
 
end