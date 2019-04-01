# Image-compression-using-Quantization-and-Descriptors

The main.py will quantize and decquantize the image (without the use of python), hence the code needs to be seggragated accordingly before use

The vector containing the quantized values is to be exported as a .mat file to to the matlab code-zipper.py or huffman.py both of which shall compress the descriptor information.

The code uses the standard quantization matrices given by JPEG for q1uantization and then makes a pair of non-zero element with no. of trailing zeros to generate the descriptor.
