function [ rotationMatrix ] = getEarthToBodyMatrix( roll, pitch, yaw )
%getEarthToBodyMatrix returns the rotation matrix in order to rotate a 
%vector from the Earth frame to the body one
%
%   [ rotationMatrix ] = getEarthToBodyMatrix( roll, pitch, yaw )
%

Rx = getRotationMatrix( 'x', roll );
Ry = getRotationMatrix( 'y', pitch );
Rz = getRotationMatrix( 'z', yaw );

rotationMatrix = Rx * Ry * Rz;

end