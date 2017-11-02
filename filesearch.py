import os










def filebrowser(path):
    for root,dirs,files in os.walk(path):
        for name in files:

