img = imread('C:\Users\dhair\Desktop\Yash\track.bmp');
img=rgb2gray(img);
img=imresize(img,[256,256]);
imgd=double(img);
imshow(img);
figure;
imgd=imgd-128;
imwrite(imgd, 'C:\Users\dhair\Desktop\Yash\inp_1.bmp', 'bmp');
dct_applied=dct_8(imgd);

quant=quant_generator(90);

c=@(block_struct)(block_struct.data) ./quant;
quantized=blockproc(dct_applied,[8 8],c);
quantized=round(quantized);
imwrite(quantized, 'C:\Users\dhair\Desktop\Yash\op_1.bmp', 'bmp');

imshow(quantized);

inline_quant=zigzag(quantized);
%dlmwrite('C:\Users\dhair\Desktop\Yash\matrix.txt',inline_quant,'delimiter','\n');
%mat2np(inline_quant,'inline_quant.pkl','float64');
save('C:\Users\dhair\Desktop\Yash\matrix_90.mat','inline_quant');

regen_quantized=izigzag(inline_quant,256,256);

recon=blockproc(quantized,[8 8],@(block_struct)quant.*block_struct.data);

figure;
imshow(recon);

recon_final=inv_dct_8(recon);
figure;
recon_final=recon_final+128;
imshow(uint8(recon_final));
imwrite(uint8(recon_final),'C:\Users\dhair\Desktop\Yash\op_2.bmp', 'bmp');

error=rmse_error(recon_final,imgd+128);
disp(error)