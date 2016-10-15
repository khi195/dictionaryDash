function [ Result ] = permutation( Value,Level )
%permutation.m 
%calculate the number of permutations in the array
if nargin < 2
 Level = 1;
end
if Value > 1
 fprintf('Value = %d Level = %d \n', Value, Level);
 Result = permutation(Value - 1, Level + 1) * Value; % recursive
 disp(['Result = ', num2str(Result)]);
else
 fprintf('Value = %d Level = %d \n', Value, Level);
 Result = 1;
 disp(['Result = ', num2str(Result)]);
end     

end