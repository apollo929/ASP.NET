var _$_3065=["inp_width","inp_height","sel_align","sel_valign","inp_bgColor","inp_borderColor","inp_borderColorLight","inp_borderColorDark","inp_class","inp_id","inp_tooltip","value","bgColor","getAttribute","backgroundColor","style","","id","borderColor","borderColorLight","borderColorDark","className","width","height","align","vAlign","title","removeAttribute","setAttribute","ValidNumber","test","ValidID","class","valign","cssText","border-image: none;","onclick"];var inp_width=Window_GetElement(window,_$_3065[0],true);var inp_height=Window_GetElement(window,_$_3065[1],true);var sel_align=Window_GetElement(window,_$_3065[2],true);var sel_valign=Window_GetElement(window,_$_3065[3],true);var inp_bgColor=Window_GetElement(window,_$_3065[4],true);var inp_borderColor=Window_GetElement(window,_$_3065[5],true);var inp_borderColorLight=Window_GetElement(window,_$_3065[6],true);var inp_borderColorDark=Window_GetElement(window,_$_3065[7],true);var inp_class=Window_GetElement(window,_$_3065[8],true);var inp_id=Window_GetElement(window,_$_3065[9],true);var inp_tooltip=Window_GetElement(window,_$_3065[10],true);SyncToView= function SyncToView_Tr(){inp_bgColor[_$_3065[11]]= element[_$_3065[13]](_$_3065[12])|| element[_$_3065[15]][_$_3065[14]]|| _$_3065[16];inp_id[_$_3065[11]]= element[_$_3065[13]](_$_3065[17])|| _$_3065[16];inp_bgColor[_$_3065[15]][_$_3065[14]]= inp_bgColor[_$_3065[11]]|| _$_3065[16];inp_borderColor[_$_3065[11]]= element[_$_3065[13]](_$_3065[18])|| _$_3065[16];inp_borderColor[_$_3065[15]][_$_3065[14]]= inp_borderColor[_$_3065[11]]|| _$_3065[16];inp_borderColorLight[_$_3065[11]]= element[_$_3065[13]](_$_3065[19])|| _$_3065[16];inp_borderColorLight[_$_3065[15]][_$_3065[14]]= inp_borderColorLight[_$_3065[11]]|| _$_3065[16];inp_borderColorDark[_$_3065[11]]= element[_$_3065[13]](_$_3065[20])|| _$_3065[16];inp_borderColorDark[_$_3065[15]][_$_3065[14]]= inp_borderColorDark[_$_3065[11]]|| _$_3065[16];inp_class[_$_3065[11]]= element[_$_3065[21]];inp_width[_$_3065[11]]= element[_$_3065[13]](_$_3065[22])|| element[_$_3065[15]][_$_3065[22]]|| _$_3065[16];inp_height[_$_3065[11]]= element[_$_3065[13]](_$_3065[23])|| element[_$_3065[15]][_$_3065[23]]|| _$_3065[16];sel_align[_$_3065[11]]= element[_$_3065[13]](_$_3065[24])|| _$_3065[16];sel_valign[_$_3065[11]]= element[_$_3065[13]](_$_3065[25])|| _$_3065[16];inp_tooltip[_$_3065[11]]= element[_$_3065[13]](_$_3065[26])|| _$_3065[16]};SyncTo= function SyncTo_Tr(element){if(inp_bgColor[_$_3065[11]]){element[_$_3065[12]]= inp_bgColor[_$_3065[11]]}else {element[_$_3065[27]](_$_3065[12])};element[_$_3065[28]](_$_3065[18],inp_borderColor[_$_3065[11]]);element[_$_3065[28]](_$_3065[19],inp_borderColorLight[_$_3065[11]]);element[_$_3065[28]](_$_3065[20],inp_borderColorDark[_$_3065[11]]);element[_$_3065[28]](_$_3065[21],inp_class[_$_3065[11]]);if(element[_$_3065[15]][_$_3065[22]]|| element[_$_3065[15]][_$_3065[23]]){try{element[_$_3065[15]][_$_3065[22]]= inp_width[_$_3065[11]];element[_$_3065[15]][_$_3065[23]]= inp_height[_$_3065[11]]}catch(er){alert(CE_GetStr(_$_3065[29]))}}else {try{element[_$_3065[22]]= inp_width[_$_3065[11]];element[_$_3065[23]]= inp_height[_$_3065[11]]}catch(er){alert(CE_GetStr(_$_3065[29]))}};var _0x2B869=/[^a-z\d]/i;if(_0x2B869[_$_3065[30]](inp_id[_$_3065[11]])){alert(CE_GetStr(_$_3065[31]));return};element[_$_3065[24]]= sel_align[_$_3065[11]];element[_$_3065[17]]= inp_id[_$_3065[11]];element[_$_3065[25]]= sel_valign[_$_3065[11]];element[_$_3065[26]]= inp_tooltip[_$_3065[11]];if(element[_$_3065[17]]== _$_3065[16]){element[_$_3065[27]](_$_3065[17])};if(element[_$_3065[12]]== _$_3065[16]){element[_$_3065[27]](_$_3065[12])};if(element[_$_3065[18]]== _$_3065[16]){element[_$_3065[27]](_$_3065[18])};if(element[_$_3065[19]]== _$_3065[16]){element[_$_3065[27]](_$_3065[19])};if(element[_$_3065[20]]== _$_3065[16]){element[_$_3065[27]](_$_3065[20])};if(element[_$_3065[21]]== _$_3065[16]){element[_$_3065[27]](_$_3065[21])};if(element[_$_3065[21]]== _$_3065[16]){element[_$_3065[27]](_$_3065[32])};if(element[_$_3065[24]]== _$_3065[16]){element[_$_3065[27]](_$_3065[24])};if(element[_$_3065[25]]== _$_3065[16]){element[_$_3065[27]](_$_3065[33])};if(element[_$_3065[26]]== _$_3065[16]|| element[_$_3065[26]]== null){element[_$_3065[27]](_$_3065[26])};if(element[_$_3065[22]]== _$_3065[16]){element[_$_3065[27]](_$_3065[22])};if(element[_$_3065[23]]== _$_3065[16]){element[_$_3065[27]](_$_3065[23])};if(element[_$_3065[15]][_$_3065[34]]== _$_3065[35]){element[_$_3065[27]](_$_3065[15])}};inp_borderColor[_$_3065[36]]= function inp_borderColor_onclick(){SelectColor(inp_borderColor)};inp_bgColor[_$_3065[36]]= function inp_bgColor_onclick(){SelectColor(inp_bgColor)};inp_borderColorLight[_$_3065[36]]= function inp_borderColorLight_onclick(){SelectColor(inp_borderColorLight)};inp_borderColorDark[_$_3065[36]]= function inp_borderColorDark_onclick(){SelectColor(inp_borderColorDark)}