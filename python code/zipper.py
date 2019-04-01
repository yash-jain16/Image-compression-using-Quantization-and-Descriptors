from scipy.io import loadmat
import pickle
import json
import gzip

data=loadmat('matrix_90.mat')
meta_data_value=[]
meta_data_count=[]
count=0
for i in data['inline_quant'][0]:
	#print(type(int(i)))
	if (int(i))==0:
		count=count+1
	else:
		print('i is {0} and the count is {1}'.format(int(i),count))
		meta_data_value.append(int(i))
		meta_data_count.append(count)
		count=0
meta_data_value.append('a')
meta_data_count.append(count)
print(meta_data_value)
print('************value end*****************')
print(meta_data_count)	

k1=len(meta_data_value)
k2=len(meta_data_count)

print('The lenght of values is {0} and length of count is {1}'.format(k1,k2))

merged_list = [(meta_data_value[i], meta_data_count[i]) for i in range(0, len(meta_data_value))] 
print(merged_list)

f = open('output.json', 'w')
json.dump(merged_list, f)
f.close()

f_in = open('output.json')
f_out = gzip.open('file.txt.gz', 'wb')
f_out.writelines(f_in)
f_out.close()
f_in.close()



