function itd = azimuth2itd(azimuth,f)
%AZIMUTH2ITD Convert azimuth in degrees to ITD
% 
%   ITD = AZIMUTH2ITD(AZIMUTH,F) converts the azimuth AZIMUTH in degrees at
%   frequency F to interaural time difference according to Kuhn's model
%   [1].
% 
%   References
% 
%   [1] Kuhn, G.F. (1977), Model for the interaural time differences in the
%       azimuthal plane, The Journal of the Acoustical Society of America
%       62, 1, 157-167.
% 
%   See also ITD2AZIMUTH, FREQ_MULTI.

%   Copyright 2015 University of Surrey.

% =========================================================================
% Last changed:     $Date: 2015-07-02 15:47:12 +0100 (Thu, 02 Jul 2015) $
% Last committed:   $Revision: 391 $
% Last changed by:  $Author: ch0022 $
% =========================================================================

    assert(isnumeric(azimuth),'AZIMUTH must be numeric')
    assert((isscalar(f) | isscalar(azimuth)) | numel(f)==numel(azimuth),...
        'F or ITD must be a scalar, or F and AZIMUTH must be the same size')

    czero = 344;
    itd = (freq_multi(f).*0.091.*sind(azimuth))./czero;

end
