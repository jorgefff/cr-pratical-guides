import os
import binascii


def generateHex(elems, size):
    
    f = open("hexOutput.txt", 'w')

    size = int(size/2)

    word = ""
    i = 0
    while(i < elems):
        
        h = binascii.b2a_hex(os.urandom(size)).decode()
        
        word += "x\""+str(h)+"\", "

        i = i+1

        if (i % 8 == 0):
            word += "\n"
            
    f.write(word)
        


if __name__== "__main__":
    generateHex(512, 8)
    #input("QUIT")
