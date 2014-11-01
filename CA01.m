Computer Assignment 1
clear all

%% Problem 2

BMP = imread('BatmanTestBMP.bmp');
GIF = imread('BatmanTestGIF.gif'); %Looks weird
JPEG = imread('BatmanTestJPEG.jpg');
PNG = imread('BatmanTestPNG.png');

imwrite(PNG, 'TestCreationJPEG', 'jpg'); % Seems strange
BMP_grey = rgb2gray(BMP);
imwrite(BMP_grey, 'W_GIF.gif') %WORKS!
%imwrite(BMP, 'W_GIF2.gif') %Doesn't work...
imshow('W_GIF.gif')

%%
% 
% <<FILENAME.PNG>>
% 

%% Problem 3

[BMP_ind, n] = gray2ind(BMP_grey, 64);
imshow(BMP_ind) %Not sure what this is

BMP_back = ind2gray(BMP_ind,n); %Brought it back with the index. Higher index, more retention
imshow(BMP_back)

%% Image Info Trial
imfinfo('BatmanTestGIF.gif')
imfinfo('W_GIF.gif')

imageinfo = imageinfo('BatmanTestJPEG.jpg') %Same thing
imfinfo('BatmanTestJPEG.jpg')
%% Image Alteration
imshow(JPEG)
imdisplayrange %Doesn't show range

imshow(BMP_grey)
imdisplayrange %Shows Range 255
%% Subplot of Images
figure
subplot(2,2,1)
imshow(GIF),title('GIF')
subplot(2,2,2)
imshow(JPEG),title('JPEG')
subplot(2,2,3)
imshow(PNG),title('PNG')
subplot(2,2,4)
imshow(BMP),title('BMP')

%imtool is useful to look at the specific pixels for pictoral representaion
%of the 3 dimensional image.
%% Changing color maps
h = figure;
imshow(GIF)
imcolormaptool(h)