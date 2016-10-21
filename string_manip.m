function [ dictionary_split, number_of_words, start_end_test ] = string_manip(dictionary, start_word, end_word)

%remove the brackets
dictionary = strrep(dictionary, '[', '');
dictionary = strrep(dictionary, ']', '');




%split into array of words
dictionary_split = strsplit(dictionary, ',');

%remove the quotes
dictionary_split = strrep( dictionary_split,'"','');

%remove white space
dictionary_split = strtrim(dictionary_split);

% How many words in the array?
number_of_words = size(dictionary_split,2);

%check if the start and end words are in the file
%for n = 1: number_of_words
        if ismember(start_word, dictionary_split) == 0
                start_word_test = false;  
        else    
            start_word_test = true;

        end 

        if ismember(end_word, dictionary_split) == 0
            end_word_test = false;
        else    
            end_word_test = true;

        end
        
             if start_word_test == 0 && end_word_test ==0
         disp('the start and end word are not in the dictionary')
         start_end_test = false;;
         return

             elseif start_word_test == 0 
            disp('the start word is not in the dictionary')
            start_end_test = false;
            return

             elseif end_word_test == 0
            disp('the end word is not in the dictionary')
            start_end_test = false;
            return
            
             else 
                 start_end_test = true;
             end
          
          
             
     if start_end_test ==1 && number_of_words ==2 
         disp('the dictionary only contains the start and end words')
         start_end_test = false
         return
     end
      
end
    


