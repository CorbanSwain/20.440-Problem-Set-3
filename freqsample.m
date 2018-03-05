function X = freqsample(values, freqs, n)
% sampling from a discrete distrivution defined by values and their
% respective frequencies

%% Input Checking
assert(length(values) == length(freqs), "Mismatched input lengths.");
checksum = sum(freqs);
assert(abs(checksum - 1) <= eps, "'freqs' does not sum to 1.");

%% Algorithm 
% Using a uniform distribution to perform the sampling
R = rand(n, 1);
X = zeros(1, n);
sumfreqs = cumsum(freqs);

% running through each of the values in the list
for iVal = 1:length(values)
   selection = R < sumfreqs(iVal);
   X(selection) = values(iVal);
   R(selection) = (1 + 2 * eps);
end