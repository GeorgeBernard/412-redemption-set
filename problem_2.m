%% Problem 2: Assorted Javaplex Tutorial Exercises

%% Exercise 8
% Compute VR complex of a house point cloud
clear; format short; close all

load_javaplex;
import edu.stanford.math.plex4.*;

house = [ ...
    -1, 0;
     1, 0;
    -1, 2;
     1, 2;
     0, 3;
     4, 0;
     4, 2
    ];
house_rand = house + 0.1 .* randn(size(house));

% plot the house
scatter(house(:, 1), house(:, 2));
grid on;
hold on;
scatter(house_rand(:, 1), house_rand(:, 2));
legend('original', 'noise added')

% Compute the VR stream
m_space = metric.impl.EuclideanMetricSpace(house);
max_dim = 3;
max_filt_value = 4;
num_divisions = 1000;

stream = api.Plex4.createVietorisRipsStream(m_space, max_dim, ...
    max_filt_value, num_divisions);

persistence = api.Plex4.getModularSimplicialAlgorithm(max_dim, 2);
intervals = persistence.computeIntervals(stream);

options.filename = 'rips-house';
options.max_filtration_value = max_filt_value;
options.max_dimension = max_dim - 1;
plot_barcodes(intervals, options);

%% Exercise 9
clear; format short; close all

load_javaplex;
import edu.stanford.math.plex4.*;

point_cloud = examples.PointCloudExamples.getRandomFigure8Points(75);

% Compute the VR stream
m_space = metric.impl.EuclideanMetricSpace(point_cloud);
max_dim = 3;
max_filt_value = 1.1;
num_divisions = 1000;

stream = api.Plex4.createVietorisRipsStream(m_space, max_dim, ...
    max_filt_value, num_divisions);

persistence = api.Plex4.getModularSimplicialAlgorithm(max_dim, 2);
intervals = persistence.computeIntervals(stream);

options.filename = 'rips-house';
options.max_filtration_value = max_filt_value;
options.max_dimension = max_dim - 1;
plot_barcodes(intervals, options);

%% Exercise 10
clear; format short; close all

load_javaplex;
import edu.stanford.math.plex4.*;

point_cloud = examples.PointCloudExamples.getRandomTorusPoints(500, 1, 2);

scatter3(point_cloud(:,1), point_cloud(:,2), point_cloud(:, 3))
axis equal;

% Compute the VR stream
m_space = metric.impl.EuclideanMetricSpace(point_cloud);
max_dim = 3;
max_filt_value = 0.9;
num_divisions = 100;

stream = api.Plex4.createVietorisRipsStream(m_space, max_dim, ...
    max_filt_value, num_divisions);

persistence = api.Plex4.getModularSimplicialAlgorithm(max_dim, 2);
intervals = persistence.computeIntervals(stream);

options.filename = 'torus-rips';
options.max_filtration_value = max_filt_value;
options.max_dimension = max_dim - 1;
plot_barcodes(intervals, options);

%% Exercise 11
clear; format short; close all

load_javaplex;
import edu.stanford.math.plex4.*;

sampled_angles = @(n) (2*pi/n).*(0:n-1);
sampled_circle = @(n) [cos(sampled_angles(n)); sin(sampled_angles(n))];

n = 16;
circle = sampled_circle(n);

m_space = metric.impl.EuclideanMetricSpace(circle);
max_dim = 4;
max_filt_value = 10;
num_divisions = 10000;

stream = api.Plex4.createVietorisRipsStream(m_space, max_dim, ...
    max_filt_value, num_divisions);

persistence = api.Plex4.getModularSimplicialAlgorithm(max_dim, 2);
intervals = persistence.computeIntervals(stream);

options.filename = 'circle-rips';
options.max_filtration_value = max_filt_value;
options.max_dimension = max_dim - 1;
plot_barcodes(intervals, options);

% for many of these values, I can never get a homology above dimension 1

%% Exercise 12

% pick unit square, with given 
dataset = [0, 0; 1, 0; 0, 1; 1, 1];
m_space = metric.impl.EuclideanMetricSpace(dataset);
max_dim = 3;
max_filt_value = 1.1;
num_divisions = 1000;

stream = api.Plex4.createVietorisRipsStream(m_space, max_dim, ...
    max_filt_value, num_divisions);

persistence = api.Plex4.getModularSimplicialAlgorithm(max_dim, 2);
intervals = persistence.computeIntervals(stream);

options.filename = 'square-rips';
options.max_filtration_value = max_filt_value;
options.max_dimension = max_dim - 1;
plot_barcodes(intervals, options);

