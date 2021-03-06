function [H2to1] = computeH(p1, p2)
% inputs:
% p1 and p2 should be 2 x N matrices of corresponding (x, y)' coordinates between two images
%
% outputs:
% H2to1 - a 3 x 3 matrix encoding the homography that best matches the linear equation

N = size(p1,1);
A = zeros(2*N,9);

for i=1:N
    x1 = p1(i,1);
    y1 = p1(i,2);
    x2 = p2(i,1);
    y2 = p2(i,2);
    
    A(i*2-1,:) = [-x2 -y2 -1 0 0 0 x2*x1 y2*x1 x1];
    A(i*2,:) = [0 0 0 -x2 -y2 -1 x2*y1 y2*y1 y1];
end

[~,~,v] = svd(A);
h = v(:,end);
H2to1 = reshape(h,[3 3])';

%%%

end
