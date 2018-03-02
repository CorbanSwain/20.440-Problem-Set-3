function X = simResample(sample, numRepeats)
% simulated resampling of data from a given source

n = length(sample);
X = sample(ceil(rand(n, numRepeats) * n));