function [] = output(dictionary_array, length_of_dictionary, permute_string )
%output.m
%Write the output to a file

% open the file
fileID = fopen('result.txt','a');

words = length_of_dictionary + 1;
fprintf(fileID,'\n\n');  
for i = 1:words
 word_in_chain = dictionary_array{i};   
     if i < words
        fprintf(fileID,'%s -->',word_in_chain);   
     elseif i== words
        fprintf(fileID,'%s',word_in_chain);  
     end
end
fprintf(fileID,'\n\n');   
fprintf(fileID,'length of dictionary chain: %i',length_of_dictionary);
fprintf(fileID,'\n\n');   
fclose(fileID);

end

