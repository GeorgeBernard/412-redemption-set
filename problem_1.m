%% Problem 1: Taxicab distance and VR complexes
clear; format short; close all;

load_javaplex;
import edu.stanford.math.plex4.*;

%% Problem Givens

S = [0, 0;
     1, 0;
     0, 1;
     1, 1;
     0, 5;
     5, 5;
     5, 0];

n = size(S, 1);
distances = zeros(n, n);
manhat_dist = @(x, y) sum(abs(x - y));

for i = 1:n
    for j = 1:n
        x = S(i, :);
        y = S(j, :);
        distances(i, j) = manhat_dist(x, y);
    end
end

%% Construct the metric space

m_space = metric.impl.ExplicitMetricSpace(distances);

%% Construct the VR complex

max_dimension = 3;
max_filt_value = 11;
num_divisions = 1000;

stream = api.Plex4.createVietorisRipsStream(m_space, max_dimension, ...
    max_filt_value, num_divisions);

%% Calculate persistence
persistence = api.Plex4.getModularSimplicialAlgorithm(max_dimension, 2);
intervals = persistence.computeIntervals(stream);

%% Show Results

options.filename = 'VR-taxicab';
options.max_filtration_value = max_filt_value;
options.max_dimension = max_dimension - 1;
plot_barcodes(intervals, options);

