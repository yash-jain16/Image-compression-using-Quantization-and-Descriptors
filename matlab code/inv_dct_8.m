function [ op_image ] = inv_dct_8( inp_image )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
D8=dctmtx(8);
mask=[1 1 1 1 0 0 0 0
    1 1 1 0 0 0 0 0
    1 1 0 0 0 0 0 0
    1 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0];
B= blockproc(inp_image,[8 8],@(block_struct)mask.*block_struct.data);

idct= @(block_struct) D8' * block_struct.data *D8;
op_image=blockproc(B,[8 8],idct);

end

