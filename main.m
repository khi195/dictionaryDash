

%%-----------Start and welcome message ---------
disp('Start the dictionary dash')

%-----------Start and end words-----------------
% 
start_word = 'hit';
end_word = 'cog';

% create a cell containing the start and end words
start_end_cell = {start_word, end_word};

%-------String manipulation---------------------

%Open the file contain the list of words
fileID = fopen('dictionary.txt','r');
formatSpec = '%s';
% 
dictionary = fscanf(fileID,formatSpec);

%split into array of words
dictionary_split = strsplit(dictionary, ',');

%remove white space
dictionary_split = strtrim(dictionary_split);

% How many words in the array?
number_of_words = size(dictionary_split,2);

% what is the lenght of the words
% if there is one word is a different length exit
% KHI: To implement the word length check
for n = 1: number_of_words
    length_of_words = length(dictionary_split{n});
end



% The first word in the array
dictionary_split_1 = dictionary_split{1};

% the last word in the list
dictionary_split_last = dictionary_split{number_of_words};


k = 1;
dictionary_word ='';
% remove the first and end word from the array of strings
while ~isequal(dictionary_split_last, dictionary_word)
     % specify the first word in the chain
     dictionary_word = dictionary_split{k};
     if isequal(dictionary_word, start_word) || isequal(dictionary_word, end_word) 
         dictionary_split(k) =[]; 
     end
     k = k + 1;
end

%update the number of words in the array
number_of_words = length(dictionary_split);


%which word can NEVER be the first word transformed to.

% convert to array of strings into a array of characters
% KHI: Is this redundant?   
%A = char(C);

% All the permuations of the array of strings
permutation_dictionary = perms(dictionary_split);

% loop over the words and break if there isn't anything in the chain

 

for i = 1 : length(perms(dictionary_split)) % the number of possible permuations
current_word = start_word; % The word we want to start with
 

   length_index = 0;
   chain = {}; %initialise the chain array for each permuation
   chain = [chain, start_word]; % add 
    for j = 1: number_of_words % loop over the number of words in each permuation
        % check if the previous word has been transformed to the end word
        
        m = next_string(current_word, end_word);
        
        if m == 1
           fprintf(' Transformed to the end word %s to %s \n',current_word, end_word);
           chain = [chain, end_word];
           length_index = length_index + 1;
           output(chain, length_index );
           return
        end

        l = 0; % loop index for the  number of characters
        % check if this current string can be transfered to the next string
        next_in_chain = permutation_dictionary(i,j);
        word_2_cell = permutation_dictionary(i,j);
        cell_2_string = word_2_cell{1,1};
         q =  next_string(current_word, cell_2_string);
            
        if q == 1
            fprintf(' Word transformed from %s to %s \n',current_word, cell_2_string);
            % update the word to the next one in the chain
            current_word = cell_2_string;
            chain = [chain, current_word];
            length_index = length_index + 1;
            %check if the word also transforms 
        else
            break
        end
             
    end
         
end


