function cfs = MakeErbCFs(mincf,maxcf,numchans)
%MAKEERBCFS Make a series of center frequencies equally spaced in ERB-rate.
% 
%   This function makes a vector of center frequenies equally spaced on the
%   ERB-rate scale.
%   
%   CFS = MAKEERBCFS(MINCF,MAXCF,NUMCHANS) creates NUMCHANS centre
%   frequencies between MINCF and MAXCF.
%
%   Adapted from code written by: Guy Brown, University of Sheffield, and
%   Martin Cooke.
% 
%   See also ERBRATETOHZ, HZTOERBRATE.

%   Copyright 2015 University of Surrey.

% =========================================================================
% Last changed:     $Date: 2015-07-02 15:47:12 +0100 (Thu, 02 Jul 2015) $
% Last committed:   $Revision: 391 $
% Last changed by:  $Author: ch0022 $
% =========================================================================

    cfs = ErbRateToHz(linspace(HzToErbRate(mincf),HzToErbRate(maxcf),numchans));

end
