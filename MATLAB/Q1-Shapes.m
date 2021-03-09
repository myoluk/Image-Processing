% 1. image
a = uint8(255*ones(500,500));
% top half of 1st image
for i=100:250
    for j=100:100+((i-100)*2)
        a(i,j)=0;
    end
end
% bottom half of 1st image
for i=250:400
    for j=100:100+((400-i)*2)
        a(i,j)=0;
    end
end

% 2. image
b = uint8(255*ones(500,500));
% top half of 2nd image
for i=100:250
    for j=400:-1:400-((i-100)*2)
        b(i,j)=0;
    end
end
% bottom half of 2nd image
for i=250:400
    for j=400:-1:400-((400-i)*2)
        b(i,j)=0;
    end
end

% 3. image
c = uint8(255*ones(500,500));
% top half of left triangle
for i=175:250
    for j=250:-1:250-((i-175)*2)
        c(i,j)=0;
    end
end
% bottom half of left triangle
for i=250:425
    for j=250:-1:100+((i-250)*2)
        c(i,j)=0;
    end
end
% top half of right triangle
for i=175:250
    for j=250:250+((i-175)*2)
        c(i,j)=0;
    end
end
% bottom halft of right triangle
for i=250:425
    for j=250:400-((i-250)*2)
        c(i,j)=0;
    end
end


% 4. image (combine 1st and 2nd image)
d = uint8(255*ones(500,500));
% left half of 4th image (1st image)
for i=100:250
    for j=100:100+((i-100)*2)
        d(i,j)=0;
    end
end
for i=250:400
    for j=100:100+((400-i)*2)
        d(i,j)=0;
    end
end
% right halft of 4th image (2nd image)
for i=100:250
    for j=400:-1:400-((i-100)*2)
        d(i,j)=0;
    end
end
for i=250:400
    for j=400:-1:400-((400-i)*2)
        d(i,j)=0;
    end
end

figure;
subplot(2,2,1);imshow(a);title('1.image (a)') %1.image
subplot(2,2,2);imshow(b);title('2.image (b)') %2.image
subplot(2,2,3);imshow(c);title('3.image (c)') %3.image
subplot(2,2,4);imshow(d);title('4.image (d)') %4.image
