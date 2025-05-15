# -*- coding: utf-8 -*-
"""
Created on Mon May 12 16:02:37 2025

Removes every file that does not end with .mos

@author: hart_t1
"""

import os

# Get the absolute path of the script itself
script_path = os.path.abspath(__file__)

# Get the directory of the script
script_dir = os.path.dirname(script_path)

# Change the current working directory to the script's directory
os.chdir(script_dir)

# Get the list of files in the current directory (now the script's directory)
files = [f for f in os.listdir('.') if os.path.isfile(f)]

# Iterate over each file
for file in files:
    # Check if the file is not the script itself and does not end with '.mos'
    if file != os.path.basename(__file__) and not file.endswith('.mos'):
        try:
            # Attempt to remove the file
            os.remove(file)
            print(f"Removed: {file}")
        except OSError as e:
            # Handle any errors during removal
            print(f"Error removing {file}: {e}")