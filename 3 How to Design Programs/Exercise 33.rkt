;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 33|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
The “Year 2000” Problem.
两千年问题

一般来说,由于计算机程序中使用两个数字来表示年份,
如1998年被表示为“98”、1999年被表示为“99”;而2000年被表示为“00”,
这样将会导致某些程序在计算时得到不正确的结果,如把“00”误解为1900年。
在嵌入式系统中可能存在同样的问题,
这有可能导致设备停止运转或者发生更加灾难性的后果。

两千年问题始于1960年代,当时计算机内存和外部存储介质的成本很高,
大多数数据处理需要借助于用穿孔卡片,它用80行文本表示所储存的数据。
那个时候的编程语言,如COBOL和RPG,使用ASCII码和EBCDIC编码表示数据。
如果用四位数字表示年份,就要多占用储存器空间,就会使成本增加,
因此为了节省存储空间,计算机系统的编程人员采用两位数字表示年份,
随着计算机技术的迅猛发展,虽然后来存储器的价格降低了,
但在计算机系统中使用两位数字来表示年份的做法,
却由于思维上的惯性而被沿袭下来。
对大多数程序员来讲,他们并不认为所编写的软件会持续使用很多年。

两千年问题是由Bob Bemer在1958年第一次提出的。
在其后的二十年里，他用了很大的努力，
希望政府、企业和国际组织（如IBM和ISO）来关注这个问题，但反响寥寥。
直到2000年将要到来的时候，人们才感觉到两千年问题的紧迫性。
于是社会和政府都投入了大量的人力和物力来避免发生大规模的计算机灾难。
而从现在来看，这些努力也取得了相应的成果。
|#
