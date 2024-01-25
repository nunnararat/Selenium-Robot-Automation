import  openpyxl

wk = openpyxl.Workbook()
sh = wk.active
sh.title = "HelloTestingWorld"
print(sh.title)


sh['A4'].value = "www.theTestingWorld.com"


# 2nd Sheet is Created
wk.create_sheet(title="TestingW")
sh1 = wk['TestingW']
sh1['A3'] = "+91-8743913121"

# # Remove Sheet
# wk.remove(wk['HelloTestingWorld'])
wk.remove_sheet(wk['HelloTestingWorld'])

# Saving
wk.save("C:\\information\\TestingWorld\\Data\\PySheet.xlsx")