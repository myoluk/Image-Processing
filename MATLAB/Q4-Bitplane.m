%(Bitplane)

%Clear variables and console
clear;
clc;

%Open image
c = imread('cameraman.tif');
%Convert image array to double array
cd = double(c);

%Shift right every binary number
%Every shifted number's lsb bit gives nth number
%Shifting binary mean divide
%floor() func rounds double numbers to int

%get 1.bit (lsb)
%modulo 2 gives lsb in 256
c1 = mod(cd,2);

%get 2.bit
%shift 1.bit(lsb) to get 2.bit
c2 = mod(floor(cd/2),2);

%get 3.bit
%shift 2.bit(lsb) to get 3.bit
c3 = mod(floor(cd/4),2);

%get 4.bit
%shift 3.bit(lsb) to get 4.bit
c4 = mod(floor(cd/8),2);

%get 5.bit
%shift 4.bit(lsb) to get 5.bit
c5 = mod(floor(cd/16),2);

%get 6.bit
%shift 5.bit(lsb) to get 6.bit
c6 = mod(floor(cd/32),2);

%get 7.bit
%shift 6.bit(lsb) to get 7.bit
c7 = mod(floor(cd/64),2);

%get 8.bit (msb)
%shift 7.bit(lsb) to get 8.bit(msb)
c8 = mod(floor(cd/128),2);

%show original image and its bitplanes
subplot(3,3,1);imshow(c);title('Image');
subplot(3,3,2);imshow(c1);title('1.bit (lsb)');
subplot(3,3,3);imshow(c2);title('2.bit');
subplot(3,3,4);imshow(c3);title('3.bit');
subplot(3,3,5);imshow(c4);title('4.bit');
subplot(3,3,6);imshow(c5);title('5.bit');
subplot(3,3,7);imshow(c6);title('6.bit');
subplot(3,3,8);imshow(c7);title('7.bit');
subplot(3,3,9);imshow(c8);title('8.bit (msb)');

