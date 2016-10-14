

%%-----------Start and welcome message ---------
disp('Start the dictionary dash')

%-----------Start and end words-----------------
% 
start_word = 'hit';
end_word = 'cog';

% create a cell containing the start and end words
start_end_cell = {start_word, end_word};

%-------String manipulation---------------------

str = 'hit, dot, dog, cog, hot, log';
 
%split into array of words
str_cell = strsplit(str, ',');

%remove white space
C = strtrim(str_cell);

% how many words in the array
number_of_words = size(C,2);

% what is the lenght of the words
% if there is one word is a different length exit
% KHI: to implement the word length check
for n = 1: number_of_words
    length_of_words = length(C{n});
    check_length = length_of_words
end

% The first word in the array
% KHI: check if this is redundant
cell_word = C{1};

% the last word in the list
% KHI: Check if this is redundant
last_word_cell = C{number_of_words};



% remove the first and end word from the array of strings
k = 1;
while ~isequal(last_word_cell, cell_word)     
     cell_word = C{k};
     if isequal(cell_word, start_word) || isequal(cell_word, end_word) 
         C(k) =[]; 
     end    
     k = k + 1;
end

new_array_size = length(C);
clear number_of_words

%which word can NEVER be the first word transformed to.

% convert to array of strings into a array of characters
% KHI: Is this redundant?   
A = char(C);

% All the permuations of the array of strings
v = perms(C);

% How permuations for the array of the strings
length(perms(C))


% loop over the words and break if there isn't anything in the chain

for i = 1 : length(perms(C)) % the number of possible permuations
word_in_chain = start_word; % The word we want to start with
 

    
   length_index = 0;
   chain = {}; %initialise the chain array for each permuation
    for j = 1: new_array_size % loop over the number of words in each permuation
        % check if the previous word has been transformed to the end word
        
        m = next_string(word_in_chain, end_word);
        
        if m == 1
           fprintf(' Transformed to the end word %s to %s \n',word_in_chain, end_word);
           chain = [chain, end_word];
           length_index = length_index + 1;
           disp(length_index)
           return
        end
        
        
        l = 0; % loop index for the  number of characters
        % check if this current string can be transfered to the next string
        next_in_chain = v(i,j);
        
      
       
         word_cell = v(i,j);
         word_string = word_cell{1,1};
         q =  next_string(word_in_chain, word_string);
            
        if q == 1
            fprintf(' Word transformed from %s to %s \n',word_in_chain, word_string);
            % update the word to the next one in the chain
            word_in_chain = word_string;
             chain = [chain, word_in_chain];
             length_index = length_index + 1;
            %check if the word also transforms 
        
        
        else
            %fprintf(' Word  %s did not transform to %s \n',word_in_chain, word_string);
            break
        end
             
    end
         
end


