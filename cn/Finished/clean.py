# A dirty script to produce readable Chinese html pages.

import os
import glob
import re

from lxml import etree

parser = etree.HTMLParser()
prefix = "learn-c-the-hard-way"

for htfile in glob.iglob(prefix + "*.html"):
    print "Cleaning", htfile
    doc = etree.parse(htfile, parser)

    content = doc.xpath('/html/body/div/div[1]/div[2]/div')[0]

    # Remove extra line breaks from <p> tags.
    for para in content.xpath("//p"):
        if para.text is not None:
            para.text = re.sub("\n\s*", "", para.text)
        if para.tail is not None:
            para.tail = re.sub("\n\s*", "", para.tail)

    # Remove extra line breaks from <dd> tags.
    for dd in content.xpath("//dl/dd"):
        if dd.text is not None:
            dd.text = re.sub("\n\s*", "", dd.text)
        if dd.tail is not None:
            dd.tail = re.sub("\n\s*", "", dd.tail)

    # Remove extra line breaks from source code captions.
    for cap in content.xpath("div/div[1]/span[2]"):
        cap.text = re.sub("\n\s*", "", cap.text)

    # Correct page title.
    if prefix + "ch" in htfile:  # chapters
        h2 = content.find("h2")
        if h2 is not None:
            it = list(h2.itertext())[1]
            head = doc.find("head").find("title")
            head.text = it

    elif prefix + "li" in htfile:  # preface
        h2 = content.xpath("//h2/*")[0]
        head = doc.find("head").find("title")
        head.text = h2.tail

    elif prefix + "pa" in htfile:  # toc
        h1 = content.find("h1")
        part = h1.find("span").text
        name = h1.tail
        if h1 is not None:
            head = doc.find("head").find("title")
            head.text = part

    doc.write_c14n(htfile)


