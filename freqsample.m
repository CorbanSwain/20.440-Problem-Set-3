function X = freqsample(values, freqs, n)

checksum = sum(freqs);
assert(length(values) == length(freqs), "Mismatched input lengths.");
assert(abs(checksum - 1) <= eps, "'freqs' does not sum to 1.");

R = rand(n, 1);
X = zeros(1, n);
sumfreqs = cumsum(freqs);

for iVal = 1:length(values)
   selection = R < sumfreqs(iVal);
   X(selection) = values(iVal);
   R(selection) = (1 + 2 * eps);
end