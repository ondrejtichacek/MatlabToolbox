function [svn_profile,svn_str] = build_svn_profile(folders,keywords,strs,rec)
%BUILD_SVN_PROFILE Read data from files tagged with SVN keywords
% 
%   This function extracts SVN keyword data from specified files, and
%   returns the filename, path and keyword data to a cell array (and
%   optional char array).
%   
%   Keyword data are placed in files automatically by Subversion at each
%   commit using the 'keyword' function. The data can be useful in
%   maintaining an audit trail, or establishing the version used to
%   generate a particular set of results.
%   
%   SVN_PROFILE = BUILD_SVN_PROFILE(FOLDERS,KEYWORDS) returns a cell array
%   SVN_PROFILE containing data associated with the SVN keywords KEYWORDS.
%   The function will search through files contained in folders.
%   
%   SVN_PROFILE is a two dimensional cell array; there is one row for each
%   file found in FOLDERS, and N columns: one each for the full path for
%   the file, and appended columns for each specified keyword in KEYWORDS.
%   Data are only returned for files that contain the specified keyword(s).
%   An empty cell array, 0-by-2, is returned if no keywords are found.
%   
%   SVN_PROFILE = BUILD_SVN_PROFILE(FOLDERS,KEYWORDS,STRS) allows
%   additional filter strings STRS to be specified. See GET_CONTENTS for
%   details of permitted filter strings.
%   
%   ... = BUILD_SVN_PROFILE(FOLDERS,KEYWORDS,STRS,REC), with REC = true,
%   allows folders to be searched recursively (default is false).
%   
%   [SVN_PROFILE,SVN_STR] = BUILD_SVN_PROFILE(...) outputs a char array
%   SVN_STR of the profile, with columns concatenated to produce continuous
%   lines. Spaces are inserted to ensure that columns are aligned (in a
%   monospaced font). The array is appropriate for printing or writing to a
%   text file, for example. The char array can be written to a text file
%   with the following command:
%   
%   dlmwrite('svn_profile.txt',svn_str,'delimiter','')
%   
%   FOLDERS, KEYWORDS,and STRS may be a char array specifying a single
%   occurrence, or a cell array of strings specifying multiple occurrences.
%   
%   See also READ_SVN_KEYWORD, GET_CONTENTS.

%   Copyright 2016 University of Surrey.

    if ischar(folders)
        folders = cellstr(folders);
    end

    if ischar(keywords)
        keywords = cellstr(keywords);
    end

    if nargin > 2
        if ischar(strs)
            strs = cellstr(strs);
        end
    else
        strs = {'files'};
    end

    % add subfolders if recursion is requested
    if nargin > 3
        if rec
            for f = folders
                folders = [folders; get_contents(char(f),'filter','folders','rec',true,'path','full')]; %#ok<AGROW>
            end
        end
    end

    keydata = cell(0,1+length(keywords)); % empty cell array to be appended
    n = 1;
    for f = 1:length(folders)
        folder = folders{f};
        for s = 1:length(strs)
            str = strs{s};
            [files,dirflag] = get_contents(folder,'filter',str,'path','full'); % find relevant files
            files = files(~dirflag); % ignore directories
            if ~isempty(files)
                for h = 1:length(files)
                    file = files{h};
                    % extract keyword data from file
                    for k = 1:length(keywords)
                        keyword = keywords{k};
                        keydata{n,1} = file;
                        keydata{n,1+k} = read_svn_keyword(file,keyword);
                    end
                    n = n+1;
                end
            end
        end
    end

     % remove files where no keyword is found
    IX = true(size(keydata(:,2)));
    for k = 1:length(keywords)
        IX = IX & cellfun(@isempty,keydata(:,1+k));
    end
    svn_profile = keydata(~IX,:);

    % Build char array version of data
    space = repmat('  ',size(svn_profile(:,1))); % spaces to insert between columns
    svn_str = char(svn_profile(:,1)); % first column (file path)
    % append keyword columns:
    for k = 1:length(keywords)
            svn_str = [svn_str space char(svn_profile(:,1+k))]; %#ok<AGROW>
    end

end
