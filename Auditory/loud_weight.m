function g = loud_weight(f,phon)
%LOUD_WEIGHT Calculate loudness weighting coefficients based on ISO 226
% 
%   G = LOUD_WEIGHT(F) returns loudness weighting coefficients for
%   frequencies F (Hz). The function is based on the loudness at 65 phons
%   defined in ISO 226:2003.
% 
%   G = LOUD_WEIGHT(F,PHON) returns loudness weighting coefficients at the
%   loudness level PHON. PHON should be a scalar and, according to the
%   standard, is only valid at all frequencies such that 20<=PHON<80
%   (although the function will return SPL values outside of this range).
% 
%   The input f may be an array of any size. The outputs will be the same
%   size as f, with coefficients calculated for each element.
% 
%   G = LOUD_WEIGHT(F,METHOD) returns loudness weighting coefficients for a
%   variety of methods. Specifying METHOD as 'A', 'B', 'C', and 'D'
%   corresponds to frequency weighting curves defined in IEC 61672:2003;
%   'ISO-226' applies loudness weighting derived from ISO 226:2003 at 65
%   phons.
% 
%   NB: since ISO 226:2003 only reports values up to 12.5 kHz, frequencies
%   are limited to 12.5 kHz for the purposes of calculating weighting
%   coefficients.
% 
%   See also ISO226, DUP_WEIGHT.

%   Copyright 2015 University of Surrey.

% =========================================================================
% Last changed:     $Date: 2015-07-02 15:47:12 +0100 (Thu, 02 Jul 2015) $
% Last committed:   $Revision: 391 $
% Last changed by:  $Author: ch0022 $
% =========================================================================

    %% Check input

    assert(all(f(:)>=0),'f should be greater than or equal to zero!')

    if nargin<2
        phon = 65;
    end
    
    if ischar(phon)
        method = phon;
        if strcmpi(method,'iso-226')
            phon = 65;
        end
    elseif ischar(phon)
        method = 'iso-226';
        assert(isscalar(phon),'phon must be a scalar.')
    else
        error('Second argument should be a scalar or char array.')
    end

    %% Calculate weighting coefficients
    
    switch lower(method)
        case 'a'
            g = a_weighting(f);
        case 'b'
            g = b_weighting(f);
        case 'c'
            g = c_weighting(f);
        case 'd'
            g = d_weighting(f);
        case 'iso-226'
            % return equal loudness contours
            % limit SPL values for f > 12.5 kHz
            IX = f>12500;
            f2 = f;
            f2(IX) = 12500;
            spl = squeeze(iso226(phon,f2));
            % calculate weighting coefficients
            g = min(spl(:))-spl;
            g = 10.^(g./20);
        otherwise
            error('Unknown method.')
    end

end

function w = a_weighting(f)
%A_WEIGHTING return A-weighting magnitude coefficients
    w = ((12200^2).*(f.^4))./...
        (((f.^2)+(20.6^2)).*((((f.^2)+(107.7^2)).*((f.^2)+(737.9^2))).^0.5).*((f.^2)+(12200^2)));
end

function w = b_weighting(f)
%B_WEIGHTING return B-weighting magnitude coefficients
    w = ((12200^2).*(f.^3))./...
        (((f.^2)+(20.6^2)).*sqrt((f.^2)+(158.5^2)).*((f.^2)+(12200^2)));
end

function w = c_weighting(f)
%C_WEIGHTING return C-weighting magnitude coefficients
    w = ((12200^2).*(f.^2))./...
        (((f.^2)+(20.6^2)).*((f.^2)+(12200^2)));
end

function w = d_weighting(f)
%D_WEIGHTING return D-weighting magnitude coefficients
    hf = (((1037918.48-(f.^2)).^2)+(1080768.16.*(f.^2)))./...
        (((9837328-(f.^2)).^2)+(11723776.*(f.^2)));
    w = (f./(6.8966888496476*(10^(-5)))).*sqrt(hf./(((f.^2)+79919.29).*((f.^2)+1345600)));
end

