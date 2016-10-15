function [ Result ] = permutation( Value,Level )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
if nargin < 2
 Level = 1;
end
if Value > 1
 fprintf('Value = %d Level = %dn', Value, Level);
 Result = permutation(Value - 1, Level + 1) * Value;
 disp(['Result = ', num2str(Result)]);
else
 fprintf('Value = %d Level = %dn', Value, Level);
 Result = 1;
 disp(['Result = ', num2str(Result)]);
end

end