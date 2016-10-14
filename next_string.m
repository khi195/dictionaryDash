% check if the last name is matched
function y = next_string(this_string, other_string)

    length_word = length(other_string); % problem
    bb = char(other_string);
    l =0;
    for k = 1: length_word  % loop over the characters in the word       
          % count the number of times a letter is common     
             if ~isempty(strfind(this_string, bb(k)))
                 l = l +1;
             end
    end
    
%return a true if the length -1 letters are the same else false
    if l == length_word - 1
        y = true;
    else  
        y = false;
    end 
     
    
end