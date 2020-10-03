from idaapi import *
from idautils import *
from idc import *

def get_string(addr):
  out = ""
  while True:
    if Byte(addr) != 0:
      out += chr(Byte(addr))
    else:
      break
    addr += 1
  return out

b=[]

for i in get_string(0x00408068):
    b.append(i)

print ''.join(b)