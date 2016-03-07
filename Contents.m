% TOOLBOX
% 
%   Contents file for TOOLBOX and its subfolders.
%   
%   TOOLBOX
%   class_template       - Summary of this class goes on this H1 line
%   function_template    - Summary of this function goes on this H1 line
%   
%   TOOLBOX/ACOUSTICS
%   IR_stats             - Calculate RT, DRR, Cte, and EDT for impulse response file
%   rt_est               - Estimate reverberation time based on room size and absorption
%   
%   TOOLBOX/AUDITORY
%   azimuth2itd          - Convert azimuth in degrees to ITD
%   BinSearch            - Conduct a binary search
%   calc_ild             - Calculate normalised interaural level difference
%   ch_xcorr             - Calculate cross-correlograms with a wide range of options
%   ch_xcorr_c.c
%   CreateWindow         - Create a Hann or exp. window with specified onsets/offsets
%   dup_weight           - Calculate duplex weighting coefficients for ITD and ILD
%   ErbRateToHz          - Convert ERB rate to Hz
%   freq_multi           - Calculate frequency coefficient for ITD-azimuth warping
%   gammatoneFast        - Produce an array of responses from gammatone filters via FFT
%   HzToErbRate          - Convert Hz to ERB rate
%   inst_itd             - Calculate instantaneous ITD
%   iso226               - ISO 226:2003 Normal equal-loudness-level contours
%   itd2azimuth          - Convert ITD to azimuth
%   lindemann_inh        - Signal pre-processing for Lindemann's cross-correlation
%   loud_weight          - Calculate loudness weighting coefficients based on ISO 226
%   MakeErbCFs           - Make a series of center frequencies equally spaced in ERB-rate
%   MeddisHairCell       - Calculate Ray Meddis' hair cell model for a number of channels
%   perceptualCentroid   - Perceptual spectral centroid
%   xcorr_lindemann      - Cross-correlation based on Lindemann's precedence model
%   xcorr_lindemann_c.c
%   
%   TOOLBOX/DOCUMENTATION/CH_XCORR
%   ch_xcorr_doc.pdf
%   ch_xcorr_doc.tex
%   tex_preamble.tex
%   
%   TOOLBOX/FIGURES
%   CHmap                - Create a monochrome-compatible colour map
%   CMRmap               - Create a monochrome-compatible colour map
%   multiwaveplot        - Plot stacked waves from a multichannel matrix
%   subfigrid            - Create axis positions for subfigures
%   
%   TOOLBOX/GENERAL
%   cell2csv             - Output a cell array to a CSV file
%   check_mex_compiled   - Check if mex file is compiled for system
%   csvimport            - Reads the specified CSV file and stores the contents in a cell array or matrix
%   findsubmat           - Find one matrix (a submatrix) inside another
%   get_contents         - Get the contents of a specified directory
%   parfor_progress      - Progress monitor (progress bar) that works with parfor
%   update_contents      - Create a Contents.m file including subdirectories
%   urn                  - Generate random number sequence without duplicates
%   WorkerObjWrapper     - Manage persistent state on MATLABPOOL workers
%   
%   TOOLBOX/SIGNAL_PROCESSING
%   audio                - Abstract superclass providing audio-related properties and methods
%   autocorr             - Perform autocorrelation via FFT
%   calc_rms             - Calculate the rms of a vector or matrix
%   conv_fft             - Convolve two vectors using FFT multiplication
%   ISTCT                - Calculate the Inverse Short-Time Cosine Transform
%   ISTFT                - Calculate the Inverse Short-Time Fourier Transform
%   lapwin               - Laplace window
%   localpeaks           - Find local peaks and troughs in a vector
%   LP_residual          - Calculate the LP residual signal
%   oct3dsgn             - Design of a one-third-octave filter
%   octdsgn              - Design of an octave filter
%   sinc_filter          - Apply a near-ideal low-pass or band-pass brickwall filter
%   STCT                 - Calculate the Short-Time Cosine Transform of a signal
%   STFT                 - Calculate the Short-Time Fourier Transform of a signal
%   vsmooth              - Smooth a vector using mathematical functions
%   
%   TOOLBOX/SOURCE_SEPARATION
%   calc_imr             - Calculates the Ideal Mask Ratio (IMR)
%   calc_snr             - Calculate the separation SNR
%   cfs2fcs              - Calculate gammatone crossover frequencies
%   get_full_mask        - Convert frame rate mask to a sample-by-sample mask
%   mixture              - Class of binaural sound source separation mixture
%   resynthesise         - Resynthesise a target from a time-frequency mask
%   source               - Class of sound source separation source
%   
%   TOOLBOX/STATISTICS
%   box_plot             - Draw a box plot with arbitrary box spacing
%   GetRMSE              - Calculate the root-mean-square error between input data
%   laprnd               - Pseudorandom numbers drawn from the Laplace distribution
%   qq_plot              - Quantile-quantile plot with patch option
%   quantile2            - Quantiles of a sample via various methods
%   tab2box              - Prepare tabular data for box_plot function
%   trirnd               - Pseudorandom numbers drawn from the triangular distribution
%   
%   TOOLBOX/SUBVERSION
%   build_svn_profile    - Read data from files tagged with SVN keywords
%   head_rev             - Retrieve the head revision for specified files
%   read_svn_keyword     - Read data from a file tagged with an SVN keyword
%    
%   This file was generated by update_contents.m on 21 Sep 2015 at 17:48:19.
