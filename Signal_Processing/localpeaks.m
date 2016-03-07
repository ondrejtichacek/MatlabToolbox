function peaks = localpeaks(x,mode)
%LOCALPEAKS  Find local peaks and troughs in a vector
%
%   This function returns the indices of local peaks and/or troughs in a
%   vector.
%
%   PEAKS = LOCALPEAKS(X) locates the local peaks in vector X.
%
%   PEAKS = LOCALPEAKS(X,MODE) locates local features specified by mode,
%   which can be set to 'peaks' (default), 'troughs' in order to identify
%   local troughs, or 'both' in order to identify both local peaks and
%   troughs.

%   Copyright 2015 University of Surrey.

% =========================================================================
% Last changed:     $Date: 2015-07-02 15:47:12 +0100 (Thu, 02 Jul 2015) $
% Last committed:   $Revision: 391 $
% Last changed by:  $Author: ch0022 $
% =========================================================================

    assert(isvector(x),'Input must be a vector')

    if nargin < 2
        mode = 'peaks';
    end

    switch lower(mode)
        case 'peaks'
            % do nothing
            peaks = find_peaks(x);
        case 'troughs'
            peaks = find_peaks(-x);
        case 'both'
            peaks = find_peaks(x) | find_peaks(-x);
        otherwise
            error('Unknown localpeak mode. Please specify ''peaks'', ''troughs'' or ''both''');
    end

end

function peaks = find_peaks(x)
%FIND_PEAKS find local peaks in a vector

    peaks = false(size(x));
    peaks(2:end-1) = sign(x(2:end-1)-x(1:end-2)) + sign(x(2:end-1)-x(3:end)) > 1;

end
