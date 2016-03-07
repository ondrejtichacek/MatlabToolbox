function [z,t] = apply_mask(s,m,nfft,hop,fs)
%APPLY_MASKS Apply a time-frequency mask to an STFT
% 
%   Z = APPLY_MASKS(S,M) applies the time-frequency mask M to STFT S. S has
%   dimensions [N,K] where N is the number of frequency bins and K is the
%   number of time frames. The ISTFT is calculated using 1024-point
%   FFTs and hop sizes of 512 points.
% 
%   Z = APPLY_MASKS(S,M,NFFT) uses NFFT-length segments in the ISTFT.
% 
%   Z = APPLY_MASKS(S,M,NFFT,HOP) uses hop size HOP for the ISTFT.
% 
%   [Z,T] = APPLY_MASKS(S,M,NFFT,HOP,FS) uses sampling frequency FS to
%   return the corresponding time T of each element in Z.
% 
%   See also STFT, ISTFT, IDEAL_MASKS, APPLY_IDEAL_MASKS.

%   Copyright 2015 University of Surrey.

% =========================================================================
% Last changed:     $Date: 2015-12-03 22:30:32 +0000 (Thu, 03 Dec 2015) $
% Last committed:   $Revision: 447 $
% Last changed by:  $Author: ch0022 $
% =========================================================================

    %% check input
    
    % check input
    if nargin<2
        error('Not enough input arguments')
    end
    
    % check compulsory inputs
    assert(isequal(size(s),size(m)),'S and M must be the same size')
    
    % check nfft
    if nargin<3
        nfft = 1024;
    else
        assert(isscalar(nfft) && round(nfft)==nfft && nfft>0,'NFFT must be a positive scalar integer')
    end
    
    % determine hop
    if nargin<4
        hop = fix(nfft/2);
    else
        assert(isscalar(hop) & round(hop)==hop,'HOP must be an integer')
        assert(hop<=nfft && hop>0,'HOP must be less than or equal to NFFT, and greater than 0')
    end
    
    % determine fs
    if nargin<5
        fs = 1;
    else
        assert(isscalar(fs),'FS must be an scalar')
    end
    
    %% calculate outputs

    % apply mask and return signal
    z = istft(s.*m,nfft,hop);
    
    % return time
    if nargout>1
        t = (0:length(z)-1)./fs;
    end
    
end
