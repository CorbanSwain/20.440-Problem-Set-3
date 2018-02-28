function die_bootstrap
%% Setup
sample = [3, 3, 2, 1, 3, 4, 1, 1, 2]';

numRolls = length(sample);
numRepeats = 10 .^ (1:4);

%% Functions
   function X = simDieRoll(numRolls, numRepeats)
      X = ceil(rand(numRolls, numRepeats) * 6);
   end

%%
lenNumRepeats = length(numRepeats);
[meanCache, stdevCache] = deal(zeros(lenNumRepeats, 1));
for iNumRepeats = 1:lenNumRepeats
   S = simDieRoll(numRolls, numRepeats(iNumRepeats));
   medianDistribution = factorial(median(S, 1));
   figure;
   histogram(medianDistribution, 720);
   meanCache(iNumRepeats) = mean(medianDistribution);
   stdevCache(iNumRepeats) = std(medianDistribution);  
end
meanCache
stdevCache
end