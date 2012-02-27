%% (C) Copyright 2012. All rights reserved. Sotiris L Karavarsamis.
% Contact author at sokar@aiia.csd.auth.gr
% 
% This is an implementation of the k-means algorithm straight from the
% pseudocode description based on the book 'Introduction to Information
% Retrieval' by Manning, Schutze, Raghavan.

close all;

for i=1:10
    % clear workspace
    clear all;
    
    % set algorithm parameters
    TOL = 0.0004;
    ITER = 30;
    kappa = 4;
    
    % generate random data
    X = [1000*randn(1000,2) + 1000; 2000*randn(1000,2) + 5000];
    
    % run k-Means on random data
    tic;
    [C, I, iter] = myKmeans(X, kappa, ITER, TOL);
    toc
    
    % show number of iteration taken by k-means
    disp(['k-means instance took ' int2str(iter) ' iterations to complete']);
    
    % available colos for the points in the resulting clustering plot
    colors = {'red', 'green', 'blue', 'black'};
    
    % show plot of clustering
    figure;
    for i=1:kappa
       hold on, plot(X(find(I == i), 1), X(find(I == i), 2), '.', 'color', colors{i});
    end
    
    % wait key
    pause;
end

% pause and close all windows
pause;
close all;