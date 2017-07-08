# -*- coding: utf-8 -*-
import sys

if len(sys.argv) != 2:
    print(sys.argv[0] + ":argument is invalid.")
    sys.exit()

text = sys.argv[1]

flag = True
while flag:
    start = text.find("【")
    end = text.find("】")
    if start == -1 or end == -1:
        flag = False
    else:
        text_list = list(text)
        del text_list[start:end + 1]
        text = "".join(text_list)

print(text)
