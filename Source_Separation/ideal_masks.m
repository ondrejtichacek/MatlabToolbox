function [irm,ibm] = ideal_masks(st,si,q,a)
%IDEAL_MASKS Calculate ideal time-frequency masks from STFTs
% 
%   IRM = IDEAL_MASKS(ST,SI) calculates the ideal ratio mask (IRM) using
%   target STFT ST and interferer STFT SI. ST and SI must be the same size;
%   IRM is the same size as ST and SI.
% 
%   [IRM,IBM] = IDEAL_MASKS(...) returns the ideal binary mask (IBM).
% 
%   IRM = IDEAL_MASKS(ST,SI,Q) uses the exponent Q to create an ideal
%   sigmoidal mask by raising each of the time-frequency powers to Q. With
%   Q=1 (default) the mask is the IRM. As Q->Inf the IRM will tend towards
%   a binary mask. As Q->0 the mask will tend towards 0.5.
% 
%   [IRM,IBM] = IDEAL_MASKS(ST,SI,Q,A) uses the threshold A to calculate
%   the IBM. The threshold is in terms of the ratio of time frequency
%   powers. With A=1 (default), the IBM is 1 when the target power is
%   greater than the interferer power. Setting A=2, for example, requires
%   the target power to be 6dB greater than the interference power.
% 
%   See also APPLY_MASKS, APPLY_IDEAL_MASKS.

%   Copyright 2016 University of Surrey.

    %% check input
    
    assert(isequal(size(st),size(si)),'ST and SI must be the same size')
    
    % check sigmoid
    if nargin<3
        q = 1;
    else
        assert(isscalar(a),'Q must be an scalar')
    end
    
    % check threshold
    if nargin<4
        a = 1;
    else
        assert(isscalar(a),'A must be an scalar')
    end
    
    %% calculate masks
    
    % powers
    St = abs(st).^2;
    Si = abs(si).^2;
    
    % ideal ratio mask
    irm = (St.^q)./((St.^q)+(Si.^q));
    irm(isnan(irm)) = 0;
    
    % ideal binary mask
    if nargout>1
        ibm = +(St./Si>a);
        ibm(isnan(ibm)) = 0;
    end
    
end
