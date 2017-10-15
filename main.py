import os
import time
import pwd
import json
from hashlib import sha1

def filepermissions(filepath):
    try:
        filename = filepath.split("/")[-1]
        fstat = os.stat(filepath)
        fmode = oct(fstat.st_mode)[5:]
        fname = pwd.getpwuid(fstat.st_uid).pw_name
        frecentm = time.ctime(fstat.st_mtime)
        frecento = time.ctime(fstat.st_atime)
        filedesc = {'mode':fmode,'authors':fname,'recent_modified':frecentm,'recent_opened':frecento}
        return json.dumps(filedesc,indent=4)
    except:
        return "Undefined Error"

def filehash(filepath):
    if os.path.isfile(filepath):
        file = open(filepath,'rb').read()
        if not file:
            return "File is empty"
        return sha1(file).hexdigest()
    return "Is the file?"
