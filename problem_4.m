%% Problem 4: Dunce Cap Betti Numbers
clear; format short

load_javaplex;
import edu.stanford.math.plex4.*;

%% Problem Given Data
num_vertices = 8;

edges = ...
[1, 2; 1, 3; 1, 4; 1, 5; 1, 6; 1, 7; 1, 8;
 2, 3; 2, 4; 2, 5; 2, 6; 2, 7; 2, 8;
 3, 4; 3, 5; 3, 6; 3, 7; 3, 8;
 4, 5; 4, 8;
 5, 6; 5, 8;
 6, 7; 6, 8;
 7, 8];

faces = ...
[1, 2, 4;
1, 2, 5;
1, 2, 8;
1, 3, 6;
1, 3, 7;
1, 3, 8;
1, 4, 5;
1, 6, 7;
2, 3, 4;
2, 3, 6;
2, 3, 7;
2, 5, 6;
2, 7, 8;
3, 4, 8;
4, 5, 8;
5, 6, 8;
6, 7, 8];

%% Set up Simplicial Complex
stream = api.Plex4.createExplicitSimplexStream();

for v = 1:num_vertices
    stream.addVertex(v);
end

for e_i = 1:size(edges, 1)
    stream.addElement(edges(e_i, :))
end

for f_i = 1:size(faces, 1)
    stream.addElement(faces(f_i, :))
end

stream.finalizeStream();

%% Calculate betti Numbers
persistence = api.Plex4.getModularSimplicialAlgorithm(4, 2);
intervals = persistence.computeIntervals(stream);
infinite_barcodes = intervals.getInfiniteIntervals();

