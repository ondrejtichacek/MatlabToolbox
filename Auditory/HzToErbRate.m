function y=HzToErbRate(x)
%HZTOERBRATE Convert Hz to ERB rate
%
%   Y = HZTOERBRATE(X) converts the frequency X (in Hz) to the eqivalent
%   ERB number Y.
% 
%   See also ERBRATETOHZ, MAKEERBCFS.

%   Copyright 2015 University of Surrey.

% =========================================================================
% Last changed:     $Date: 2015-07-02 15:47:12 +0100 (Thu, 02 Jul 2015) $
% Last committed:   $Revision: 391 $
% Last changed by:  $Author: ch0022 $
% =========================================================================

    y=(21.4*log10(4.37e-3*x+1));

end
