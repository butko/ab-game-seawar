function kadr(k)
	{document.write("<td width=150 align=center valign=middle><a href=view.htm?",k,"*jpg><img src=",k,"s.jpg border=0></a>");}
function plenka(i1,i2,i3,i4)
	{document.write("<center><table bgcolor=black cellspacing=5><tr><td colspan=4><table background=kadr.gif width=100%><tr><td>&nbsp;</tr></table></tr><tr>"); kadr(i1); kadr(i2); kadr(i3); kadr(i4); document.write("</tr><tr><td colspan=4><table background=kadr.gif width=100%><tr><td>&nbsp;</tr></table></tr></table></center>");}

document.write("<table align=center border=0 cellspacing=0 cellpadding=10 width=100%><tr><td width=80% valign=top>");
var pm=document.title.split(' :: ');
document.write("<h1>",pm[0],"</h1>");
