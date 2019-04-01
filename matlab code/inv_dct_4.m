function [ op_image ] = inv_dct_4( inp_image )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
mask=[1 1 1 0
    1 1 0 0
    1 0 0 0
    0 0 0 0];
B= blockproc(inp_image,[4 4],@(block_struct)mask.*block_struct.data);
D4=dctmtx(4);
idct= @(block_struct) D4' * block_struct.data *D4;
op_image=blockproc(B,[4 4],idct);

end

