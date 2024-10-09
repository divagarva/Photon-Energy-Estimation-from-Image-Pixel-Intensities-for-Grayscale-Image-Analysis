clc;
clear;
close all;

% Load the image
img = imread('tiger.jpg');
img_gray = rgb2gray(img);  % Convert to grayscale if necessary

% Define constants
h = 6.626e-34;   % Planck’s constant (J·s)
c = 3e8;         % Speed of light (m/s)

% Assuming you are working with visible light, define a sample wavelength range (in meters)
lambda_min = 400e-9;  % 400 nm (violet)
lambda_max = 700e-9;  % 700 nm (red)

% Normalize the pixel intensities to get a corresponding wavelength for each pixel
img_double = im2double(img_gray);  % Convert image to double for computation
lambda = lambda_min + (lambda_max - lambda_min) * (1 - img_double);  % Map pixel values to wavelength

% Calculate the photon energy for each pixel
E = (h * c) ./ lambda;  % Energy in Joules

% 1. Display the energy image
figure;
imshow(E, []);
title('Photon Energy of Image Pixels (in Joules)');

% 2. Heatmap visualization of photon energy
figure;
imagesc(E);
colorbar;
title('Heatmap of Photon Energy Distribution');
xlabel('X Pixels');
ylabel('Y Pixels');

% 3. Histogram of photon energy values
figure;
histogram(E(:), 100);  % Flatten the matrix and plot a histogram with 100 bins
title('Photon Energy Distribution');
xlabel('Photon Energy (Joules)');
ylabel('Frequency');

% 4. 3D Surface plot of photon energy
[X, Y] = meshgrid(1:size(E, 2), 1:size(E, 1));  % Create meshgrid for X and Y coordinates
figure;
surf(X, Y, E, 'EdgeColor', 'none');  % Surface plot without edges for smoother visualization
colorbar;
title('3D Surface Plot of Photon Energy');
xlabel('X Pixels');
ylabel('Y Pixels');
zlabel('Photon Energy (Joules)');
view(3);  % Set the view to 3D
