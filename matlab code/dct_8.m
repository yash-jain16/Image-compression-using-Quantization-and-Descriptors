function [ op_image ] = dct_8( inp_image )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
D8=dctmtx(8);
dct= @(block_struct) D8 * block_struct.data *D8';
op_image=blockproc(inp_image,[8 8],dct);

end

