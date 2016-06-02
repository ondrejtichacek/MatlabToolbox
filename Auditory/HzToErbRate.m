function y=HzToErbRate(x)
%HZTOERBRATE Convert Hz to ERB rate
%
%   Y = HZTOERBRATE(X) converts the frequency X (in Hz) to the eqivalent
%   ERB number Y.
% 
%   See also ERBRATETOHZ, MAKEERBCFS.

%   Copyright 2016 University of Surrey.

    y=(21.4*log10(4.37e-3*x+1));

end
