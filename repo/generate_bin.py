import os
import binascii
import random

LENGTH = 9

def generateBinCoe():
	
	f = open("bin_nums.coe", 'w')
	
	text = "memory_initialization_radix = 2;\n"
	text += "memory_initialization_vector =\n"
	
	starters = '0'*LENGTH + ",\n" + '1'*LENGTH+",\n"+"101010101,\n"	
	text = text + starters

	f.write(text)

	first = '0'*LENGTH + "," + "\n"
	f.write(first)
	
	prev = '0'
	# range 4 -> first + 3 starts
	for i in range(4,100):
		new_bin = bin(int('1',2) + int(prev,2))
		new_bin = (LENGTH - len(new_bin[2:]))*'0' + new_bin[2:]
		if i < 99:
			comma = ","
		else:
			comma = ""
		f.write(new_bin+comma+"\n")
		prev = new_bin
		

def generateRandBinCoe():
	
	f = open("bin_rand_nums.coe", 'w')
	
	text = "memory_initialization_radix = 2;\n"
	text += "memory_initialization_vector =\n"
	f.write(text)
	
	
	for i in range(0,100):
		new_bin = ""
		for j in range(0,LENGTH):
			new_bin = new_bin + str(random.randint(0,1))
			
		if i < 99:
			comma = ","
		else:
			comma = ""

		f.write(new_bin+comma+"\n")
		
	


if __name__== "__main__":
	generateBinCoe()
	generateRandBinCoe()
	