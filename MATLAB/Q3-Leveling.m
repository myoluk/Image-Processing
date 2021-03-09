% RGB image to grayscale and levels
rgbimage = imread('autumn.tif');    %load RGB image
grayimage = rgb2gray(rgbimage);     %convert RGB image to grayscale
[h,w] = size(grayimage);            %get height and width of the image
figure
%3x4 grid image showing area
subplot(3,4,2);imshow(rgbimage);title(['RGB Image (',num2str(w),'x',num2str(h),')'])
subplot(3,4,3);imshow(grayimage);title(['Grayscale Image (',num2str(w),'x',num2str(h),')'])
bitpower = [1 2 3 4 5 6 7 8];       %bits for power of 2
for i=1:8                           %start bitpower index 1 to 8
    bit = 2^bitpower(i)-1;          %bits for divide image pixels (-1 for 2^8=256, maximum is 255)
    newlevelimage = round(grayimage/bit);   %divide every pixels and get leveled image
    %show leveled image in grid image area
    subplot(3,4,i+4);imshow(newlevelimage*bit);title([num2str(2^(9-i)),' levels'])  
end
impixelinfo                         %show pointly details