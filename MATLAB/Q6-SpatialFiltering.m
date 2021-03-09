%(Spatial Filtering)

%Clear variables and console
clear;
clc;

%Open image
c = imread('cameraman.tif');

%3x3 Laplacian filters +8 at the center
laplacian_filter = [-1 -1 -1;-1 8 -1;-1 -1 -1];

%Send image and laplacian filter to applying filter
imlap(c,laplacian_filter);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%2 steps sharpening
%Firstly applying 3x3 gaussian filter
sigma = 0.5;
h = fspecial('gaussian',3,sigma);
filtered_gaussian = imfilter(c,h);
%Secondly applying 3x3 laplacian filter (-4 at center)
laplacian_filter = [0 1 0;1 -4 1;0 1 0];
imlap(filtered_gaussian,laplacian_filter);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%2 steps sharpening
%Firstly applying 3x3 gaussian filter
sigma = 1;
h = fspecial('gaussian',3,sigma);
filtered_gaussian2 = imfilter(c,h);
%Secondly applying 3x3 laplacian filter (-4 at center)
laplacian_filter = [1 1 1;1 -8 1;1 1 1];
imlap(filtered_gaussian2,laplacian_filter);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%This function applies the filter to image
%After, shows the filtered image
function imlap(i,filter)

filtered = imfilter(i,filter);
figure;
imshow(filtered);

end