function X = simResample(sample, m)
% simulated resampling of data from a given source

n = length(sample);
X = sample(ceil(rand(n, m) * n));