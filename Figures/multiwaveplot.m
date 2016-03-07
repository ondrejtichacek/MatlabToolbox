function varargout = multiwaveplot(varargin)
%MULTIWAVEPLOT Plot stacked waves from a multichannel matrix
% 
%   Multiwaveplot draws a series of stacked waves (one on top of the other)
%   contained in the rows of an input 2-D matrix. Each wave has a
%   designated row on the plot; the first row is plotted at the bottom of
%   the plot.
% 
%   MULTIWAVEPLOT(WAVE) draws a series of waves contained in the rows of
%   wave.
% 
%   MULTIWAVEPLOT(X,Y,WAVE) plot the waves against the data in X and Y,
%   such that X specifies the common x-data, and Y determines the vertical
%   position of each row. Hence, length(X)==size(WAVE,2) and
%   length(Y)==size(WAVE,1).
% 
%   MULTIWAVEPLOT(...,GAIN) scales the height of each wave according to
%   GAIN. With GAIN=1 (default), the height of the tallest wave will be
%   limited so as not to encroach on the adjacent wave; all other waves are
%   scaled accordingly. This can be overridden by specifying GAIN > 1.
% 
%   MULTIWAVEPLOT(...,MODE) plots the data with the specified MODE. The
%   default MODE depends on gain: for GAIN <= 1, mode defaults to 'plot'
%   and plots lines for each row of WAVE; for GAIN > 1, mode defaults to
%   'fill' and instead plots white patch objects for each row of WAVE,
%   covering the area under each wave, such that waves with a lower row
%   index mask those with a higher row index. This behaviour can be
%   overridden by specifying MODE as a string (either 'plot' or 'fill').
% 
%   H = MULTIWAVEPLOT(...) returns a vector of handles to patch (for mode =
%   'fill') or lineseries (for mode = 'plot') graphics objects, one handle
%   per wave.
% 
%   See also FILL, PATCH, PLOT, IMAGESC.

%   Copyright 2015 University of Surrey.

% =========================================================================
% Last changed:     $Date: 2015-07-02 15:47:12 +0100 (Thu, 02 Jul 2015) $
% Last committed:   $Revision: 391 $
% Last changed by:  $Author: ch0022 $
% =========================================================================

    %% Derive inputs

    input_spec = 'X and Y must be vectors, WAVE must be a matrix, GAIN must be a scalar and MODE must be a string';

    % MODE
    mode = find_inputs(@ischar,varargin,...
        ['Unknown parameter specified. ' input_spec]);

    % GAIN
    gain = find_inputs(@(x)(isscalar(x) & ~ischar(x)),varargin,...
        ['Unknown parameter specified. ' input_spec]);

    if isempty(gain)
        gain = 1;
    end

    % Condtionally set MODE depending on GAIN
    if isempty(mode)
        if gain > 1
            mode = 'fill';
        else
            mode = 'plot';
        end
    end

    % WAVE
    wave = find_inputs(@(x)(isnumeric(x) & all(numel(x)>size(x)) & length(size(x))<3),varargin,...
        ['Both X and Y must be specified. ' input_spec]);

    assert(~isempty(wave),'Please specify WAVE (which should be a matrix)')

    [r,c] = size(wave);

    % X and Y
    [x,y] = find_inputs(@(x)(~isscalar(x) & isvector(x) & ~ischar(x)),varargin,...
        ['Both X and Y must be specified. ' input_spec]);

    if isempty(x)
        x = 1:c;
        y = 1:r;
    end

    %% Plot

    if min(wave(:))>=0
        adjust = 1; % for positive data (e.g. correlograms)
        y_min = y(1)-(y(2)-y(1));
    else
        adjust = 0.5; % for wave data varying on zero
        y_min = y(1)-((gain*adjust)*(y(2)-y(1)));
    end

    wave_max = max(abs(wave(:))); % scale relative to max of wave

    for n = 1:r
        if ~all(wave(n,:)==0) % just in case all values are zero
            wave(n,:) = (adjust/wave_max).*wave(n,:);
        end
    end

    scale = zeros(r,1); % this parameter allows for non-linear y-values, scaling each channel accordingly
    h = zeros(r,1);

    hold on;

    for n = r:-1:1
        try % calculate scaling factor
            scale(n) = y(n+1)-y(n);
        catch
            scale(n) = y(n)-y(n-1);
        end
        wave(n,:) = wave(n,:).*scale(n);
        switch mode % plot
            case 'plot'
                h(n) = plot(x,gain.*wave(n,:)+y(n),'k');
            case 'fill'
                xa=[x(1) x(1:c) x(c) x(1)];
                ya=[y_min gain.*wave(n,:)+y(n) y_min y_min];
                h(n) = fill(xa,ya,'w');
            otherwise
                error('Unknown MODE specified: must be ''fill'' or ''plot''')
        end
    end

    % look at every row to search for max, taking y offset into account
    plot_max = max(max(gain.*wave+repmat(y(:),[1 length(x)])));

    hold off
    axis([x(1) x(c) y_min plot_max]); % set axis limits
    set(gca,'layer','top') % move axis to top layer
    ytick = get(gca,'ytick');
    set(gca,'ytick',ytick(ytick<=max(y))); % remove ticks beyond y limits
    box on

    varargout(1:nargout) = {h};

end

function varargout = find_inputs(fhandle,input,msg)
% FIND_INPUTS validate and provide inputs (if any)

    indices = cellfun(fhandle,input);

    if any(indices) % inputs are specified
        if sum(indices)~=nargout
            error(msg) % return error message
        end
        varargout(1:nargout) = input(indices);
    else % unspecified returns empty matrix
        varargout(1:nargout) = {[]};
    end

end
