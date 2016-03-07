function y=ErbRateToHz(x)
%ERBRATETOHZ Convert ERB rate to Hz.
% 
%   Y = ERBRATETOHZ(X) converts the ERB number X to the eqivalent frequency
%   Y (in Hz).
% 
% See also HZTOERBRATE.

%   Copyright 2015 University of Surrey.

% =========================================================================
% Last changed:     $Date: 2015-07-02 15:47:12 +0100 (Thu, 02 Jul 2015) $
% Last committed:   $Revision: 391 $
% Last changed by:  $Author: ch0022 $
% =========================================================================

    y=(10.^(x/21.4)-1)/4.37e-3;

end
