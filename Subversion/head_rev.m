function [rev,file] = head_rev(folders,strs,rec)
%HEAD_REV Retrieve the head revision for specified files
% 
%   This function finds the most recently committed file in the specified
%   folders(s) and returns its revision and filename. The files must
%   contain the 'Revision' and 'Date' keywords.
% 
%   REV = HEAD_REV(FOLDERS) returns the head revision (i.e. the highest
%   revision) for all files in FOLDERS.
%
%   REV = HEAD_REV(FOLDERS,STRS) allows additional filter strings STRS to
%   be specified. See GET_CONTENTS for details of permitted filter strings.
% 
%   REV = HEAD_REV(FOLDERS,STRS,REC), with REC = true, allows folders to be
%   searched recursively (default is false).
%
%   [REV,FILE] = HEAD_REV(...) returns the filename to FILE of the file
%   with the highest revision.
%
%   FOLDERS and STRS may be a string specifying a single occurrence, or a
%   cell array of strings specifying multiple occurrences. This function
%   requires that the 'Revision' keyword is used in the searched functions.
% 
%   Note that if the folders include files from an externally-defined
%   repository (which has been updated more recently than the native
%   repository), a misleading revision number may be presented.
% 
%   See also GET_CONTENTS, BUILD_SVN_PROFILE, READ_SVN_KEYWORD.

%   Copyright 2015 University of Surrey.

% =========================================================================
% Last changed:     $Date: 2015-07-02 15:47:12 +0100 (Thu, 02 Jul 2015) $
% Last committed:   $Revision: 391 $
% Last changed by:  $Author: ch0022 $
% =========================================================================

    keyword = 'Date'; % use this data to sort files (doubtful that any others would work, without considerable parsing)

    if ischar(folders)
        folders = cellstr(folders);
    end

    if nargin > 1
        if ischar(strs)
            strs = cellstr(strs);
        end
        if isempty(strs)
            strs = {'files'};
        end
    else
        strs = {'files'};
    end

    % add subfolders if recursion is requested
    if nargin > 2
        if rec
            for f = folders
                folders = [folders; get_contents(char(f),'filter','folders','rec',true,'path','full')]; %#ok<AGROW>
            end
        end
    end

    % get revision info for files
    svn_profile = build_svn_profile(folders,keyword,strs);

    % remove the keyword and convert revision strings to numbers
    svn_profile(:,2) = cellfun(@(x) (x(length(keyword)+3:end)),svn_profile(:,2),'uni',false);

    % remove NaN (files that don't have the revision keyword)
    IX1 = cellfun(@isempty,svn_profile(:,2));
    svn_profile = svn_profile(~IX1,:);

    % sort by revision number
    [~,IX2] = sort(svn_profile(:,2));
    svn_profile = svn_profile(IX2,:);

    % get highest revision number
    rev = read_svn_keyword(svn_profile{end,1},'Revision');

    % return corresponding filename, if requested
    if nargout>1
        file = svn_profile{end,1};
    end

end
