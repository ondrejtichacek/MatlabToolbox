function keydata = read_svn_keyword(filename,keyword,crop)
%READ_SVN_KEYWORD Read data from a file tagged with an SVN keyword
%   
%   The function takes an input filename and searches that file for a
%   Subversion keyword. The data associated with the keyword are returned
%   in a character array. Keyword data are placed in files automatically by
%   Subversion at each commit using the 'keyword' function. The data can be
%   useful in maintaining an audit trail, or establishing the version used
%   to generate a particular set of results.
%   
%   KEYDATA = READ_SVN_KEYWORD(FILENAME,KEYWORD) returns a string KEYDATA
%   containing data associated with the SVN keyword KEYWORD in a file
%   specified by FILENAME.
%   
%   FILENAME and KEYWORD must be strings specifying a single file and
%   keyword respectively. To read multiple files or use multiple keywords,
%   use BUILD_SVN_PROFILE instead. The function returns an empty string if
%   the keyword is not found.
% 
%   KEYDATA = READ_SVN_KEYWORD(FILENAME,KEYWORD,CROP), with CROP = true
%   (default is false), removes the keyword, and leading and trailing
%   spaces, from the returned string.
%   
%   See also BUILD_SVN_PROFILE.

%   Copyright 2015 University of Surrey.

% =========================================================================
% Last changed:     $Date: 2015-07-02 15:47:12 +0100 (Thu, 02 Jul 2015) $
% Last committed:   $Revision: 391 $
% Last changed by:  $Author: ch0022 $
% =========================================================================


    assert(ischar(filename) & ischar(keyword),'FILENAME and KEYWORD must be char arrays')

    if nargin < 3
        crop = false;
    end

    keydata = '';

    fid = fopen(filename); % open file
    assert(fid~=-1,['read_svn_keyword: ''' filename ''' not found'])

    tline = fgetl(fid); % read first line
    while ischar(tline)
        k1 = strfind(tline,['$' keyword ':']); % find keyword
        if ~isempty(k1) % if it is found
            k2 = strfind(tline,'$'); % find the end of the keyword data
            k2 = k2(k2>k1);
            keydata = tline(k1+1:k2-2); % extract the data from the line
            tline = -1; % set tline to numeric
        else
            tline = fgetl(fid); % read next line
        end
    end

    if crop
        keydata = keydata(find(isspace(keydata),1,'first')+1:end);
    end

    fclose(fid); % close file

end
