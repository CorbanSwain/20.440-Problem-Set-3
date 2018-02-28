function die_bootstrap
%% Setup
sample = [3, 3, 2, 1, 3, 4, 1, 1, 2]';

numRolls = length(sample);
numRepeats = 10 .^ (1:4);

%% Functions
   function X = simResample(numRolls, numRepeats)
      X = sample(ceil(rand(numRolls, numRepeats) * numRolls));
   end

%%
CNSUtils.FigureBuilder.setDefaults();
lenNumRepeats = length(numRepeats);
[meanCache, stdevCache] = deal(zeros(lenNumRepeats, 1));
figure(1);
for iNumRepeats = 1:lenNumRepeats
   m = numRepeats(iNumRepeats);
   S = simResample(numRolls, m);
   medianDistribution = factorial(median(S, 1));
   subplot(4, 1, iNumRepeats);
   nbins = 25;
   %edges = ((1:20) - 1).*(721 / (nbins - 1));
   edges = [0, factorial(1:4) + 0.5];
   histogram(medianDistribution, 'Normalization', 'probability');
   box('off');
   ylim([0 0.55]);
   xlim([0 25]);
   meanCache(iNumRepeats) = mean(medianDistribution);
   stdevCache(iNumRepeats) = std(medianDistribution);  
end
meanCache
stdevCache
end