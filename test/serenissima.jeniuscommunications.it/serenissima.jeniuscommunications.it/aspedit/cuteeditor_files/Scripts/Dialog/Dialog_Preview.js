var _$_5f23=["idSource","inc_width","inc_height","onload","availWidth","screen","window","availHeight","contentWindow","GetDocument","outerHTML","documentElement","text/html","replace","open","write","close","onresize","dialogWidth","innerWidth","clientWidth","body","dialogHeight","innerHeight","clientHeight","value","contentDocument","document"];var editor=Window_GetDialogArguments(window);var idSource=Window_GetElement(window,_$_5f23[0],true);var inc_width=Window_GetElement(window,_$_5f23[1],true);var inc_height=Window_GetElement(window,_$_5f23[2],true);var ParentW;var ParentH;window[_$_5f23[3]]= function window_onload(){ParentW= top[_$_5f23[6]][_$_5f23[5]][_$_5f23[4]];ParentH= top[_$_5f23[6]][_$_5f23[5]][_$_5f23[7]];var iframe=idSource[_$_5f23[8]];var editdoc=editor[_$_5f23[9]]();var _0x2EAED;if(Browser_IsWinIE()){_0x2EAED= editdoc[_$_5f23[11]][_$_5f23[10]]}else {_0x2EAED= outerHTML(editdoc[_$_5f23[11]])};var _0x2EAB8=Frame_GetContentDocument(iframe);_0x2EAB8[_$_5f23[14]](_$_5f23[12],_$_5f23[13]);_0x2EAB8[_$_5f23[15]](_0x2EAED);_0x2EAB8[_$_5f23[16]]();ShowSizeInfo()};window[_$_5f23[17]]= ShowSizeInfo;function ShowSizeInfo(){var _0x221E6,_0x11E7D;if(window[_$_5f23[18]]){_0x221E6= window[_$_5f23[18]]}else {if(window[_$_5f23[19]]){_0x221E6= window[_$_5f23[19]]}else {if(document[_$_5f23[11]]&& document[_$_5f23[11]][_$_5f23[20]]){_0x221E6= document[_$_5f23[11]][_$_5f23[20]]}else {if(document[_$_5f23[21]]){_0x221E6= document[_$_5f23[21]][_$_5f23[20]]}}}};if(window[_$_5f23[22]]){_0x11E7D= window[_$_5f23[22]]}else {if(window[_$_5f23[23]]){_0x11E7D= window[_$_5f23[23]]}else {if(document[_$_5f23[11]]&& document[_$_5f23[11]][_$_5f23[24]]){_0x11E7D= document[_$_5f23[11]][_$_5f23[24]]}else {if(document[_$_5f23[21]]){_0x11E7D= document[_$_5f23[21]][_$_5f23[24]]}}}};inc_width[_$_5f23[25]]= _0x221E6;inc_height[_$_5f23[25]]= _0x11E7D}function do_Close(){Window_CloseDialog(window)}function Frame_GetContentDocument(_0x1541C){if(_0x1541C[_$_5f23[26]]){return _0x1541C[_$_5f23[26]]};return _0x1541C[_$_5f23[27]]}