function die_bootstrap
%% Setup for Constants
sample = [3, 3, 2, 1, 3, 4, 1, 1, 2]';
numRepeats = 10 .^ (1:4);


%% Performing all four bootstraps
CNSUtils.FigureBuilder.setDefaults(); % set plotting defaults
lenNumRepeats = length(numRepeats);
[meanCache, stdevCache] = deal(zeros(lenNumRepeats, 1)); % initializing
                                                         % parameter caches

figure(1);
for iNumRepeats = 1:lenNumRepeats
   m = numRepeats(iNumRepeats);
   S = simResample(sample, m);
   medianDistribution = factorial(median(S, 1));
   
   % Plotting
   subplot(4, 1, iNumRepeats);
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
   
   % saving the statistical parameters
   meanCache(iNumRepeats) = mean(medianDistribution);
   stdevCache(iNumRepeats) = std(medianDistribution);  
end

CNSUtils.saveAllFigures('die_bootstrapp');
meanCache
stdevCache
