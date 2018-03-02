function die_bootstrap
%% Setup
sample = [3, 3, 2, 1, 3, 4, 1, 1, 2]';

numRolls = length(sample);
numRepeats = 10 .^ (1:4);

%% Functions


%%
CNSUtils.FigureBuilder.setDefaults();
fontSize = 18;
set(groot, ...
   'defaultAxesFontSize', fontSize, ...
   'defaultTextFontSize',fontSize ...
   );
lenNumRepeats = length(numRepeats);
[meanCache, stdevCache] = deal(zeros(lenNumRepeats, 1));
figure(1);
for iNumRepeats = 1:lenNumRepeats
   m = numRepeats(iNumRepeats);
   S = simResample(sample, m);
   medianDistribution = factorial(median(S, 1));
   subplot(4, 1, iNumRepeats);
   nbins = 25;
   %edges = ((1:20) - 1).*(721 / (nbins - 1));
   edges = [0, factorial(1:4) + 0.5];
   p = histogram(medianDistribution, 'Normalization', 'probability', ...
      'EdgeColor', 'none', 'FaceColor', [31 78 121] ./ 300);
   text(25, 0.4, sprintf('m = %d', m), 'HorizontalAlignment', 'right', ...
      'FontWeight', 'bold');
   box('off');
   ylim([0 0.6]);
   xlim([0 25]);
   xticks(factorial(1:4));
   yticks([0, 0.6]);
   if iNumRepeats == 4
      xticklabels(compose('%d!', 1:4));
      xlabel('[median]!');
      ylabel('Frequency');
   else
      xticklabels('');
   end
   meanCache(iNumRepeats) = mean(medianDistribution);
   stdevCache(iNumRepeats) = std(medianDistribution);  
end
CNSUtils.saveAllFigures('die_bootstrapp');
meanCache
stdevCache
end