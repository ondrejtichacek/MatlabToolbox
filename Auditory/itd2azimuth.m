function azimuth = itd2azimuth(itd,f)
%ITD2AZIMUTH Convert ITD to azimuth
%
%   AZIMUTH = ITD2AZIMUTH(ITD,F) converts the interaural time difference
%   ITD (in seconds) at frequency F (in Hz) to AZIMUTH (in degrees)
%   according to Kuhn's model [1].
% 
%   References
% 
%   [1] Kuhn, G.F. (1977), Model for the interaural time differences in the
%       azimuthal plane, The Journal of the Acoustical Society of America
%       62, 1, 157-167.
% 
%   See also AZIMUTH2ITD, FREQ_MULTI.

%   Copyright 2016 University of Surrey.

    assert(isnumeric(itd),'ITD must be numeric')
    assert((isscalar(f) | isscalar(itd)) | numel(f)==numel(itd),...
        'F or ITD must be a scalar, or F and ITD must be the same size')

    % Check sanity of ITDs
    check = itd>azimuth2itd(90,f);
    if any(check(:))
        error('ITDs greater than maximum ITD [=azimuth2itd(90,f)] have been specified.')
    end

    czero = 344;
    azimuth = asind((itd.*czero)./(freq_multi(f).*0.091));

end
