memories=dict()
 
for seg in Segments(): #遍历所有的段
    if SegName(seg)=='.text': 
        for head in Heads(seg,SegEnd(seg)): #遍历所有指令，head为地址
            if isCode(GetFlags(head)): #判断是否为指令
                flag=GetMnem(head) #获取汇编指令
                print "flag ",flag
                memories[flag]=memories.get(flag,0)+1 #统计指令个数
all=map(lambda x:(x[1],x[0]),memories.items()) 
all.sort() #排序
 
for pri,sed in all:
    print pri,sed