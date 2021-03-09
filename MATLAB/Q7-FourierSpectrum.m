%(Fourier Spectrum and Average Value)

%Clear variables and console
clear;
clc;

%Open image
c = imread('characters_test_pattern.tif');

%Fourier transform of image c
ft = fft2(c);

%Get absolute values of complex double array (spectrum)
ft_abs = abs(ft);

%Shift to make centered
ft_centered = fftshift(ft_abs);

%Get log
ft_log = log(ft_centered);

%Get scaled values of fourier transform absolute values
ft_scaled = (ft_log - min(ft_log(:))) / (max(ft_log(:)) - min(ft_log(:)));
ft_scaled = im2uint8(ft_scaled);

figure();
subplot(1,2,1);imshow(c);title('Image');
subplot(1,2,2);imshow(ft_scaled);title('Spectrum');

%Get the average radial arrays
%Get row and column size
[rows,columns] = size(c);
%Get middle of row and column
midRow = rows/2+1;
midCol = columns/2+1;
%Set maximum radius that will limit
maxRadius = ceil(sqrt(midRow^2 + midCol^2));
%Create array (maxRadius x 1) to save every radiuses
radialArray = zeros(maxRadius,1);
%Create a counter array (maxRadius x 1) to count radiuses
count = zeros(maxRadius,1);
%Compute pixel by pixel
for col = 1:columns
    for row = 1:rows
        %Compute every pixel's radius
        radius = sqrt((row - midRow)^2 + (col-midCol)^2);
        %Set index
        thisIndex = ceil(radius) + 1;
        %Add this index that come from (4.1) (centered spectrum)
        radialArray(thisIndex) = radialArray(thisIndex) + ft_centered(row, col);
        %Increase counter for every repeat
        count(thisIndex) = count(thisIndex) + 1;
    end
end
%Get avarege
%Pointwise divide to get avarages
radialArray = radialArray./count;
%Display radial Array
figure();plot(radialArray, 'b-', 'LineWidth', 1);
title('Average Array of Spectrum');

