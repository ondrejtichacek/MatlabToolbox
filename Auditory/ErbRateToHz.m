function y=ErbRateToHz(x)
%ERBRATETOHZ Convert ERB rate to Hz.
% 
%   Y = ERBRATETOHZ(X) converts the ERB number X to the eqivalent frequency
%   Y (in Hz).
% 
% See also HZTOERBRATE.

%   Copyright 2016 University of Surrey.

    y=(10.^(x/21.4)-1)/4.37e-3;

end
