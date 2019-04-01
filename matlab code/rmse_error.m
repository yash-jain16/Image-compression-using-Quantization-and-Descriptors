function [ error ] = rmse_error( image1,image2 )
%UNTITLED16 Summary of this function goes here
%   Detailed explanation goes here
sum=0;
for i=1:256
    for j=1:256
        sum=sum+(image1(i,j)-image2(i,j))^2;
    end
end

error=sqrt(sum/(256*256));

end

