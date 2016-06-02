function [x,t] = istft(s,nfft,hop,fs)
%ISTFT Calculate the Inverse Short-Time Fourier Transform
%   
%   X = ISTFT(S) calculates the inverse short-time Fourier transform
%   (ISTFT), from the 1024-point one-sided FFTs in each column of S, using
%   the overlap-add method. It is assumed that FFTs are calculated in steps
%   of HOP=512. X is a column vector of length (HOP*K)+(NFFT-HOP)
%   where K is SIZE(X,2).
% 
%   X = STFT(S,NFFT) uses FFT-length NFFT and HOP=FIX(NFFT/2).
% 
%   X = STFT(S,NFFT,HOP) uses the hop size HOP.
% 
%   [X,T] = STFT(S,NFFT,HOP,FS) returns the corresponding time T (seconds)
%   for each element of X based on sampling frequency FS.
% 
%   Example
% 
%       % create a spectrogram using a Hann window
%       % and convert back to the time domain
%       load handel.mat
%       nfft = 1024;
%       hop = 128;
%       Y = stft(y,hann(nfft),hop);
%       z = istft(Y,nfft,hop);
% 
%   See also STFT.

%   Copyright 2016 University of Surrey.

    %% check input
    
    assert(ismatrix(s),'S must be a matrix')
    
    % check nfft
    if nargin<2
        nfft = 1024;
    else
        assert(isscalar(nfft) && round(nfft)==nfft && nfft>0,'NFFT must be a positive scalar integer')
    end
    
    % determine hop size
    if nargin<3
        hop = fix(nfft/2);
    else
        assert(isscalar(hop) & round(hop)==hop,'hop must be an integer')
        assert(hop<=nfft && hop>0,'hop must be less than or equal to nfft, and greater than 0')
    end
    
    % determine fs
    if nargin<4
        fs = 1;
    else
        assert(isscalar(fs),'FS must be an scalar')
    end
    
    %% calculate outputs
    
    % calculate number of frames and samples
    K = size(s,2);
    M = (hop*K)+(nfft-hop);
    
    % calculate highest bin and correction for one-sided FFT
    if mod(nfft,2)==0
        Nout = (nfft/2)+1;
        ec = 1;
    else
        Nout = (nfft+1)/2;
        ec = 0;
    end
    
    % check FFT size
    assert(size(s,1)==Nout,sprintf('SIZE(S,1) is not correct for an FFT-length of %d',nfft))
    
    % calculate ISTFTs
    x = zeros(M,1);
    for k = 1:K
        samples = ((k-1)*hop)+1:((k-1)*hop)+nfft;
        Xtemp = [s(:,k); conj(s(end-ec:-1:2,k))];
        x(samples) = x(samples)+ifft(Xtemp);
    end
    
    % calculate time
    if nargout>1
        t = (0:M-1)./fs;
    end

end
