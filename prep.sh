#!/bin/sh

COMP_DIR="~/lcthw-cn/cn/Finished/output"
FINAL="learn-c-the-hard-way"

cp $COMP_DIR/*.html $COMP_DIR/*.css .
mv $FINAL.html index.html
cat fix.css >> $FINAL.css
