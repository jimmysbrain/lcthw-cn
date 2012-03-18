import lxml.html
from lxml import etree

html = open("1.html").read().decode('utf8').encode('utf8')

doc = lxml.html.document_fromstring(html)

content = doc.find("body").find("div").find("div").findall("div")[1].find("div")

for para in content.findall("p"):
    para.text = para.text.replace("\n", "")

for srcdiv in content.findall("div"):
    _cnt = srcdiv.find("div")
    if _cnt is not None:
        cnt = _cnt.findall("span")[1]
    	cnt.text = cnt.text.replace("\n", "")

h2 = content.find("h2")
if h2:
    it = list(h2.itertext())[1]
    head = doc.find("head").find("title")
    head.text = it

result = etree.tostring(doc,
                        pretty_print=True,
                        method='html',encoding="utf8")

print result

