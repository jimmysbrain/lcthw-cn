# -*- encoding: utf8 -*-
# A dirty script to produce readable Chinese html pages.

import os
import sys
import glob
import re

from lxml import etree

parser = etree.HTMLParser()
prefix = "learn-c-the-hard-way"
tags = ["dd", "li", "p", "div", "span"]

def spacify(text):
    """Makes spaces appear in the proper positions. """
    cn_en = re.compile(u"([一-龥])([A-Za-z0-9])")
    en_cn = re.compile(u"([A-Za-z0-9])([一-龥])")
    cn_brk = re.compile(u"([一-龥])(\n\s*)([一-龥])")
    text_brk = cn_brk.sub(r"\1\3", text)
    return en_cn.sub("\1 \2", cn_en.sub("\1 \2", text_brk))


def main(sys.argv):
    if len(sys.argv) != 2:
        print "Usage: %s PATTERN" % sys.argv[0]
        return 1
    for htfile in glob.iglob(sys.argv[1]):
        print "Cleaning", htfile
        doc = etree.parse(htfile, parser)

        content = doc.xpath('/html/body/div/div[1]/div[2]/div')[0]

        for t in tags:
            for part in content.xpath("//" + t):
                if part.text is not None:
                    part.text = spacify(part.text)
                if part.tail is not None:
                    part.tail = spacify(part.tail)

    # Remove extra line breaks from source code captions.
    # for cap in content.xpath("div/div[1]/span[2]"):
    #     cap.text = spacify(cap.text)

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

if __name__ == '__main__':
    main(sys.argv)

