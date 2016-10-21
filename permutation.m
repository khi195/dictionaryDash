function [ perm_array, perm_start, chainX] = permutation( dictionary_array, N, start_word, end_word )
%permutation.m 
%calculate the number of permutations in the array

perm_numbers = factorial(N)/factorial(N-2);
disp(perm_numbers)

%build matrix 
perm_array = {};

for i = 1:N
    current_word = dictionary_array{i};
    for j = 1:N
    loop_word = dictionary_array{j};
    y = next_string(current_word, loop_word);
        if y == 1
            perm_array = [perm_array, {current_word, loop_word}];
            s = strcat(current_word,{','} ,loop_word);
        end
        
    end

end

col_length = size(perm_array,2)/2
%reshape the array
perm_array = reshape(perm_array, [2,col_length])';



% sanity check - fine KHI
perm_start = {};
perm_end = {};
% all the combinations in the start array
for i = 1: col_length
    
    aa = perm_array(i,1);
    bb = perm_array(i,2);
    m = next_string(start_word, aa{1,1});
    n = next_string(end_word, bb{1,1});
    
    if m == 1 
        perm_start= [perm_start, perm_array(i,1)];
    end
    
    if n == 1
        perm_end= [perm_end, perm_array(i,2)];
    end
    
    
end
%remove rep
perm_start = unique(perm_start);
perm_end = unique(perm_end);

chainX={};
%construct the chain
for i = 1:length(perm_array)
    chainX=[chainX, perm_start];
    aa = perm_array(i,1);
    
    if isequal(aa{1,1},perm_start)
    chainX = [chainX, aa(i,:)];
    end
end