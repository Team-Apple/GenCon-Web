# -*- coding: utf-8 -*-
import sys
import make_sentence

def change_ab(text,local):
    start = text.find("【" + local + "】")
    text_list = list(text)
    del text_list[0:start]
    text = "".join(text_list)

    end = text.find("】")
    text_list = list(text)
    del text_list[0:end + 1]
    text = "".join(text_list)

    start = text.find("【")
    if start != -1:
        text_list = list(text)
        del text_list[start:len(text_list)]
        text = "".join(text_list)
    text_list = text.split("。")
    text = text_list[0]
    if "雨" in text:
        text = make_sentence.make_sentence('rain', '', '')
    return text

def change_all_ab(text):
    end_flag = False
    while not end_flag:
        start = text.find("【")
        end = text.find("】")
        if start == -1 or end == -1:
            end_flag = True
        else:
            text_list = list(text)
            del text_list[start:end + 1]
            title = text[start + 1:end] + "の情報です。"
            text_list.insert(start,title)
            text = "".join(text_list)
    return text

if len(sys.argv) != 3:
    print(sys.argv[0] + ":argument is invalid.")
    sys.exit()

if sys.argv[2] == "ALL":
    print(change_all_ab(sys.argv[1]))
else:
    print(change_ab(sys.argv[1],sys.argv[2]))
