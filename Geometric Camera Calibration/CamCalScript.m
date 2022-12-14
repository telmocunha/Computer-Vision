% Exervice 3
%
close all;

IMG_NAME = 'images/image001.jpg';
img_I = imread(IMG_NAME);
image(img_I);
%axis off
axis image

% Decomposition Approach
%D_type = 'QR';
D_type = 'EXP';

%This function displays the calibration image and allows the user to click
%in the image to get the input points. Left click on the chessboard corners
%and type the 3D coordinates of the clicked points in to the input box that
%appears after the click. You can also zoom in to the image to get more
%precise coordinates. To finish use the right mouse button for the last
%point.
%You don't have to do this all the time, just store the resulting xy and
%XYZ matrices and use them as input for your algorithms.
%[xy XYZ] = getpoints(img_I);
xy=load('xy.mat');
XYZ=load('XYZ.mat');
xy=xy.xy;
XYZ=XYZ.XYZ;

%[xyn, XYZn, T, U] = normalization(xy, XYZ);
% === Task 2 DLT algorithm ===

[K, R, t, error_DLT] = runDLT(xy, XYZ);

% === Task 3 Gold algorithm ===

[K, R, t, error_Gold] = runGold(xy, XYZ, D_type);

% === Task 4 Gold algorithm with radial distortion estimation ===

[K, R, t, Kd, error_GoldRadial] = runGoldRadial(xy, XYZ, D_type);

% === Bonus: Undistort input Image ===

% [UImage] = image_undistort(Img_I, K, R, t, Kd);
display('DLT')
error_DLT
display('------------------------------------------------------------------')

display('Gold')
error_Gold
display('------------------------------------------------------------------')

display('Gold Radial')
error_GoldRadial
Kd
