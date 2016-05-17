function varargout = multiwaveplot(varargin)
%MULTIWAVEPLOT Plot stacked waves from a multichannel matrix
% 
%   Multiwaveplot draws a series of stacked waves (one on top of the other)
%   contained in the rows of an input 2-D matrix. Each wave has a
%   designated row on the plot; the first row is plotted at the bottom of
%   the plot.
% 
%   MULTIWAVEPLOT(Z) draws a series of waves contained in the rows of the
%   matrix Z.
% 
%   MULTIWAVEPLOT(X,Y,Z) plot the waves against the data in X and Y, such
%   that X specifies the common x-data, and Y determines the vertical
%   position of each row. Hence, length(X)==size(Z,2) and
%   length(Y)==size(Z,1).
% 
%   Z may also be a vector, of the same length as X and Y; the data
%   contained in X and Y will be used to construct a matrix for plotting.
% 
%   MULTIWAVEPLOT(...,'parameter','value') allows a number of options to be
%   specified. The options are:
% 
%   ({} indicates the default value)
% 
%   'gain'          : {1} | scalar
%       This parameter scales the height of each wave. With gain=1
%       (default), the height of the tallest wave will be limited so as not
%       to encroach on the adjacent wave; all other waves are scaled
%       accordingly. With gain~=1 the height of each wave will
%       decrease/increase by a factor gain.
%   'horizonWidth'  : {1} | scalar
%       The plot can be made to narrower (or wider) at the top, to give the
%       impression of a horizon. This may be useful, for example, when y
%       data represent time. With horizonWidth=1 (default), the top and
%       bottom of the plot have the same width. With horizonWidth<1, the
%       plot is narrower at the top by a factor of horizonWidth. With
%       horizonWidth>1, the plot is narrower at the bottom by a factor of
%       1/horizonWidth. Specifying horizonWidth>1 will cause the x-axis to
%       be moved to the top of the plot.
%   'horizonOffset' : {0} | scalar
%       This parameter specifies the vanishing point of the horizon. With
%       horizonOffset=0 (default), the vanishing point is in the centre.
%       With horizonOffset=-1, the vanishing point is on the left of the
%       plot. With horizonOffset=1, the vanishing point is on the right of
%       the plot. Intermediate values specify intermediate vanishing
%       points.
%   'mode' : {'plot'} | 'fill'
%       This parameter plots the data with the specified mode. The default
%       mode depends on gain: for gain<=1, mode defaults to 'plot' and
%       plots lines for each row of Z. For gain>1, mode defaults to 'fill'
%       and instead plots white patch objects for each row of Z, covering
%       the area under each wave, such that waves with a lower row index
%       mask those with a higher row index.
%
%   H = MULTIWAVEPLOT(...) returns a vector of handles to patch (for mode =
%   'fill') or lineseries (for mode = 'plot') graphics objects, one handle
%   per wave.
% 
%   See also FILL, PATCH, PLOT, IMAGESC.

