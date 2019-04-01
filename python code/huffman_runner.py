from huffman import HuffmanCoding

#input file path
path = "myfile_90.txt"

h = HuffmanCoding(path)

output_path = h.compress()
h.decompress(output_path)