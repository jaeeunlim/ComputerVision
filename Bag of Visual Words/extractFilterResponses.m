function [filterResponses] = extractFilterResponses(I, filterBank)
% CV Spring 2018 - Provided Code
% Extract the filter responses given the image and filter bank
% Pleae make sure the output format is unchanged.
% Inputs:
%   I:                  a 3-channel RGB image with width W and height H
%   filterBank:         a cell array of N filters
% Outputs:
%   filterResponses:    a W*H x N*3 matrix of filter responses


    %Convert input Image to Lab
    doubleI = double(I);
    if length(size(doubleI)) == 2
        tmp = doubleI;
        doubleI(:,:,1) = tmp;
        doubleI(:,:,2) = tmp;
        doubleI(:,:,3) = tmp;
    end
    [L,a,b] = RGB2Lab(doubleI(:,:,1), doubleI(:,:,2), doubleI(:,:,3));
    h = size(I,1);
    w = size(I,2);

   
    % -----fill in your implementation here --------
    n = length(filterBank);
    filterResponses = zeros(h,w,3*n);
    
    for i = 1:n
        filter = filterBank{i};
        filterResponses(:,:,(i-1)*3+1) = imfilter(L,filter);
        filterResponses(:,:,(i-1)*3+2) = imfilter(a,filter);
        filterResponses(:,:,(i-1)*3+3) = imfilter(b,filter);
    end

    % ------------------------------------------
end
