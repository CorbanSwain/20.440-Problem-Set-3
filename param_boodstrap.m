function param_boodstrap
%% Setup of Constants
bins = 1:10;
freqs = [25, 10, 10, 5, 5, 5, 5, 5, 20, 10] / 100;

%% Part 1 - n = 1000, m = 1
n1 = 1E3; % number of points in experimental sample
X1 = freqsample(bins, freqs, n1);
mean1 = mean(X1)
stdev1 = std(X1)

%% Part 2 - n = 3, m = 5000
n2 = 3; % number of points in experimental sample
m2 = 5E2; % number of resamples from the experimental sample
exp_sample = freqsample(bins, freqs, n2);
X2 = simResample(exp_sample, m2);
X2_statistic = mean(X2, 1); % taking the mean of each resample.
                            % ASSUMPTION, because we arent told what 
                            % test statistic to use.
mean2 = mean(X2_statistic(:))
stdev2 = std(X2_statistic(:))

%% Plotting
edges = (0:10) + 0.5;
figure(2);

subplot(2, 1, 1);
histogram(X1, edges, 'Normalization', 'probability', ...
   'EdgeColor', 'none', 'FaceColor', [31 78 121] ./ 255, ...
   'FaceAlpha', 0.6);
hold on;
histogram('BinEdges', edges, 'BinCounts', round(freqs * 10), ...
   'Normalization', 'probability', ...
   'EdgeColor', [0 0 0], 'FaceAlpha', 0);
text(11, 0.25, sprintf('n = %d, m = %d', 1000, 1), ...
   'HorizontalAlignment', 'right', ...
   'FontWeight', 'bold');
box('off');
xlim([0 11]);

subplot(2, 1, 2);
histogram(X2_statistic, edges, 'Normalization', 'probability', ...
   'EdgeColor', 'none', 'FaceColor', [31 78 121] ./ 255, ...
   'FaceAlpha', 0.6);
hold on;
histogram('BinEdges', edges, 'BinCounts', round(freqs * 10), ...
   'Normalization', 'probability', ...
   'EdgeColor', [0 0 0], 'FaceAlpha', 0);
text(11, 0.3, sprintf('n = %d, m = %d', 3, 5000), ...
   'HorizontalAlignment', 'right', ...
   'FontWeight', 'bold');
box('off');
xlim([0 11]);

xlabel('Sample Value');
ylabel('Frequency');
CNSUtils.saveAllFigures('param_bootstrapp');

