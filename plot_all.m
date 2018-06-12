clear all, close all, clc;

% This script plots various data taken by a camera

%Select and read text file
[filename,path] = uigetfile('*.txt');
%[~,~,data]= xlsread(fullfile(path,filename));
data = textread(fullfile(path,filename));
%filename = 'csvlist.dat';
%[~,~,data] = xlsread('myfile.csv')

%Ask data to user (might be saved directly in csv ?
%prompt = 'How many positions should be displayed ? (Enter a number or all)';
%numberOfPositions = input(prompt);

%x = cell2mat(data);
x = data(:,1:6);
numberOfPoints = size(x,1);



display(strcat('Size of data is ',' ', num2str(size(x,1))));
%Start plot
textPositions = strcat('Points measured with orientation -', ' ', num2str(numberOfPoints), ' ', ' points');
figure('Name',textPositions);
hold on;

%Plot cube for camera
plotcube([100 100 100],[ 0 0 0],.8,[1 0 0]);
plotXYZRTL([0,0,0,0,pi/2,0],150, 0.5);
%Plot all points
for rowNumber=1:numberOfPoints
    
    %display('plotting point number ', num2str(rowNumber));
    %p0 = x(rowNumber,1:3);
    %pint = x(rowNumber,4:6);
    %p1 = p0+10*pint;
    
    %vectarrow(p0, p1);
    plotXYZRTL([x(rowNumber,1:3) x(rowNumber,4:6)],50,1);
end

hold off;

title(textPositions);
xlabel('X (mm)'); ylabel('Y (mm)'); zlabel('Z (mm)');



%     x0 = p0(1);
%     y0 = p0(2);
%     z0 = p0(3);
%     x1 = p1(1);
%     y1 = p1(2);
%     z1 = p1(3);
%     plot3([x0;x1],[y0;y1],[z0;z1]);   % Draw a line between p0 and p1
%     
%     p = p1-p0;
%     alpha = 0.5;  % Size of arrow head relative to the length of the vector
%     beta = 0.5;  % Width of the base of the arrow head relative to the length
%     
%     hu = [x1-alpha*(p(1)+beta*(p(2)+eps)); x1; x1-alpha*(p(1)-beta*(p(2)+eps))];
%     hv = [y1-alpha*(p(2)-beta*(p(1)+eps)); y1; y1-alpha*(p(2)+beta*(p(1)+eps))];
%     hw = [z1-alpha*p(3);z1;z1-alpha*p(3)];
%     
%     hold on
%     plot3(hu(:),hv(:),hw(:))  % Plot arrow head
%     grid on
