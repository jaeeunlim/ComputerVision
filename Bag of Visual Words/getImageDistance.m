function [dist] = getImageDistance(hist1, histSet, method)
% Computes the distance from the feature vector (returned by getImageFeatures
% or getImageFeaturesSPM) histogram to all of the feature vectors for the
% training images.
% Inputs:
%   hist1:           image1 histogram
%   histSet:         matrix of histograms
%   method:          string 'euclidean' or 'chi2'

% Outputs:
%   dist:          distance between two histograms

% Note: Please update the function if you decide to implement the set version 
% getImageDistance(hist1, histSet, method)

	% -----fill in your implementation here --------
    if method == string('chi2')
        method = 'chisq';
    else
        method = 'sqeuclidean';
    end
    
    dist = pdist2(hist1,histSet,method);
    % ------------------------------------------

end
