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

%   Copyright 2016 University of Surrey.

    cfs = ErbRateToHz(linspace(HzToErbRate(mincf),HzToErbRate(maxcf),numchans));

end
