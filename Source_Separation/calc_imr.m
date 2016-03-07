function IMR = calc_imr(m,im)
%CALC_IMR Calculates the Ideal Mask Ratio (IMR)
% 
%   IMR = CALC_IMR(M,IM) calculates the ideal mask ratio (IMR) from the
%   calculated mask M and ideal mask IM. Masks can be logical or double,
%   but must only contain values in the interval [0,1].

%   Copyright 2015 University of Surrey.

% =========================================================================
% Last changed:     $Date: 2015-08-11 16:36:27 +0100 (Tue, 11 Aug 2015) $
% Last committed:   $Revision: 396 $
% Last changed by:  $Author: ch0022 $
% =========================================================================

    % check input
    assert(nargin>1,'You need 2 masks to calculate IMR!')
    assert(size(m,1)>1 & size(m,2)>1,'m must be a two-dimensional matrix')
    assert(size(im,1)>1 & size(im,2)>1,'im must be a two-dimensional matrix')
    assert(all(size(m)==size(im)),'Masks must be the same size!')

    % validate masks
    m = check_mask(m);
    im = check_mask(im);

    % calculate IMR
    lamda = sum(sum(m.*im));
    rho = sum(sum(abs(m-im)));

    IMR = lamda/(lamda+rho);

end

function m = check_mask(m)
%CHECK_MASK validate mask

    if ~islogical(m)
        if any(m(:)<0) || any(m(:)>1);
            error('Values outside of [0,1] were found.')
        end
    else % make numeric
        m = +m;
    end

end
