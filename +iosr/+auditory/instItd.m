function itd = instItd(l,r,fs)
%INSTITD Calculate instantaneous ITD
%
%   ITD = IOSR.AUDITORY.INSTITD(L,R,FS) calculates the instantaneous ITD of
%   the input vectors L and R (sampled at frequency FS). The vectors should
%   be narrow-band signals, such as those output by a filterbank.
%   
%   The algorithm computes the instantaneous ITD by dividing the
%   instantaneous phase of the vectors by their instantaneous frequency and
%   subtracting one from the other (right from left). Instantaneous phase
%   and frequency are calculated from the analytic signal via the Hilbert
%   transform.
% 
%   See also HILBERT.

%   Copyright 2016 University of Surrey.

    assert(isvector(l) & isvector(r),'l and r must be vectors')
    assert(isscalar(fs),'fs must be a scalar')

    % instantaneous phase, frequency, and time
    [pl,fl] = inst_pf(l,fs);
    [pr,fr] = inst_pf(r,fs);
    tl = inst_t(pl,fl);
    tr = inst_t(pr,fr);

    % instantaneous ITD
    itd = tl-tr;

end

function t = inst_t(p,f)
%INST_T: Instantaneous signal time

    t = p./(2*pi*f);

end

function [p,f] = inst_pf(x,fs)
%INST_PF: Instantaneous signal phase and frequency

% Based on code created by Scott McKinney, October 2010 
% http://www.mathworks.com/matlabcentral/fileexchange/authors/110216 

X = hilbert(x); %analytic signal corresponding to real input signal x
p = unwrap(angle(X)); %instantaneous phase of x is the angle of X
env = abs(X); %instantaneous envelope of x is the magnitude of X
h = imag(X); %hilbert transform of input

dh = derivative(h);
dx = derivative(x);

w = (x.*dh - h.*dx)./(env.^2); %instantaneous radian frequency
f = w*fs/(2*pi); %convert to Hz

end

function dx = derivative(x,N,dim)
%DERIVATIVE: Compute derivative while preserving dimensions

% Created by Scott McKinney, October 2010 
% http://www.mathworks.com/matlabcentral/fileexchange/authors/110216 

    %set DIM
    if nargin<3  
       if size(x,1)==1 %if row vector        
           dim = 2;
       else
           dim = 1; %default to computing along the columns, unless input is a row vector
       end
    else
        assert(isscalar(dim) & ismember(dim,[1 2]),'dim must be 1 or 2!')
    end

    %set N
    if nargin<2 || isempty(N) %allows for letting N = [] as placeholder
        N = 1; %default to first derivative    
    else
        assert(isscalar(N) & N==round(N),'N must be a scalar integer!')
    end

    if size(x,dim)<=1 && N
        error('X cannot be singleton along dimension DIM')
    elseif N>=size(x,dim)
        warning('Computing derivative of order longer than or equal to size(x,dim). Results may not be valid...') %#ok<WNTAG>
    end

    dx = x; %'Zeroth' derivative
    for n = 1:N % Apply iteratively

        dif = diff(dx,1,dim);

        if dim==1
            first = [dif(1,:) ; dif];
            last = [dif; dif(end,:)];
        elseif dim==2;
            first = [dif(:,1) dif];
            last = [dif dif(:,end)];
        end

        dx = (first+last)/2;
    end

end
