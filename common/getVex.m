function [ vector ] = getVex( skew )
%getVex returns the 3-dimensional vector given a skew symmetric matrix 
%
%   [ vector ] = getVex( skew )
%
     
vector_1 = skew(3,2);
vector_2 = skew(1,3);
vector_3 = skew(2,1);

vector = [ vector_1 ;
           vector_2 ;
           vector_3];

end