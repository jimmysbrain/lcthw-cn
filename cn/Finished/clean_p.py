# A dirty script to produce readable Chinese html pages.

import os
import shutil
import glob

import lxml.html
from lxml import etree

for htfile in glob.iglob("learn*.html"):
    html = open(htfile).read().decode('utf8').encode('utf8')

    doc = lxml.html.document_fromstring(html)

    content = doc.find("body").find("div").find("div").findall("div")[1].find("div")

    # Remove extra line breaks from <p> tags.
    for para in content.findall("p"):
        para.text = para.text.replace("\n", "")

    # Remove extra line breaks from source code captions.
    for srcdiv in content.findall("div"):
        _cnt = srcdiv.find("div")
        if _cnt is not None:
            cnt = _cnt.findall("span")[1]
            cnt.text = cnt.text.replace("\n", "")

    # Correct page title.
    h2 = content.find("h2")
    if h2:
        it = list(h2.itertext())[1]
        head = doc.find("head").find("title")
        head.text = it

    result = etree.tostring(doc,
                            pretty_print=True,
                            method='html',encoding="utf8")

    with open(htfile, 'w') as r:
        r.write(result)
