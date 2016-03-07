function [output_args] = function_template(input_args)
%FUNCTION_TEMPLATE Summary of this function goes on this H1 line
% 
%   Detailed explanation goes here
%   
%   [OUTPUT_ARGS] = FUNCTION_TEMPLATE(INPUT_ARGS) describe the inputs and
%   outputs, and provide any other relevant information.
%   
%   LIST OTHER WAYS OF CALLING THE FUNCTION and give a description of the
%   different variables and how they affect the output. Provide any other
%   relevant information.
% 
%<-------------------- column is 75 characters wide ---------------------->
%   
%   Example(s)
%   
%     [Example 1: What this example does]
%   
%       % This is an example:
%       [output_args] = function_template(input_args)
%   
%     [Example 2: What this example does]
%   
%   See also RELATED_FUNCTION, SIN, COS.

%   Copyright 2015 University of Surrey.

% =========================================================================
% Last changed:     $Date: 2015-09-22 10:59:14 +0100 (Tue, 22 Sep 2015) $
% Last committed:   $Revision: 419 $
% Last changed by:  $Author: ch0022 $
% =========================================================================

    % code is indented
    
    function this_is_a_nested_function
    %THIS_IS_A_NESTED_FUNCTION That also needs a description
        
        % it has access to the parent function's variables
        
    end

end

function [output_args] = my_local_function(input_args)
%MY_LOCAL_FUNCTION Summary of this function goes here
%   
%   Detailed explanation goes here

    % code is also indented

end
