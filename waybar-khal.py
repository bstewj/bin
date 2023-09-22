# #!/usr/bin/env python
# 
# import subprocess
# import datetime
# import json
# from html import escape
# 
# data = {}
# 
# today = datetime.date.today().strftime("%d-%m-%Y")
# 
# next_week = (datetime.date.today() +
             # datetime.timedelta(days=10)).strftime("%d-%m-%Y")
# 
# output = subprocess.check_output("khal list now "+next_week, shell=True)
# output = output.decode("utf-8")
# 
# lines = output.split("\n")
# new_lines = []
# for line in lines:
    # clean_line = escape(line).split(" ::")[0]
    # if len(clean_line) and not clean_line[0] in ['0', '1', '2']:
        # clean_line = "\n<b>"+clean_line+"</b>"
    # new_lines.append(clean_line)
# output = "\n".join(new_lines).strip()
# 
# if today in output:
    # data['text'] = " " + output.split('\n')[1]
# else:
    # data['text'] = ""
# 
# data['tooltip'] = output
# 
# print(json.dumps(data))

#!/usr/bin/env python
import json
import subprocess
data = {}
output = subprocess.check_output("khal list now 7days --format \"{start-end-time-style} {title}\"", shell=True).decode("utf-8")
lines = output.split("\n")
new_lines = []
for line in lines:
    if len(line) and line[0].isalpha():
        line = "\n<b>"+line+"</b>"
    new_lines.append(line)
output = "\n".join(new_lines).strip()
if "Today" in output:
    data['text'] = " " + output.split('\n')[1]
else:
    data['text'] = ""
data['tooltip'] = output
print(json.dumps(data))
