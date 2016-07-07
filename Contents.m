% MATLABTOOLBOX
% 
%   Contents file for MATLABTOOLBOX and its subfolders.
%   
%   MATLABTOOLBOX
%   classTemplate                    - Summary of this class goes on this H1 line
%   functionTemplate                 - Summary of this function goes on this H1 line
%   LICENSE
%   README.md
%   release-notes.md
%   
%   MATLABTOOLBOX/+IOSR
%   iosr.install                     - Set search paths, and download and install dependencies
%   
%   MATLABTOOLBOX/+IOSR/+ACOUSTICS
%   iosr.acoustics.irStats           - Calculate RT, DRR, Cte, and EDT for impulse response file
%   iosr.acoustics.rtEst             - Estimate reverberation time based on room size and absorption
%   
%   MATLABTOOLBOX/+IOSR/+AUDITORY
%   iosr.auditory.azimuth2itd        - Convert azimuth in degrees to ITD
%   iosr.auditory.binSearch          - Conduct a binary search
%   iosr.auditory.calcIld            - Calculate normalised interaural level difference
%   iosr.auditory.chXcorr            - Calculate cross-correlograms with a wide range of options
%   iosr.auditory.chXcorr2           - Calculate cross-correlograms with a range of options
%   chXcorr2_c.c
%   chXcorr_c.c
%   iosr.auditory.createWindow       - Create a Hann or exp. window with specified onsets/offsets
%   iosr.auditory.dupWeight          - DUP_WEIGHT Calculate duplex weighting coefficients for ITD and ILD
%   iosr.auditory.erbRate2hz         - Convert ERB rate to Hz
%   iosr.auditory.freqMulti          - Calculate frequency coefficient for ITD-azimuth warping
%   iosr.auditory.gammatoneFast      - Produce an array of responses from gammatone filters via FFT
%   iosr.auditory.hz2erbRate         - Convert Hz to ERB rate
%   iosr.auditory.instItd            - Calculate instantaneous ITD
%   iosr.auditory.iso226             - ISO 226:2003 Normal equal-loudness-level contours
%   iosr.auditory.itd2azimuth        - Convert ITD to azimuth
%   iosr.auditory.lindemannInh       - Signal pre-processing for Lindemann's cross-correlation
%   iosr.auditory.loudWeight         - Calculate loudness weighting coefficients based on ISO 226
%   iosr.auditory.makeErbCFs         - Make a series of center frequencies equally spaced in ERB-rate
%   iosr.auditory.meddisHairCell     - Calculate Ray Meddis' hair cell model for a number of channels
%   iosr.auditory.perceptualCentroid - Perceptual spectral centroid
%   iosr.auditory.xcorrLindemann     - Cross-correlation based on Lindemann's precedence model
%   xcorrLindemann_c.c
%   
%   MATLABTOOLBOX/+IOSR/+BSS
%   iosr.bss.applyIdealMasks         - Calculate and apply ideal masks via STFT
%   iosr.bss.applyMask               - Apply a time-frequency mask to an STFT
%   iosr.bss.calcImr                 - Calculates the Ideal Mask Ratio (IMR)
%   iosr.bss.calcSnr                 - Calculate the separation SNR
%   iosr.bss.cfs2fcs                 - Calculate gammatone crossover frequencies
%   iosr.bss.example                 - Determine STFT parameters
%   iosr.bss.getFullMask             - Convert frame rate mask to a sample-by-sample mask
%   iosr.bss.idealMasks              - Calculate ideal time-frequency masks from STFTs
%   iosr.bss.mixture                 - Class of binaural sound source separation mixture
%   iosr.bss.resynthesise            - Resynthesise a target from a time-frequency mask
%   iosr.bss.source                  - Class of sound source separation source
%   
%   MATLABTOOLBOX/+IOSR/+DSP
%   iosr.dsp.audio                   - Abstract superclass providing audio-related properties and methods
%   iosr.dsp.autocorr                - Perform autocorrelation via FFT
%   iosr.dsp.convFft                 - Convolve two vectors using FFT multiplication
%   iosr.dsp.istft                   - Calculate the Inverse Short-Time Fourier Transform
%   iosr.dsp.lapwin                  - Laplace window
%   iosr.dsp.localpeaks              - Find local peaks and troughs in a vector
%   iosr.dsp.ltas                    - Calculate the long-term average spectrum of a signal
%   iosr.dsp.matchEQ                 - Match the LTAS of a signal to an arbitrary spectral magnitude
%   iosr.dsp.rms                     - Calculate the rms of a vector or matrix
%   iosr.dsp.sincFilter              - Apply a near-ideal low-pass or band-pass brickwall filter
%   iosr.dsp.smoothSpectrum          - Apply 1/N-octave smoothing to a frequency spectrum
%   iosr.dsp.stft                    - Calculate the short-time Fourier transform of a signal
%   iosr.dsp.vsmooth                 - Smooth a vector using mathematical functions
%   
%   MATLABTOOLBOX/+IOSR/+FIGURES
%   iosr.figures.chMap               - Create a monochrome-compatible colour map
%   iosr.figures.cmrMap              - Create a monochrome-compatible colour map
%   iosr.figures.multiwaveplot       - Stacked line plots from a matrix or vectors
%   iosr.figures.subfigrid           - Create axis positions for subfigures
%   
%   MATLABTOOLBOX/+IOSR/+GENERAL
%   iosr.general.cell2csv            - Output a cell array to a CSV file
%   iosr.general.checkMexCompiled    - Check if mex file is compiled for system
%   iosr.general.urn                 - Generate random number sequence without duplicates
%   
%   MATLABTOOLBOX/+IOSR/+STATISTICS
%   iosr.statistics.boxPlot          - Draw a box plot
%   iosr.statistics.getRmse          - Calculate the root-mean-square error between input data
%   iosr.statistics.laprnd           - Pseudorandom numbers drawn from the Laplace distribution
%   iosr.statistics.qqPlot           - Quantile-quantile plot with patch option
%   iosr.statistics.quantile         - Quantiles of a sample via various methods
%   iosr.statistics.tab2box          - Prepare tabular data for boxPlot function
%   iosr.statistics.trirnd           - Pseudorandom numbers drawn from the triangular distribution
%   
%   MATLABTOOLBOX/+IOSR/+SVN
%   iosr.svn.buildSvnProfile         - Read data from files tagged with SVN keywords
%   iosr.svn.headRev                 - Retrieve the head revision for specified files
%   iosr.svn.readSvnKeyword          - Read data from a file tagged with an SVN keyword
%   
%   MATLABTOOLBOX/DEPS/SOFA_API
%   history.txt
%   readme.txt
%   SOFAaddVariable
%   SOFAappendText
%   SOFAarghelper                    - Parse arguments for SOFA
%   SOFAcalculateAPV
%   SOFAcheckFilename
%   SOFAcompact
%   SOFAcompare                      - SOFASOFAcompare
%   SOFAcompileConventions
%   SOFAconvertCoordinates
%   SOFAdbPath                       - DbPath=SOFAdbPath
%   SOFAdbURL                        - DbURL=SOFAdbURL
%   SOFAdefinitions
%   SOFAexpand
%   SOFAgetConventions
%   SOFAgetVersion
%   SOFAinfo                         - (Obj) gathers information about the SOFA object and display it
%   SOFAload
%   SOFAmerge
%   SOFAplotGeometry                 - (Obj) plots the geometry found in the Obj
%   SOFAplotHRTF                     - (OBJ, TYPE, CH) plots the CH channel of HRTFs given in OBJ
%   SOFAsave
%   SOFAspat
%   SOFAstart
%   SOFAupdateDimensions
%   SOFAupgradeConventions           - SOFAcompatibility
%   
%   MATLABTOOLBOX/DEPS/SOFA_API/CONVENTIONS
%   GeneralFIR-a.mat
%   GeneralFIR-m.mat
%   GeneralFIR-r.mat
%   GeneralFIR.csv
%   GeneralFIRE-a.mat
%   GeneralFIRE-m.mat
%   GeneralFIRE-r.mat
%   GeneralFIRE.csv
%   GeneralString-a.mat
%   GeneralString-m.mat
%   GeneralString-r.mat
%   GeneralString.csv
%   GeneralTF-a.mat
%   GeneralTF-m.mat
%   GeneralTF-r.mat
%   GeneralTF.csv
%   MultiSpeakerBRIR-a.mat
%   MultiSpeakerBRIR-m.mat
%   MultiSpeakerBRIR-r.mat
%   MultiSpeakerBRIR.csv
%   SimpleFreeFieldHRIR-a.mat
%   SimpleFreeFieldHRIR-m.mat
%   SimpleFreeFieldHRIR-r.mat
%   SimpleFreeFieldHRIR.csv
%   SimpleFreeFieldSOS-a.mat
%   SimpleFreeFieldSOS-m.mat
%   SimpleFreeFieldSOS-r.mat
%   SimpleFreeFieldSOS.csv
%   SimpleFreeFieldTF-a.mat
%   SimpleFreeFieldTF-m.mat
%   SimpleFreeFieldTF-r.mat
%   SimpleFreeFieldTF.csv
%   SimpleHeadphoneIR-a.mat
%   SimpleHeadphoneIR-m.mat
%   SimpleHeadphoneIR-r.mat
%   SimpleHeadphoneIR.csv
%   SingleRoomDRIR-a.mat
%   SingleRoomDRIR-m.mat
%   SingleRoomDRIR-r.mat
%   SingleRoomDRIR.csv
%   
%   MATLABTOOLBOX/DEPS/SOFA_API/CONVERTERS
%   miro                             - :: Measured Impulse Response Object
%   SOFAconvertARI2SOFA              - OBJ=SOFAconvertARI2SOFA(hM,meta,stimPar) converts the HRTFs described in hM, meta, and
%   SOFAconvertBTDEI2SOFA            - OBJ=SOFAconvertBTDEI2SOFA(BTDEI) converts the HRTFs described in BT-DEI
%   SOFAconvertCIPIC2SOFA            - Obj=SOFAconvertCIPIC2SOFA(CIPIC) converts the HRTFs described in the structure CIPIC
%   SOFAconvertFHK2SOFA              - OBJ=SOFAconvertFHK2SOFA(miroObj) converts the HRTFs described in miroObj
%   SOFAconvertLISTEN2SOFA           - Obj=SOFAconvertLISTEN2SOFA(LISTEN, subjectID) converts the HRTFs described in LISTEN
%   SOFAconvertMIT2SOFA              - OBJ=SOFAconvertMIT2SOFA(root,pinna) loads the MIT HRTFs saved in a
%   SOFAconvertSCUT2SOFA             - OBJ=SOFAconvertSCUT2SOFA(root,pinna) loads the SCUT HRTFs saved in a
%   SOFAconvertSOFA2ARI              - OBJ=SOFAconvertSOFA2ARI(hM,meta,stimPar) converts the  HRTFs described in hM, meta, and
%   SOFAconvertTUBerlin2SOFA         - OBJ=SOFAconvertTUBerlin2SOFA(irs) converts the HRTFs described in irs
%   SOFAconvertTUBerlinBRIR2SOFA     - OBJ=SOFAconvertTUBerlin2SOFA(irs) converts the HRTFs described in irs
%   SOFAhrtf2dtf                     - Converts HRTFs to DTFs (and CTFs)
%   
%   MATLABTOOLBOX/DEPS/SOFA_API/COORDINATES
%   hor2sph                          - Transform horizontal-polar to spherical coordinates
%   nav2sph                          - Coordinate Transform
%   sph2hor                          - Transform spherical to horizontal-polar coordinates
%   sph2nav                          - Coordinate Transform
%   
%   MATLABTOOLBOX/DEPS/SOFA_API/DEMOS
%   demo_ARI2SOFA                    - SOFA API - demo script
%   demo_BTDEI2SOFA                  - SOFA API demo script
%   demo_CIPIC2SOFA                  - Copyright (C) 2012-2013 Acoustics Research Institute - Austrian Academy of Sciences;
%   demo_FHK2SOFA                    - SOFA API - demo script
%   demo_HpIR                        - SOFA API - demo script
%   demo_LISTEN2SOFA                 - SOFA API - demo script
%   demo_MIT2SOFA                    - SOFA API - demo script
%   demo_SCUT2SOFA                   - SOFA API - demo script
%   demo_SimpleFreeFieldHRIR2TF      - SOFA API - demo script
%   demo_SingleRoomDRIROldenburg     - Demo for SingleRoomDRIR: save DRIR data from Uni Oldenburg (Office II) as
%   demo_SOFA2ARI                    - SOFA API - demo script
%   demo_SOFAexpandcompact           - SOFA API - demo script
%   demo_SOFAHRTF2DTF                - SOFA API - demo script
%   demo_SOFAload                    - SOFA API - demo script
%   demo_SOFAmerge                   - SOFA API - demo script
%   demo_SOFAplotHRTF                - - script demonstrating the usage of SOFAplotHRTF
%   demo_SOFAsave
%   demo_SOFAspat                    - SOFA API - demo script
%   demo_SOFAstrings                 - Script for testing the string array feature of SOFA
%   demo_SOFAvariables               - SOFA API - script demonstrating the usage of variables in the API
%   demo_TUBerlin2SOFA               - SOFA API - demo script
%   
%   MATLABTOOLBOX/DEPS/SOFA_API/HELPER
%   deg2rad                          - Returns the given angle in radians
%   isargchar                        - Tests if the given arg is a char and returns an error otherwise
%   isargfile                        - Tests if the given arg is a file and returns an error otherwise
%   isargstruct                      - Tests if the given arg is a struct and returns an error otherwise
%   isoctave                         - True if the operating environment is octave
%   rad2deg                          - Returns the given angle in degree
%   
%   MATLABTOOLBOX/DEPS/SOFA_API/NETCDF
%   NETCDFdisplay
%   NETCDFload
%   NETCDFsave
%   
%   MATLABTOOLBOX/DEPS/SOFA_API/TEST
%   test_SOFAall                     - SOFA API - test script
%   
%   MATLABTOOLBOX/DOC/CHXCORR
%   chXcorrDoc.pdf
%   chXcorrDoc.tex
%   tex_preamble.tex
%    
%   This file was generated by updateContents.m on 07 Jul 2016 at 17:15:02.
