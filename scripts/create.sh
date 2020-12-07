#!/bin/bash

nowtime=`date "+%Y-%m-%d"`
path="./"
echo "created ${path}${nowtime}.md"
echo "# 日報(${nowtime})" >> "${path}${nowtime}.md"

declare -a titles=("今日やったこと" "明日やること")

title=""
id_base=0
echo "" >> "${path}${nowtime}.md"
echo "## 今日やったこと" >> "${path}${nowtime}.md"

let id_base=$#+1
echo "" >> "${path}${nowtime}.md"
echo "## 明日やること" >> "${path}${nowtime}.md"
