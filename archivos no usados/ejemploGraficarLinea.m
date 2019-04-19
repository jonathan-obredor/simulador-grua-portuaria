clear all


cable=line;
cable.Visible='on';


puntoInicial=[5,5]; % This defines the midpoint. You should give a and b some value. lineangle=c; % This defines the angle. Use this if your angle is in radians. lineangle=c*pi/180; % This defines the angle. Use this if your angle is in degrees.
angulo=-0.175%*pi/180;
L=1; % This defines the length of the line
x=[0,1]*L*cos(angulo)+puntoInicial(1); 
y=[0,1]*L*sin(angulo)+puntoInicial(2); 
cable.XData=x
cable.YData=y
