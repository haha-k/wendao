import os
import shutil

dirname = os.listdir('./apps')

print(dirname)

for dir in dirname:
    path = os.path.join('E:\\xxxx\\Wendao\\apps\\',dir)
    if os.path.isdir(path):
        for dirs in os.listdir(path):
            if dirs=='migrations':
                print(os.path.join(path,dirs))
                shutil.rmtree(os.path.join(path,dirs))





