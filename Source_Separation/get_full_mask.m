function m_full = get_full_mask(m,frame_d,delay,kernel)
%GET_FULL_MASK Convert frame rate mask to a sample-by-sample mask
% 
%   M_FULL = GET_FULL_MASK(M,FRAME_D) expands the time-frequency mask M,
%   which has one unit for each frequency channel and frame of length
%   FRAME_D (in samples), to a sample-by-sample mask. The mask M is a
%   time-frequency mask, with one column for each frequency channel, and
%   one row for each time frame. The resulting mask will have dimensions
%   [FRAME_D*size(M,1) size(M,2)].
% 
%   M_FULL = GET_FULL_MASK(M,FRAME_D,DELAY) removes a delay from each
%   frequency channel in the mask. DELAY is a vector, with the same number
%   of elements as M has columns, containing a delay (in samples) that is
%   removed from the corresponding frequency channel. The mask is
%   subsequently zero-padded.
% 
%   M_FULL = GET_FULL_MASK(M,FRAME_D,DELAY,KERNEL) allows smoothing to be
%   applied to the full mask. By default, the full mask contains
%   rectangular transitions at unit boundaries. Specifying KERNEL allows
%   the transitions to be smoother, by convolving the full mask with a
%   two-dimensional kernel (dimensions [frequency time]). The central part
%   of the convolution is returned, so the centre of the KERNEL should be
%   in the centre of the matrix. The kernel is normalised in order to
%   ensure zero gain at DC.
% 
%   See also RESYNTHESISE.

%   Copyright 2015 University of Surrey.

% =========================================================================
% Last changed:     $Date: 2015-07-01 16:38:54 +0100 (Wed, 01 Jul 2015) $
% Last committed:   $Revision: 389 $
% Last changed by:  $Author: ch0022 $
% =========================================================================


    if nargin < 2
        error('Not enough input arguments')
    end

    numchans = size(m,2);
    frameCount = size(m,1);

    if nargin < 3
        delay = zeros(1,numchans);
    end
    if nargin < 4
        kernel = 1;
    end

    % Create the sample-by-sample mask
    m_full = zeros(frameCount*frame_d,numchans);
    for i = 1:numchans
        for j = 1:frameCount
            m_full(((j-1)*frame_d+1):((j-1)*frame_d+1)+frame_d-1,i) = m(j,i); 
        end
        m_full(:,i) = [m_full(delay(i)+1:end,i); zeros(delay(i),1)];
    end

    % convolve with kernel
    kernel = kernel./sum(abs(kernel(:)));
    m_full = conv2(m_full,kernel,'same');
    
end
