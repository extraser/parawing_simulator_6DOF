function [ rotationMatrix ] = getWindToBodyMatrix( alpha, beta )
%getWindToBodyMatrix Returns the rotation matrix in order to rotate a 
%vector from the wind frame to the body one
%
%   [ rotationMatrix ] = getWindToBodyMatrix( alpha, beta )
%

Ry = getRotationMatrix( 'y', alpha );
Rz = getRotationMatrix( 'z', beta );

rotationMatrix = Ry * Rz';

end