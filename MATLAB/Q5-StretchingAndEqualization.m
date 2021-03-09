%(Contrast Stretching and Histogram Equalization)

%Clear variables and console
clear;
clc;

%Open image
c = imread('pout.tif');

%Outliers Solving
%Values for if stretching will use
%low_in : minimum value of input image
%high_in : maximum value of input image
%low_out : minimum value to stretched image
%high_out : maximum value to stretched image
low_in = 0.3;
high_in = 0.6;
low_out = 0.0;
high_out = 1.0;
%Assign stretch values as an array
stretch_ratio = [low_in high_in; low_out high_out];

%Send image for stretching
%Use stretch_ratio if want to solve outliers
%Use 0 if do not want to solve outliers -> imstretch(c,0);
% imstretch(c,0);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Adding some black and white pixels to image to solve outliers problem
c(10,10:20) = 0;
c(100,150:160) = 255;
c(200:210,40) = 0;
c(230,180:200) = 255;
c(250:260,120) = 0;
imstretch(c,stretch_ratio);

%Histogram Equalization on the image which added black and white pixels
imhisteq = histeq(c);
figure;
subplot(1,2,1);imshow(imhisteq);title('Histogram Equalized Image');
subplot(1,2,2);imhist(imhisteq);title('Histogram');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Stretching function
%i : input image
%ratio : an array if want to solve outliers problem
%ratio : 0 if stretch image without solve outliers problem
function imstretch(i,ratio)
%Original image
figure;
subplot(1,2,1);imshow(i);title('Original Image');
subplot(1,2,2);imhist(i);title('Histogram');

%ratio : 0 stretching image without solve outliers problem
if (ratio == 0)
    %imadjust(image)
    normal_stretched = imadjust(i);
    %show without outliers solved stretched image and its histogram
    figure;
    subplot(1,2,1);imshow(normal_stretched);title('Normal Stretched Image');
    subplot(1,2,2);imhist(normal_stretched);title('Histogram');
%ratio : an array to stretching image with solve outliers problem
else
    %imadjust(image, [low_in; high_in], [low_out; high_out])
    outlier_stretched = imadjust(i, [ratio(1,1);ratio(1,2)], [ratio(2,1);ratio(2,2)]);
    %show outliers solved stretched image and its histogram
    figure; 
    subplot(1,2,1);imshow(outlier_stretched);title('Outliers Solved Stretched Image');
    subplot(1,2,2);imhist(outlier_stretched);title('Histogram');
end

end