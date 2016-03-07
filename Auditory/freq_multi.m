function PI = freq_multi(f)
%FREQ_MULTI Calculate frequency coefficient for ITD-azimuth warping
%
%   PI = FREQ_MULTI(F) calculates the coefficient PI for frequency F for
%   use in converting between ITD and azimuth in Kuhn's model [1].
% 
%   References
% 
%   [1] Kuhn, G.F. (1977), Model for the interaural time differences in the
%       azimuthal plane, The Journal of the Acoustical Society of America
%       62, 1, 157-167.
% 
%   See also AZIMUTH2ITD, ITD2AZIMUTH.

%   Copyright 2015 University of Surrey.

% =========================================================================
% Last changed:     $Date: 2015-07-02 15:47:12 +0100 (Thu, 02 Jul 2015) $
% Last committed:   $Revision: 391 $
% Last changed by:  $Author: ch0022 $
% =========================================================================

    PI = zeros(size(f));
    PI(f<=500) = 3;
    PI(f>=3000) = 2;
    IX = f>500 & f<3000;
    PI(IX) = 2.5+0.5.*cos(pi.*((log2((sqrt(6).*f(IX))./1250))./(log2(6))));

end
