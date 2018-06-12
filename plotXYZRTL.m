function [] = plotXYZRTL(XYZRTL, scale, headsize)
%plotXYZRTL Plots quivers for a point given by XYZRTL with normalized
%length
%   Takes the XYZRTL representation of measurements and represents them in
%   the camera frame


X = XYZRTL(1);
Y = XYZRTL(2);
Z = XYZRTL(3);
R = XYZRTL(4);
T = XYZRTL(5);
L = XYZRTL(6);

dcm = compose_rotation(R,T,L);

xVectorTarget = dcm(:,1)';
xVectorTargetNormalized = xVectorTarget/norm(xVectorTarget);

%norm(xVectorTargetNormalized)
%point1 = [X,Y,Z];
%point2 = point1 + xVectorTarget;

quiver3(X,Y,Z,xVectorTargetNormalized(1),xVectorTargetNormalized(2),xVectorTargetNormalized(3),scale, 'MaxHeadSize', headsize);%, 'linewidth',0.5);



end