%   Copyright 2016 University of Surrey.

    %% Derive inputs
    
    firstPar = find(cellfun(@(x) ~isnumeric(x),varargin),1,'first');
    if isempty(firstPar)
        firstPar = nargin+1;
    end
    overrides = {};
    
    % get inputs
    switch firstPar-1
        case 1
            Z = varargin{1};
            X = [];
            Y = [];
        case 2
            error('Wrong number of input arguments.')
        otherwise
            X = varargin{1};
            X = reshape(X,1,length(X));
            Y = varargin{2};
            Y = reshape(Y,1,length(Y));
            Z = varargin{3};
    end
    
    if firstPar < nargin
        overrides = varargin(firstPar:end);
    end
    
    % derive data
    if isvector(Z)
        assert(~isempty(X),'If Z is a vector, you must specify X and Y.')
        assert(~isempty(Y),'If Z is a vector, you must specify X and Y.')
        % if vector, make matrix
        assert(length(X)==length(Z) && length(Y)==length(Z),'If Z is a vector, X and Y must be vectors of the same length.')
        x = unique(X)';
        y = unique(Y)';
        wave = NaN(length(y),length(x));
        for n = 1:length(x)
            for m = 1:length(y)
                IX = X==x(n) & Y==y(m);
                wave(m,n) = mean(Z(IX));
            end
        end
        [r,~] = size(wave);
    else
        % if matrix
        if isempty(X)
            X = 1:size(Z,2);
        end
        if isempty(Y)
            Y = 1:size(Z,1);
        end
        assert(ismatrix(Z),'Z must be a 2-D matrix')
        wave = Z;
        [r,c] = size(wave);
        assert(c==length(X),'X must be the same length as Z has columns.')
        assert(r==length(Y),'Y must be the same length as Z has rows.')
        if isempty(X)
            x = 1:r;
        else
            x = reshape(X,1,length(X));
        end
        if isempty(Y)
            y = 1:c;
        else
            y = Y;
        end
    end
    
    % get options
    
    options = struct(...
        'gain',1,...
        'mode',[],...
        'horizonWidth',1,...
        'horizonOffset',0);

    % read parameter/value inputs
    if ~isempty(overrides) % if parameters are specified
        % read the acceptable names
        optionNames = fieldnames(options);
        % count arguments
        nArgs = length(overrides);
        if round(nArgs/2)~=nArgs/2
           error('MULTIWAVEPLOT needs propertyName/propertyValue pairs')
        end
        % overwrite defults
        for pair = reshape(overrides,2,[]) % pair is {propName;propValue}
           IX = strcmpi(pair{1},optionNames); % find match parameter names
           if any(IX)
              % do the overwrite
              options.(optionNames{IX}) = pair{2};
           else
              error('%s is not a recognized parameter name',pair{1})
           end
        end
    end
    
    % set default plot mode
    if isempty(options.mode)
        if options.gain > 1
            options.mode = 'fill';
        else
            options.mode = 'plot';
        end
    end
    
    assert(all(diff(x)>=0),'X must be increasing')
    assert(all(diff(y)>=0),'Y must be increasing')
    
    %% Plot

    % horizon
    assert(isscalar(options.horizonWidth),'''horizonWidth'' must be a scalar.')
    assert(isscalar(options.horizonOffset),'''horizonOffset'' must be a scalar.')
    assert(options.horizonWidth>=0,'''horizonWidth'' must be greater than or equal to 0.')
    assert(options.horizonOffset>=-1 && options.horizonOffset<=1,'''horizonOffset'' must be in the range [-1,1].')
    
    horizonWidths = linspace(1,options.horizonWidth,length(y));
    horizonWidths = horizonWidths./max(horizonWidths);
    horizonX = linspace(-1,1,length(x))-options.horizonOffset;
    
    % data scaling
    if min(wave(:))>=0
        adjust = 1; % for positive data (e.g. correlograms)
        y_min = y(1)-(y(2)-y(1));
    else
        adjust = 0.5; % for wave data varying on zero
        y_min = y(1)-((options.gain*adjust)*(y(2)-y(1)));
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
        % calculate scaling factor
        try
            scale(n) = y(n+1)-y(n);
        catch
            scale(n) = y(n)-y(n-1);
        end
        wave(n,:) = wave(n,:).*scale(n);
        % scale data for horizon effect
        xinterp = interp1(horizonX,x,horizonWidths(n).*horizonX);
        xhor = [x(1) xinterp(1) xinterp xinterp(end) x(end)];
        yscale = reshape(options.gain.*wave(n,:)+y(n),1,size(wave,2));
        yhor = [y(n) y(n) yscale y(n) y(n)];
        % plot
        switch options.mode
            case 'plot'
                h(n) = plot(xhor,yhor,'k');
            case 'fill'
                xa=[xhor(1) xhor xhor(end) xhor(1)];
                ya=[y_min yhor y_min y_min];
                IX = ~(isnan(xa) | isnan(ya));
                h(n) = fill(xa(IX),ya(IX),'w');
            otherwise
                error('Unknown MODE specified: must be ''fill'' or ''plot''')
        end
    end

    % look at every row to search for max, taking y offset into account
    plot_max = max(max(options.gain.*wave+repmat(y(:),[1 length(x)])));

    hold off
    axis([min(x) max(x) y_min plot_max]); % set axis limits
    set(gca,'layer','top') % move axis to top layer
    ytick = get(gca,'ytick');
    set(gca,'ytick',ytick(ytick<=max(y))); % remove ticks beyond y limits
    box on
    
    if options.horizonWidth>1
        set(gca,'XAxisLocation','top')
    end

    varargout(1:nargout) = {h};

end
