# After running "pip install DyMat" ... or conda or whatever package manager 
# you use, this basic script should run.  

import os
import datetime
import DyMat

print(f"Running DyMat version {DyMat.__version__}.")
print(os.getcwd())
print(datetime.datetime.now())