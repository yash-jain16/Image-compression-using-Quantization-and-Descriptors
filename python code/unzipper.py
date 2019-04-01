import gzip
import json

with open("output.json", "r") as read_file:
	data=json.load(read_file)

output=[]

for i in data:
	if i[0]=='a':
		for x in xrange(0,i[1]):
			output.append(0)
	else:
		if i[1]==0:
			output.append(i[0])
		else:
			for x in xrange(0,i[1]):
				output.append(0)
			output.append(i[0])

print(output)

