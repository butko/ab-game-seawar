document.write("<p align=right><a href=http://ab-lib.narod.ru>http://ab-lib.narod.ru</a><br><nobr>copyright &copy; <a href=mailto:ab-lib@narod.ru?subject=web_site>Бутко А.В.</a></nobr><br>");
//HotLog
hotlog_js="1.0";
hotlog_r=""+Math.random()+"&s=51664&im=134&r="+escape(document.referrer)+"&pg="+escape(window.location.href);
document.cookie="hotlog=1; path=/"; hotlog_r+="&c="+(document.cookie?"Y":"N");
hotlog_js="1.1";hotlog_r+="&j="+(navigator.javaEnabled()?"Y":"N")
hotlog_js="1.2";
hotlog_r+="&wh="+screen.width+'x'+screen.height+"&px="+(((navigator.appName.substring(0,3)=="Mic"))?
screen.colorDepth:screen.pixelDepth)
hotlog_js="1.3"
hotlog_r+="&js="+hotlog_js;
document.write("<a href='http://click.hotlog.ru/?51664' target='_top'><img "+" src='http://hit3.hotlog.ru/cgi-bin/hotlog/count?"+hotlog_r+"&' width=88 height=31 alt=HotLog></a></tr></table>")