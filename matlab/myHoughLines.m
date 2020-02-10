function [rhos, thetas] = myHoughLines(H, nLines)
rhos = zeros(nLines, 1);
thetas =  zeros(nLines, 1);
k1 = [0 0 0;0 -1 0;1 0 0];
k2 = [0 0 0;0 -1 0;0 1 0];
k3 = [0 0 0;0 -1 0;0 0 1];
k4 = [0 0 0;0 -1 1;0 0 0];
k5 = [0 0 0;1 -1 0;0 0 0];
k6 = [1 0 0;0 -1 0;0 0 0];
k7 = [0 1 0;0 -1 0;0 0 0];
k8 = [0 0 1;0 -1 0;0 0 0];

f = myImageFilter(H, k4);
H(f>0)=0;
f = myImageFilter(H, k5);
H(f>0)=0;
f = myImageFilter(H, k2);
H(f>0)=0;
f = myImageFilter(H, k7);
H(f>0)=0;
f = myImageFilter(H, k1);
H(f>0)=0;
f = myImageFilter(H, k3);
H(f>0)=0;
f = myImageFilter(H, k6);
H(f>0)=0;
f = myImageFilter(H, k8);
H(f>0)=0;

for i =1:nLines
    [x, y] = find(H==max(H(:)), 1);
    rhos(i) = x;
    thetas(i) = y;
    H(x,y)=0;
end

end
        