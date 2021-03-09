%adding corner strip to image
img = imread('cameraman.tif');  %load image as a matrix pixel by pixel
for i=1:56          %high of strip
    limit=215+i;    %bold of strip
    if limit>256    %limit for overflow pixel location
        limit=256;
    end
    for j=200+i:limit
        img(i,j)=0;
    end
end
figure;imshow(img)  %show image