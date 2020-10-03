# -*- coding: utf-8 -*-
"""
Transfer ida function name text file to database.
We can use this to store our function name information.
So we can save time when we recogenize function in Angr.
"""
import os
import sqlite3
 
from idaapi import *
from idautils import *
from idc import *
 
def main(filename):
    if os.path.exists(filename):
        try :
            os.remove(filename)
            Message("Previous Database %s has removed\n" % filename)
        except:
            Message("Error! Can not remove file.")
    
    # create new database
    db = sqlite3.connect(filename)
    cur = db.cursor()
    sql_create = """create table if not exists functions(
                            id integer primary key,
                            address text unique,
                            name varchar(255))"""
    cur.execute(sql_create)
    
    sql_insert = "insert into functions (address, name) values (?, ?)"
    # enum functions
    func_list = Functions()
    
    for func in func_list:
        name = GetFunctionName(func)
        cur.execute(sql_insert,(func,name))
    Message("We have handled %d functions. " % len(list(Functions())))
    db.commit()
    db.close()
 
if __name__=="__main__":
    f = AskFile(1,"*.sqlite","Select the output file")
    if BADADDR == f :
        Warning("AskFile Failed!")
    else:
        main(f)