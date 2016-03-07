function ild = calc_ild(L,R,method)
% Calculate normalised interaural level difference
% 
%   ILD = CALC_ILD(L,R) calculates the ILD of vectors L and R. Rather than
%   a logarithmic ratio, the returned ILD is in the range [-1,1]. The
%   algorithm has the following steps:
%   
%   1. Calculate total power for each L and R vectors. 2. Calculate
%      difference of powers and divide by power sum.
%   3. Square result, ensuring sign is retained. This improves contrast 
%      when the signals are of a similar level.
% 
%   ILD = CALC_ILD(L,R,METHOD) determines the nature of the ILD that is
%   returned, and consequently how it is calculated. When method is
%   'overall' (default), the ILD for the entire signal is returned, based
%   on the power carried by the fine structure. When method is 'vector',
%   the ILD is calculated using the instaneous Hilbert envelope and the
%   function returns a vector the same size as L or R.
% 
%   The function is derived from Ben Supper's thesis "An onset-guided
%   spatial analyser for binaural audio"

%   Copyright 2015 University of Surrey.

% =========================================================================
% Last changed:     $Date: 2015-07-02 15:47:12 +0100 (Thu, 02 Jul 2015) $
% Last committed:   $Revision: 391 $
% Last changed by:  $Author: ch0022 $
% =========================================================================

    assert(isvector(L) & isvector(R),'L and R must be vectors')
    assert(all(size(L)==size(R)),'L and R must be the same size')

    if nargin<3
        method='overall';
    else
        assert(ischar(method),'METHOD must be a string.')
    end

    switch lower(method)
        case 'vector'
            envL = calc_env(L);
            envR = calc_env(R);
            p_L = envL.^2;
            p_R = envR.^2;
        case 'overall'
            p_L = sum(L.^2);
            p_R = sum(R.^2);
        otherwise
            error(['Unknown method ''' method '''.'])
    end
    ild = (p_L-p_R)./(p_L+p_R);
    ild = sign(ild).*(ild.^2);

    end

function y = calc_env(x)
%CALC_ENV return signal Hilbert envelope

    y = abs(hilbert(x));

end
