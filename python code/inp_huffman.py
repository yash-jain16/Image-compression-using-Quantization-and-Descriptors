from scipy.io import loadmat

str1=""
data=loadmat('matrix_90.mat')
meta_data_value=[]
meta_data_count=[]
count=0
for i in data['inline_quant'][0]:
	str1=str1+str(int(i))

file1 = open("myfile_90.txt","w")
file1.write(str1)