function [ op_image ] = dct_4( inp_image )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
D4=dctmtx(4);
dct= @(block_struct) D4 * block_struct.data *D4';
op_image=blockproc(inp_image,[4 4],dct);

end

