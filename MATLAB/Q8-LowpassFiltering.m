%(Lowpass Filtering)

%Clear variables and console
clear;
clc;

%Open image
c = imread('characters_test_pattern.tif');

%Get double values of image
cd = double(c);

%Size of image
[rows,columns] = size(cd);

%Gaussian kernel
%Kernel size
toSize = 4;
%Sigma
s = 1.76;
%9x9 kernel size : -4 -3 -2 -1 0 1 2 3 4
%To change location of the center of Gaussian function, 
%assign a kernel as an array
[M,N]=meshgrid(-toSize:toSize,-toSize:toSize);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %If want to change location of center of Gaussian function
% M=[-2 -1 0 1 2 3 4 5 6;
%    -2 -1 0 1 2 3 4 5 6;
%    -2 -1 0 1 2 3 4 5 6;
%    -2 -1 0 1 2 3 4 5 6;
%    -2 -1 0 1 2 3 4 5 6;
%    -2 -1 0 1 2 3 4 5 6;
%    -2 -1 0 1 2 3 4 5 6;
%    -2 -1 0 1 2 3 4 5 6;
%    -2 -1 0 1 2 3 4 5 6;
%    ];
% N=M;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Applying Gaussian function
expo = -(M.^2 + N.^2)/(2*s*s);
kernel = exp(expo)/(2*pi*s*s);

%Output image
out = zeros(rows,columns);

%Add filter size to image to do not be oversize
cd = padarray(cd,[toSize toSize]);

%Filter sizes to applying filter
filterSizeX = size(M,1);
filterSizeY = size(N,1);

%Applying filter pixel by pixel
for i=1:rows
    for j=1:columns
        filtered = cd(i:i+filterSizeX-1, j:j+filterSizeY-1).*kernel;
        out(i,j) = sum(filtered(:));
    end
end

figure();
%Show original image
subplot(1,2,1);imshow(c);title('Image');
%Show filtered image
out = uint8(out);
subplot(1,2,2);imshow(out);title('Lowpass Filtered Image');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%(5.2) duplicate results
figure(2);
subplot(3,2,1);imshow(c);

for i=1:5
    s = (6-i)*5;
	cutoff = ceil(3*s);
	h = fspecial('gaussian',2*cutoff+1,s);
	out = imfilter(c,h);
	figure(2);subplot(3,2,i+1);imshow(out);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

