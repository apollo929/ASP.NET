var _$_5a4b=["inp_src","inp_title","inp_target","sel_protocol","btnbrowse","editor","","replace","href","value","title","target","onclick","SetNextDialogWindow","ShowSelectFileDialog","length","options","toLowerCase","substr","://","indexOf",":","others","selectedIndex"];var inp_src=Window_GetElement(window,_$_5a4b[0],true);var inp_title=Window_GetElement(window,_$_5a4b[1],true);var inp_target=Window_GetElement(window,_$_5a4b[2],true);var sel_protocol=Window_GetElement(window,_$_5a4b[3],true);var btnbrowse=Window_GetElement(window,_$_5a4b[4],true);var obj=Window_GetDialogArguments(window);var editor=obj[_$_5a4b[5]];SyncToView();function SyncToView(){var src=obj[_$_5a4b[8]][_$_5a4b[7]](/$\s*/,_$_5a4b[6]);Update_sel_protocol(src);inp_src[_$_5a4b[9]]= src;if(obj[_$_5a4b[10]]){inp_title[_$_5a4b[9]]= obj[_$_5a4b[10]]};if(obj[_$_5a4b[11]]){inp_target[_$_5a4b[9]]= obj[_$_5a4b[11]]}}btnbrowse[_$_5a4b[12]]= function btnbrowse_onclick(){function _0x11FBB(_0x15914){if(_0x15914){inp_src[_$_5a4b[9]]= _0x15914}}editor[_$_5a4b[13]](window);if(Browser_IsSafari()){editor[_$_5a4b[14]](_0x11FBB,inp_src[_$_5a4b[9]],inp_src)}else {editor[_$_5a4b[14]](_0x11FBB,inp_src[_$_5a4b[9]])}};function sel_protocol_change(){var src=inp_src[_$_5a4b[9]][_$_5a4b[7]](/$\s*/,_$_5a4b[6]);for(var i=0;i< sel_protocol[_$_5a4b[16]][_$_5a4b[15]];i++){var _0x13292=sel_protocol[_$_5a4b[16]][i][_$_5a4b[9]];if(src[_$_5a4b[18]](0,_0x13292[_$_5a4b[15]])[_$_5a4b[17]]()== _0x13292){src= src[_$_5a4b[18]](_0x13292[_$_5a4b[15]],src[_$_5a4b[15]]- _0x13292[_$_5a4b[15]]);break}};var _0x11847=src[_$_5a4b[20]](_$_5a4b[19]);if(_0x11847!=  -1){src= src[_$_5a4b[18]](_0x11847+ 3,src[_$_5a4b[15]]- 3- _0x11847)};var _0x11847=src[_$_5a4b[20]](_$_5a4b[21]);if(_0x11847!=  -1){src= src[_$_5a4b[18]](_0x11847+ 1,src[_$_5a4b[15]]- 1- _0x11847)};var _0x2D880=sel_protocol[_$_5a4b[9]];if(_0x2D880== _$_5a4b[22]){_0x2D880= _$_5a4b[6]};inp_src[_$_5a4b[9]]= _0x2D880+ src}function Update_sel_protocol(src){var _0x13AA5=false;for(var i=0;i< sel_protocol[_$_5a4b[16]][_$_5a4b[15]];i++){var _0x13292=sel_protocol[_$_5a4b[16]][i][_$_5a4b[9]];if(src[_$_5a4b[18]](0,_0x13292[_$_5a4b[15]])[_$_5a4b[17]]()== _0x13292){if(sel_protocol[_$_5a4b[23]]!= i){sel_protocol[_$_5a4b[23]]= i};_0x13AA5= true;break}};if(!_0x13AA5){sel_protocol[_$_5a4b[23]]= sel_protocol[_$_5a4b[16]][_$_5a4b[15]]- 1}}function insert_link(){var arr= new Array();arr[0]= inp_src[_$_5a4b[9]];if(inp_target[_$_5a4b[9]]){arr[1]= inp_target[_$_5a4b[9]]};if(inp_title[_$_5a4b[9]]){arr[2]= inp_title[_$_5a4b[9]]};Window_SetDialogReturnValue(window,arr);Window_CloseDialog(window)}