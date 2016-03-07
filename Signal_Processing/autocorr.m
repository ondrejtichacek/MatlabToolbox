function a = autocorr(x,Q,dim)
%AUTOCORR Perform autocorrelation via FFT
% 
%   AUTOCORR(X) performs autocorrelation via FFT on vector X. For matrices,
%   the autocorrelation is performed on each column. For N-D arrays, the
%   autocorrelation is performed on the first non-singleton dimension.
% 
%   AUTOCORR(X,Q) allows the sharpness of the autocorrelation to be
%   controlled. Q=2 will give a true autocorrelation; smaller values will
%   lead to sharper peaks.
% 
%   AUTOCORR(X,[],DIM) or autocorr(X,Q,DIM) performs the autocorrelation
%   along the dimension DIM.
%   
%   See also XCORR.

%   Copyright 2015 University of Surrey.

% =========================================================================
% Last changed:     $Date: 2015-07-02 15:47:12 +0100 (Thu, 02 Jul 2015) $
% Last committed:   $Revision: 391 $
% Last changed by:  $Author: ch0022 $
% =========================================================================

    if nargin < 2 || isempty(Q)
        Q = 2;
    end

    if nargin < 3
        nsdim = find(size(x)>1,1,'first');
        if isempty(nsdim)
            dim = 1;
        else
            dim = nsdim;
        end
    end

    a = ifft(abs(fft(x,[],dim)).^Q,[],dim);

end
