

%%-----------Start and welcome message ---------
disp('----------------------------------')
disp('Start the dictionary dash')
disp('----------------------------------')
%-----------Start and end words-----------------
% 

% read in the dictionary name and start and end words
[dict_name, start_word, end_word] = input_var(1);

%Open the file contain the list of words
fileID = fopen(dict_name,'r');
formatSpec = '%s';
dictionary = fscanf(fileID,formatSpec);
fclose(fileID);

%check if file name exists
if fileID <0, disp('dictionary file not found'), return, end

[dictionary_split, number_of_words, start_end_test] =...
    string_manip(dictionary, start_word, end_word);

if start_end_test ==0; return; end

% what is the length of the words?
% if there is one word is a different length exit
for n = 1: number_of_words - 1

    n1 = length(dictionary_split{n});
    n2 = length(dictionary_split{n + 1});
    
    if ~isequal(n1,n2)
         disp('There are words of different length')
        return
    end
    % if the length of the words is the same then we need only define the
    % length of one of the words. WLOG I've taken the first word
    length_of_words = length(dictionary_split{1});
    
end


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


%[array_perm, array_start, array_end] = permutation(dictionary_split, number_of_words, start_word, end_word);


% All the permuations of the array of strings
permutation_dictionary = perms(dictionary_split);

number_of_chains = 0;
for i = 1 :length(perms(dictionary_split)) % the number of possible permuations
current_word = start_word; % The word we want to start with
 

   length_index = 0;
   chain = {}; %initialise the chain array for each permuation
   chain = [chain, start_word]; % add 
   for j = 1: number_of_words % loop over the number of words in each permuation
        % check if the previous word has been transformed to the end word
        
        m = next_string(current_word, end_word);
        word_2_cell = permutation_dictionary(i,j);
        cell_2_string = word_2_cell{1,1};
        if m == 1
           fprintf(' Transformed to the end word %s to %s \n',current_word, end_word);
           chain = [chain, end_word];
           number_of_chains = number_of_chains + 1;
           length_index = length_index + 1;
           %store the length of the chain

                   if number_of_chains == 1 || length_index<=length_of_chain
                        output(chain, length_index, cell_2_string ); 
                   end
                   
                length_of_chain = length_index;           
        end
        
        % check if this current string can be transfered to the next string
        
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
         
   if number_of_chains == 0 && i == length(perms(dictionary_split))
       disp('no such chain exists for this dictionary')
   end
   
end


