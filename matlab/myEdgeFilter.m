function [img1] = myEdgeFilter(img0, sigma)
kx = [1 0 -1; 2 0 -2;1 0 -1];
knmsx1 = [0 0 0;0 -1 1;0 0 0];
knmsx2 = [0 0 0;1 -1 0;0 0 0];
ky = [1 2 1; 0 0 0;-1 -2 -1];
knmsy1 = [0 1 0;0 -1 0;0 0 0];
knmsy2 = [0 0 0;0 -1 0;0 1 0];
ks = 2 * ceil(3 * sigma) + 1;
h = fspecial('gaussian', ks, sigma);

blurred_image = myImageFilter(img0, h);
v_edge = myImageFilter(blurred_image, kx).^2;
v_edge_nms = myImageFilter(v_edge, knmsx1);
v_edge(v_edge_nms>0)=0;
v_edge_nms = myImageFilter(v_edge, knmsx2);
v_edge(v_edge_nms>0)=0;

h_edge = myImageFilter(blurred_image, ky).^2;
h_edge_nms = myImageFilter(h_edge, knmsy1);
h_edge(h_edge_nms>0)=0;
h_edge_nms = myImageFilter(h_edge, knmsy2);
h_edge(h_edge_nms>0)=0;

img1 = h_edge+v_edge;
end
    
                
        
        
