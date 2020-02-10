function [img1] = myImageFilter(img0, h)
xoff = floor(size(h,1)/2);
yoff = floor(size(h,2)/2);
newimg = padarray(img0, [xoff, yoff], 0);
img1 = zeros(size(img0));
for i=1:size(img0,1)
    for j=1:size(img0,2)
        tmpimg = newimg(i:i+2*xoff,j:j+2*yoff);
        img1(i,j) = h(:)'*tmpimg(:);
    end
end
end
