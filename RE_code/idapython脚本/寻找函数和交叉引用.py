#
## another way to search all not safe functions
#
#coding:utf-8
from idaapi import *

# 设置颜色
def judgeAduit(addr):
    '''
    not safe function handler
    '''
    MakeComm(addr,"### AUDIT HERE ###")
    SetColor(addr,CIC_ITEM,0x0000ff)  #set backgroud to red
    pass

# 函数标识  
def flagCalls(danger_funcs):
    '''
    not safe function finder
    '''
    count = 0
    for func in danger_funcs:      
        faddr = LocByName( func )     
        if faddr != BADADDR: 
            # Grab the cross-references to this address         
            cross_refs = CodeRefsTo( faddr, 0 )                       
            for addr in cross_refs:
                count += 1 
                Message("%s[%d] calls 0x%08x\n"%(func,count,addr))  
                judgeAduit(addr)
                    
if __name__ == '__main__':
    '''
    handle all not safe functions
    '''
    print "-------------------------------"
    # 列表存储需要识别的函数
    danger_funcs = ["strcpy","sprintf","strncpy"] 
    flagCalls(danger_funcs)
    print "-------------------------------"