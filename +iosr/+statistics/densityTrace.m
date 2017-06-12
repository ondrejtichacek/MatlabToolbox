function [d, xd] = densityTrace(x, bins, h)
%DENSITYTRACE Calculate the density trace of a data set
%   
%   [D, XD] = IOSR.STATISTICS.DENSITYTRACE(X) calculate the density trace D
%   [1] of a dataset X for query points XD. The density trace is calculated
%   for 100 query points equally spaced between the minimum and maximum of
%   the data X. The bins used to calculate the density have a width equal
%   to 15% of the range of the data X. X may be a vector, matrix, or
%   multi-dimensional array; D and XD are 100-point column vectors.
% 
%   ... = IOSR.STATISTICS.DENSITYTRACE(X, BINS) calculates the
%   density for the query points specified by BINS. If BINS is a
%   scalar, then BINS points are queried between MIN(X) and MAX(X); if
%   BINS is a vector, then the values are used as the query points
%   directly. D and XD are column vectors.
% 
%   ... = IOSR.STATISTICS.DENSITYTRACE(X, BINS, H) uses the bin width H
%   to calculate the density trace. H must be a scalar.
% 
%   Examples
% 
%     Example 1: Plot the density trace of gaussian data
%       figure
%       % gaussian random numbers
%       y = randn(100000, 1);
%       % density trace
%       [d, xd] = iosr.statistics.densityTrace(y);
%       % plot
%       plot(xd, d);
% 
%     Example 2: Density trace with 200 bins of width of 10% of data range
%       figure
%       % random numbers
%       y = randn(100000, 1);
%       % y range
%       range = max(y(:)) - min(y(:));
%       % density trace
%       [d, xd] = iosr.statistics.densityTrace(y, 200, 0.1*range);
%       % plot
%       plot(xd, d);
% 
%   References
% 
%   [1] Chambers, J. M., Cleveland, W. S., Kleiner, B., and Tukey, P. A.
%       (1983), Graphical Methods for Data Analysis, Belmont, CA:
%       Wadsworth.

    %% input check

    x = x(:);
    assert(numel(x) > 1, 'X must be a vector, matrix, or array.')
    
    % x bins
    if nargin < 2
        bins = 100;
    end
    if isscalar(bins)
        bins = linspace(min(x), max(x), round(bins));
    end
    bins = bins(:);
    
    % bin width
    if nargin < 3
        h = 0.15 * (max(x) - min(x));
    end
    assert(isscalar(h), 'h must be a scalar')
    
    %% calculate kernel trace

    xd = sort(bins);
    d = zeros(size(xd));
    
    for i = 1:numel(xd)
        d(i) = sum(x >= (xd(i) - h/2) & x <= (xd(i) + h/2))./(numel(x)*h);
    end
    d(isnan(d)) = 0;

end
