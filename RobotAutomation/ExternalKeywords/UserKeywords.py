import os

def create_folder(foldername):
    os.mkdir("C:\\information\\TestingWorld" + foldername)

def create_sub_folder(subfoldername):
    os.mkdir("C:\\information\\TestingWorld\\TestingWorldIndia\\" + subfoldername)

def concatenate_two_values(val1, val2):
    val3 = val1 + " " + val2
    return val3