import pandas as pd
import os

print(os.getcwd()) # change path accordingly
input_file = "misc/TRY2045_501262086894_Wint.dat" # use /, not \

def find_header_line(filepath):
    with open(filepath, "r") as f:
        # loop over the first lines of the file, split it into strings of characters
        for i, line in enumerate(f):
            parts = line.strip().split()
            # The first line is where the column headers are, most importantly t and HH 
            if 't' in parts and 'HH' in parts:
                return i

header_line = find_header_line(input_file)
# find header line and let pandas start reading from there
df = pd.read_csv(input_file,sep='\s+',skiprows=header_line)

t_values = df['t'].values # extract temperature column
t_values[0] = t_values[1] # modelica wants to start at 0, this starts at hour 1
# but before that is one empty line. So I just repeat the very first value I hope
# that's okay
n = len(t_values)

# Create output file
header = f"#1\ndouble tab({n}, 2)\n# time  T_amb" 
lines = [f"{i*3600}\t{val}" for i, val in enumerate(t_values)]
output = header + '\n' + '\n'.join(lines) # puts together the header and all lines

# find the filename from the path (last time a slash was used)
idx = input_file.rfind('/')
season = input_file[-8:-4]
new_name = input_file[idx+1:idx+8]+"_converted_"+season+".txt"
# write to new file that's called like the old file plus _converted
with open(new_name, "w") as f:
    f.write(output)

print("Done.")