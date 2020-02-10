function [H, rhoScale, thetaScale] = myHoughTransform(Im, threshold, rhoRes, thetaRes)
Im(Im<threshold)=0;
[row col] = find(Im);
rhoScale=-1000:rhoRes:1000;
thetaScale = thetaRes:thetaRes:pi;
tcos = cos(thetaScale);
tsin = sin(thetaScale);
Hr = size(thetaScale,2);
Hc = size(rhoScale,2);
H = zeros(Hc,Hr);
for i=1:size(row,1)
        for j=1:Hr
            r = row(i,1) * tsin(j) + col(i,1) * tcos(j);
            H(floor(r/rhoRes)+500-2, j) = H(floor(r/rhoRes)+500-2, j) + 1;
        end
end   
end
        
        