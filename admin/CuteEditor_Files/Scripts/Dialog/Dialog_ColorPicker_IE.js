var OxO9e84=["onerror","onload","onclick","btnCancel","btnOK","onkeyup","txtHSB_Hue","onkeypress","txtHSB_Saturation","txtHSB_Brightness","txtRGB_Red","txtRGB_Green","txtRGB_Blue","txtHex","btnWebSafeColor","rdoHSB_Hue","rdoHSB_Saturation","rdoHSB_Brightness","rdoRGB_Red","rdoRGB_Green","rdoRGB_Blue","onmousemove","onmousedown","onmouseup","{format}","length","\x5C{","\x5C}","BadNumber","A number between {0} and {1} is required. Closest value inserted.","Title","Color Picker","SelectAColor","Select a color:","OKButton","OK","CancelButton","Cancel","AboutButton","About","Recent","WebSafeWarning","Warning: not a web safe color","WebSafeClick","Click to select web safe color","HsbHue","H:","HsbHueTooltip","Hue","HsbHueUnit","%","HsbSaturation","S:","HsbSaturationTooltip","Saturation","HsbSaturationUnit","HsbBrightness","B:","HsbBrightnessTooltip","Brightness","HsbBrightnessUnit","RgbRed","R:","RgbRedTooltip","Red","RgbGreen","G:","RgbGreenTooltip","Green","RgbBlue","RgbBlueTooltip","Blue","Hex","#","RecentTooltip","Recent:","\x0D\x0ALewies Color Pickerversion 1.1\x0D\x0A\x0D\x0AThis form was created by Lewis Moten in May of 2004.\x0D\x0AIt simulates the color picker in a popular graphics application.\x0D\x0AIt gives users a visual way to choose colors from a large and dynamic palette.\x0D\x0A\x0D\x0AVisit the authors web page?\x0D\x0Awww.lewismoten.com\x0D\x0A","UNDEFINED","FFFFFF","value","checked","ColorMode","ColorType","RecentColors","","pnlRecent","all","border","style","0px","backgroundColor","srcElement","display","none","title","innerHTML","backgroundPosition","px ","px","000000","zIndex","01234567879","keyCode","abcdef","01234567879ABCDEF","returnValue","0123456789ABCDEFabcdef","0","id","pnlGradient_Top","pnlVertical_Top","top","opacity","filters","backgroundImage","url(../Images/cpie_GradientPositionDark.gif)","url(../Images/cpie_GradientPositionLight.gif)","cancelBubble","clientY","clientX","className","GradientNormal","button","GradientFullScreen","=","; path=/;"," expires=",";","cookie","00336699CCFF","0x","frm","do_select","__cphex"];var POSITIONADJUSTX=0x15;var POSITIONADJUSTY=0x2e;var POSITIONADJUSTZ=0x2b;var msg= new Object(); window[OxO9e84[0x0]]=alert ;var ColorMode=0x1;var GradientPositionDark= new Boolean(false);var frm= new Object(); window[OxO9e84[0x1]]=window_load ; function initialize(){ frm[OxO9e84[0x3]][OxO9e84[0x2]]=btnCancel_Click ; frm[OxO9e84[0x4]][OxO9e84[0x2]]=btnOK_Click ; frm[OxO9e84[0x6]][OxO9e84[0x5]]=Hsb_Changed ; frm[OxO9e84[0x6]][OxO9e84[0x7]]=validateNumber ; frm[OxO9e84[0x8]][OxO9e84[0x5]]=Hsb_Changed ; frm[OxO9e84[0x8]][OxO9e84[0x7]]=validateNumber ; frm[OxO9e84[0x9]][OxO9e84[0x5]]=Hsb_Changed ; frm[OxO9e84[0x9]][OxO9e84[0x7]]=validateNumber ; frm[OxO9e84[0xa]][OxO9e84[0x5]]=Rgb_Changed ; frm[OxO9e84[0xa]][OxO9e84[0x7]]=validateNumber ; frm[OxO9e84[0xb]][OxO9e84[0x5]]=Rgb_Changed ; frm[OxO9e84[0xb]][OxO9e84[0x7]]=validateNumber ; frm[OxO9e84[0xc]][OxO9e84[0x5]]=Rgb_Changed ; frm[OxO9e84[0xc]][OxO9e84[0x7]]=validateNumber ; frm[OxO9e84[0xd]][OxO9e84[0x5]]=Hex_Changed ; frm[OxO9e84[0xd]][OxO9e84[0x7]]=validateHex ; frm[OxO9e84[0xe]][OxO9e84[0x2]]=btnWebSafeColor_Click ; frm[OxO9e84[0xf]][OxO9e84[0x2]]=rdoHsb_Hue_Click ; frm[OxO9e84[0x10]][OxO9e84[0x2]]=rdoHsb_Saturation_Click ; frm[OxO9e84[0x11]][OxO9e84[0x2]]=rdoHsb_Brightness_Click ; frm[OxO9e84[0x12]][OxO9e84[0x2]]=rdoRgb_Red_Click ; frm[OxO9e84[0x13]][OxO9e84[0x2]]=rdoRgb_Green_Click ; frm[OxO9e84[0x14]][OxO9e84[0x2]]=rdoRgb_Blue_Click ; pnlGradient_Top[OxO9e84[0x2]]=pnlGradient_Top_Click ; pnlGradient_Top[OxO9e84[0x15]]=pnlGradient_Top_MouseMove ; pnlGradient_Top[OxO9e84[0x16]]=pnlGradient_Top_MouseDown ; pnlGradient_Top[OxO9e84[0x17]]=pnlGradient_Top_MouseUp ; pnlVertical_Top[OxO9e84[0x2]]=pnlVertical_Top_Click ; pnlVertical_Top[OxO9e84[0x15]]=pnlVertical_Top_MouseMove ; pnlVertical_Top[OxO9e84[0x16]]=pnlVertical_Top_MouseDown ; pnlVertical_Top[OxO9e84[0x17]]=pnlVertical_Top_MouseUp ; pnlWebSafeColor[OxO9e84[0x2]]=btnWebSafeColor_Click ; pnlWebSafeColorBorder[OxO9e84[0x2]]=btnWebSafeColor_Click ; pnlOldColor[OxO9e84[0x2]]=pnlOldClick_Click ; lblHSB_Hue[OxO9e84[0x2]]=rdoHsb_Hue_Click ; lblHSB_Saturation[OxO9e84[0x2]]=rdoHsb_Saturation_Click ; lblHSB_Brightness[OxO9e84[0x2]]=rdoHsb_Brightness_Click ; lblRGB_Red[OxO9e84[0x2]]=rdoRgb_Red_Click ; lblRGB_Green[OxO9e84[0x2]]=rdoRgb_Green_Click ; lblRGB_Blue[OxO9e84[0x2]]=rdoRgb_Blue_Click ; pnlGradient_Top.focus() ;}  ; function formatString(Ox208){if(!Ox208){return OxO9e84[0x18];} ;for(var i=0x1;i<arguments[OxO9e84[0x19]];i++){ Ox208=Ox208.replace( new RegExp(OxO9e84[0x1a]+(i-0x1)+OxO9e84[0x1b]),arguments[i]) ;} ;return Ox208;}  ; function AddValue(Ox20a,Ox128){ Ox128=Ox128.toLowerCase() ;for(var i=0x0;i<Ox20a[OxO9e84[0x19]];i++){if(Ox20a[i]==Ox128){return ;} ;} ; Ox20a[Ox20a[OxO9e84[0x19]]]=Ox128 ;}  ; function SniffLanguage(Ox65){}  ; function LoadLanguage(){ msg[OxO9e84[0x1c]]=OxO9e84[0x1d] ; msg[OxO9e84[0x1e]]=OxO9e84[0x1f] ; msg[OxO9e84[0x20]]=OxO9e84[0x21] ; msg[OxO9e84[0x22]]=OxO9e84[0x23] ; msg[OxO9e84[0x24]]=OxO9e84[0x25] ; msg[OxO9e84[0x26]]=OxO9e84[0x27] ; msg[OxO9e84[0x28]]=OxO9e84[0x28] ; msg[OxO9e84[0x29]]=OxO9e84[0x2a] ; msg[OxO9e84[0x2b]]=OxO9e84[0x2c] ; msg[OxO9e84[0x2d]]=OxO9e84[0x2e] ; msg[OxO9e84[0x2f]]=OxO9e84[0x30] ; msg[OxO9e84[0x31]]=OxO9e84[0x32] ; msg[OxO9e84[0x33]]=OxO9e84[0x34] ; msg[OxO9e84[0x35]]=OxO9e84[0x36] ; msg[OxO9e84[0x37]]=OxO9e84[0x32] ; msg[OxO9e84[0x38]]=OxO9e84[0x39] ; msg[OxO9e84[0x3a]]=OxO9e84[0x3b] ; msg[OxO9e84[0x3c]]=OxO9e84[0x32] ; msg[OxO9e84[0x3d]]=OxO9e84[0x3e] ; msg[OxO9e84[0x3f]]=OxO9e84[0x40] ; msg[OxO9e84[0x41]]=OxO9e84[0x42] ; msg[OxO9e84[0x43]]=OxO9e84[0x44] ; msg[OxO9e84[0x45]]=OxO9e84[0x39] ; msg[OxO9e84[0x46]]=OxO9e84[0x47] ; msg[OxO9e84[0x48]]=OxO9e84[0x49] ; msg[OxO9e84[0x4a]]=OxO9e84[0x4b] ; msg[OxO9e84[0x27]]=OxO9e84[0x4c] ;}  ; function localize(){}  ; function window_load(){ frm=frmColorPicker ; LoadLanguage() ; localize() ; initialize() ;var hex=OxO9e84[0x4d];if(hex==OxO9e84[0x4d]){ hex=OxO9e84[0x4e] ;} ;if(hex[OxO9e84[0x19]]==0x7){ hex=hex.substr(0x1,0x6) ;} ; frm[OxO9e84[0xd]][OxO9e84[0x4f]]=hex ; Hex_Changed() ; hex=Form_Get_Hex() ; SetBg(pnlOldColor,hex) ; frm[OxO9e84[0x52]][ new Number(GetCookie(OxO9e84[0x51])||0x0)][OxO9e84[0x50]]=true ; ColorMode_Changed() ;var Ox1fd=GetCookie(OxO9e84[0x53])||OxO9e84[0x54];var Ox20f=msg[OxO9e84[0x4a]];for(var i=0x1;i<0x21;i++){if(Ox1fd[OxO9e84[0x19]]/0x6>=i){ hex=Ox1fd.substr((i-0x1)*0x6,0x6) ;var Ox210=HexToRgb(hex);var title=formatString(msg[OxO9e84[0x4a]],hex,Ox210[0x0],Ox210[0x1],Ox210[0x2]); SetBg(document[OxO9e84[0x56]][OxO9e84[0x55]+i],hex) ; SetTitle(document[OxO9e84[0x56]][OxO9e84[0x55]+i],title) ; document[OxO9e84[0x56]][OxO9e84[0x55]+i][OxO9e84[0x2]]=pnlRecent_Click ;} else { document[OxO9e84[0x56]][OxO9e84[0x55]+i][OxO9e84[0x58]][OxO9e84[0x57]]=OxO9e84[0x59] ;} ;} ;}  ; function pnlRecent_Click(){ frm[OxO9e84[0xd]][OxO9e84[0x4f]]=event[OxO9e84[0x5b]][OxO9e84[0x58]][OxO9e84[0x5a]].substr(0x1,0x6).toUpperCase() ; Hex_Changed() ;}  ; function pnlOldClick_Click(){ frm[OxO9e84[0xd]][OxO9e84[0x4f]]=pnlOldColor[OxO9e84[0x58]][OxO9e84[0x5a]].substr(0x1,0x6).toUpperCase() ; Hex_Changed() ;}  ; function rdoHsb_Hue_Click(){ frm[OxO9e84[0xf]][OxO9e84[0x50]]=true ; ColorMode_Changed() ;}  ; function rdoHsb_Saturation_Click(){ frm[OxO9e84[0x10]][OxO9e84[0x50]]=true ; ColorMode_Changed() ;}  ; function rdoHsb_Brightness_Click(){ frm[OxO9e84[0x11]][OxO9e84[0x50]]=true ; ColorMode_Changed() ;}  ; function rdoRgb_Red_Click(){ frm[OxO9e84[0x12]][OxO9e84[0x50]]=true ; ColorMode_Changed() ;}  ; function rdoRgb_Green_Click(){ frm[OxO9e84[0x13]][OxO9e84[0x50]]=true ; ColorMode_Changed() ;}  ; function rdoRgb_Blue_Click(){ frm[OxO9e84[0x14]][OxO9e84[0x50]]=true ; ColorMode_Changed() ;}  ; function Hide(){for(var i=0x0;i<arguments[OxO9e84[0x19]];i++){ arguments[i][OxO9e84[0x58]][OxO9e84[0x5c]]=OxO9e84[0x5d] ;} ;}  ; function Show(){for(var i=0x0;i<arguments[OxO9e84[0x19]];i++){ arguments[i][OxO9e84[0x58]][OxO9e84[0x5c]]=OxO9e84[0x54] ;} ;}  ; function SetValue(){for(var i=0x0;i<arguments[OxO9e84[0x19]];i+=0x2){ arguments[i][OxO9e84[0x4f]]=arguments[i+0x1] ;} ;}  ; function SetTitle(){for(var i=0x0;i<arguments[OxO9e84[0x19]];i+=0x2){ arguments[i][OxO9e84[0x5e]]=arguments[i+0x1] ;} ;}  ; function SetHTML(){for(var i=0x0;i<arguments[OxO9e84[0x19]];i+=0x2){ arguments[i][OxO9e84[0x5f]]=arguments[i+0x1] ;} ;}  ; function SetBg(){for(var i=0x0;i<arguments[OxO9e84[0x19]];i+=0x2){ arguments[i][OxO9e84[0x58]][OxO9e84[0x5a]]=OxO9e84[0x49]+arguments[i+0x1] ;} ;}  ; function SetBgPosition(){for(var i=0x0;i<arguments[OxO9e84[0x19]];i+=0x3){ arguments[i][OxO9e84[0x58]][OxO9e84[0x60]]=arguments[i+0x1]+OxO9e84[0x61]+arguments[i+0x2]+OxO9e84[0x62] ;} ;}  ; function ColorMode_Changed(){for(var i=0x0;i<0x6;i++){if(frm[OxO9e84[0x52]][i][OxO9e84[0x50]]){ ColorMode=i ;} ;} ; SetCookie(OxO9e84[0x51],ColorMode,0x3c*0x3c*0x18*0x16d) ; Hide(pnlGradientHsbHue_Hue,pnlGradientHsbHue_Black,pnlGradientHsbHue_White,pnlVerticalHsbHue_Background,pnlVerticalHsbSaturation_Hue,pnlVerticalHsbSaturation_White,pnlVerticalHsbBrightness_Hue,pnlVerticalHsbBrightness_Black,pnlVerticalRgb_Start,pnlVerticalRgb_End,pnlGradientRgb_Base,pnlGradientRgb_Invert,pnlGradientRgb_Overlay1,pnlGradientRgb_Overlay2) ;switch(ColorMode){case 0x0: Show(pnlGradientHsbHue_Hue,pnlGradientHsbHue_Black,pnlGradientHsbHue_White,pnlVerticalHsbHue_Background) ; Hsb_Changed() ;break ;case 0x1: Show(pnlVerticalHsbSaturation_Hue,pnlVerticalHsbSaturation_White,pnlGradientRgb_Base,pnlGradientRgb_Overlay1,pnlGradientRgb_Overlay2) ; SetBgPosition(pnlGradientRgb_Base,0x0,0x0) ; SetBg(pnlGradientRgb_Overlay1,OxO9e84[0x4e],pnlGradientRgb_Overlay2,OxO9e84[0x63]) ; pnlGradientRgb_Overlay1[OxO9e84[0x58]][OxO9e84[0x64]]=0x5 ; pnlGradientRgb_Overlay2[OxO9e84[0x58]][OxO9e84[0x64]]=0x6 ; Hsb_Changed() ;break ;case 0x2: Show(pnlVerticalHsbBrightness_Hue,pnlVerticalHsbBrightness_Black,pnlGradientRgb_Base,pnlGradientRgb_Overlay1,pnlGradientRgb_Overlay2) ; SetBgPosition(pnlGradientRgb_Base,0x0,0x0) ; SetBg(pnlGradientRgb_Overlay1,OxO9e84[0x63],pnlGradientRgb_Overlay2,OxO9e84[0x4e]) ; pnlGradientRgb_Overlay1[OxO9e84[0x58]][OxO9e84[0x64]]=0x6 ; pnlGradientRgb_Overlay2[OxO9e84[0x58]][OxO9e84[0x64]]=0x5 ; Hsb_Changed() ;break ;case 0x3: Show(pnlVerticalRgb_Start,pnlVerticalRgb_End,pnlGradientRgb_Base,pnlGradientRgb_Invert) ; SetBgPosition(pnlGradientRgb_Base,0x100,0x0,pnlGradientRgb_Invert,0x100,0x0) ; Rgb_Changed() ;break ;case 0x4: Show(pnlVerticalRgb_Start,pnlVerticalRgb_End,pnlGradientRgb_Base,pnlGradientRgb_Invert) ; SetBgPosition(pnlGradientRgb_Base,0x0,0x100,pnlGradientRgb_Invert,0x0,0x100) ; Rgb_Changed() ;break ;case 0x5: Show(pnlVerticalRgb_Start,pnlVerticalRgb_End,pnlGradientRgb_Base,pnlGradientRgb_Invert) ; SetBgPosition(pnlGradientRgb_Base,0x100,0x100,pnlGradientRgb_Invert,0x100,0x100) ; Rgb_Changed() ;break ;default:break ;;;;;;;;} ;}  ; function btnWebSafeColor_Click(){var Ox210=HexToRgb(frm[OxO9e84[0xd]].value); Ox210=RgbToWebSafeRgb(Ox210) ; frm[OxO9e84[0xd]][OxO9e84[0x4f]]=RgbToHex(Ox210) ; Hex_Changed() ;}  ; function checkWebSafe(){var Ox210=Form_Get_Rgb();if(RgbIsWebSafe(Ox210)){ Hide(frm.btnWebSafeColor,pnlWebSafeColor,pnlWebSafeColorBorder) ;} else { Ox210=RgbToWebSafeRgb(Ox210) ; SetBg(pnlWebSafeColor,RgbToHex(Ox210)) ; Show(frm.btnWebSafeColor,pnlWebSafeColor,pnlWebSafeColorBorder) ;} ;}  ; function validateNumber(){var Ox225=String.fromCharCode(event.keyCode);if(IgnoreKey()){return ;} ;if(OxO9e84[0x65].indexOf(Ox225)!=-0x1){return ;} ; event[OxO9e84[0x66]]=0x0 ;}  ; function validateHex(){if(IgnoreKey()){return ;} ;var Ox225=String.fromCharCode(event.keyCode);if(OxO9e84[0x67].indexOf(Ox225)!=-0x1){ event[OxO9e84[0x66]]=Ox225.toUpperCase().charCodeAt(0x0) ;return ;} ;if(OxO9e84[0x68].indexOf(Ox225)!=-0x1){return ;} ; event[OxO9e84[0x66]]=0x0 ;}  ; function IgnoreKey(){var Ox225=String.fromCharCode(event.keyCode);var Ox228= new Array(0x0,0x8,0x9,0xd,0x1b);if(Ox225==null){return true;} ;for(var i=0x0;i<0x5;i++){if(event[OxO9e84[0x66]]==Ox228[i]){return true;} ;} ;return false;}  ; function btnCancel_Click(){ top.close() ;}  ; function btnOK_Click(){var hex= new String(frm[OxO9e84[0xd]].value);try{ window[OxO9e84[0x69]]=hex ;} catch(e){} ; recent=GetCookie(OxO9e84[0x53])||OxO9e84[0x54] ;for(var i=0x0;i<recent[OxO9e84[0x19]];i+=0x6){if(recent.substr(i,0x6)==hex){ recent=recent.substr(0x0,i)+recent.substr(i+0x6) ; i-=0x6 ;} ;} ;if(recent[OxO9e84[0x19]]>0x1f*0x6){ recent=recent.substr(0x0,0x1f*0x6) ;} ; recent=frm[OxO9e84[0xd]][OxO9e84[0x4f]]+recent ; SetCookie(OxO9e84[0x53],recent,0x3c*0x3c*0x18*0x16d) ; top.close() ;}  ; function SetGradientPosition(x,y){ x=x-POSITIONADJUSTX+0x5 ; y=y-POSITIONADJUSTY+0x5 ; x-=0x7 ; y-=0x1b ; x=x<0x0?0x0:x>0xff?0xff:x ; y=y<0x0?0x0:y>0xff?0xff:y ; SetBgPosition(pnlGradientPosition,x-0x5,y-0x5) ;switch(ColorMode){case 0x0:var Ox22c= new Array(0x0,0x0,0x0); Ox22c[0x1]=x/0xff ; Ox22c[0x2]=0x1-(y/0xff) ; frm[OxO9e84[0x8]][OxO9e84[0x4f]]=Math.round(Ox22c[0x1]*0x64) ; frm[OxO9e84[0x9]][OxO9e84[0x4f]]=Math.round(Ox22c[0x2]*0x64) ; Hsb_Changed() ;break ;case 0x1:var Ox22c= new Array(0x0,0x0,0x0); Ox22c[0x0]=x/0xff ; Ox22c[0x2]=0x1-(y/0xff) ; frm[OxO9e84[0x6]][OxO9e84[0x4f]]=Ox22c[0x0]==0x1?0x0:Math.round(Ox22c[0x0]*0x168) ; frm[OxO9e84[0x9]][OxO9e84[0x4f]]=Math.round(Ox22c[0x2]*0x64) ; Hsb_Changed() ;break ;case 0x2:var Ox22c= new Array(0x0,0x0,0x0); Ox22c[0x0]=x/0xff ; Ox22c[0x1]=0x1-(y/0xff) ; frm[OxO9e84[0x6]][OxO9e84[0x4f]]=Ox22c[0x0]==0x1?0x0:Math.round(Ox22c[0x0]*0x168) ; frm[OxO9e84[0x8]][OxO9e84[0x4f]]=Math.round(Ox22c[0x1]*0x64) ; Hsb_Changed() ;break ;case 0x3:var Ox210= new Array(0x0,0x0,0x0); Ox210[0x1]=0xff-y ; Ox210[0x2]=x ; frm[OxO9e84[0xb]][OxO9e84[0x4f]]=Ox210[0x1] ; frm[OxO9e84[0xc]][OxO9e84[0x4f]]=Ox210[0x2] ; Rgb_Changed() ;break ;case 0x4:var Ox210= new Array(0x0,0x0,0x0); Ox210[0x0]=0xff-y ; Ox210[0x2]=x ; frm[OxO9e84[0xa]][OxO9e84[0x4f]]=Ox210[0x0] ; frm[OxO9e84[0xc]][OxO9e84[0x4f]]=Ox210[0x2] ; Rgb_Changed() ;break ;case 0x5:var Ox210= new Array(0x0,0x0,0x0); Ox210[0x0]=x ; Ox210[0x1]=0xff-y ; frm[OxO9e84[0xa]][OxO9e84[0x4f]]=Ox210[0x0] ; frm[OxO9e84[0xb]][OxO9e84[0x4f]]=Ox210[0x1] ; Rgb_Changed() ;break ;;;;;;;} ;}  ; function Hex_Changed(){var hex=Form_Get_Hex();var Ox210=HexToRgb(hex);var Ox22c=RgbToHsb(Ox210); Form_Set_Rgb(Ox210) ; Form_Set_Hsb(Ox22c) ; SetBg(pnlNewColor,hex) ; SetupCursors() ; SetupGradients() ; checkWebSafe() ;}  ; function Rgb_Changed(){var Ox210=Form_Get_Rgb();var Ox22c=RgbToHsb(Ox210);var hex=RgbToHex(Ox210); Form_Set_Hsb(Ox22c) ; Form_Set_Hex(hex) ; SetBg(pnlNewColor,hex) ; SetupCursors() ; SetupGradients() ; checkWebSafe() ;}  ; function Hsb_Changed(){var Ox22c=Form_Get_Hsb();var Ox210=HsbToRgb(Ox22c);var hex=RgbToHex(Ox210); Form_Set_Rgb(Ox210) ; Form_Set_Hex(hex) ; SetBg(pnlNewColor,hex) ; SetupCursors() ; SetupGradients() ; checkWebSafe() ;}  ; function Form_Set_Hex(hex){ frm[OxO9e84[0xd]][OxO9e84[0x4f]]=hex ;}  ; function Form_Get_Hex(){var hex= new String(frm[OxO9e84[0xd]].value);for(var i=0x0;i<hex[OxO9e84[0x19]];i++){if(OxO9e84[0x6a].indexOf(hex.substr(i,0x1))==-0x1){ hex=OxO9e84[0x63] ; frm[OxO9e84[0xd]][OxO9e84[0x4f]]=hex ; alert(formatString(msg.BadNumber,OxO9e84[0x63],OxO9e84[0x4e])) ;break ;} ;} ;while(hex[OxO9e84[0x19]]<0x6){ hex=OxO9e84[0x6b]+hex ;} ;return hex;}  ; function Form_Get_Hsb(){var Ox22c= new Array(0x0,0x0,0x0); Ox22c[0x0]= new Number(frm[OxO9e84[0x6]].value)/0x168 ; Ox22c[0x1]= new Number(frm[OxO9e84[0x8]].value)/0x64 ; Ox22c[0x2]= new Number(frm[OxO9e84[0x9]].value)/0x64 ;if(Ox22c[0x0]>0x1||isNaN(Ox22c[0x0])){ Ox22c[0x0]=0x1 ; frm[OxO9e84[0x6]][OxO9e84[0x4f]]=0x168 ; alert(formatString(msg.BadNumber,0x0,0x168)) ;} ;if(Ox22c[0x1]>0x1||isNaN(Ox22c[0x1])){ Ox22c[0x1]=0x1 ; frm[OxO9e84[0x8]][OxO9e84[0x4f]]=0x64 ; alert(formatString(msg.BadNumber,0x0,0x64)) ;} ;if(Ox22c[0x2]>0x1||isNaN(Ox22c[0x2])){ Ox22c[0x2]=0x1 ; frm[OxO9e84[0x9]][OxO9e84[0x4f]]=0x64 ; alert(formatString(msg.BadNumber,0x0,0x64)) ;} ;return Ox22c;}  ; function Form_Set_Hsb(Ox22c){ SetValue(frm[OxO9e84[0x6]],Math.round(Ox22c[0x0]*0x168),frm[OxO9e84[0x8]],Math.round(Ox22c[0x1]*0x64),frm[OxO9e84[0x9]],Math.round(Ox22c[0x2]*0x64)) ;}  ; function Form_Get_Rgb(){var Ox210= new Array(0x0,0x0,0x0); Ox210[0x0]= new Number(frm[OxO9e84[0xa]].value) ; Ox210[0x1]= new Number(frm[OxO9e84[0xb]].value) ; Ox210[0x2]= new Number(frm[OxO9e84[0xc]].value) ;if(Ox210[0x0]>0xff||isNaN(Ox210[0x0])||Ox210[0x0]!=Math.round(Ox210[0x0])){ Ox210[0x0]=0xff ; frm[OxO9e84[0xa]][OxO9e84[0x4f]]=0xff ; alert(formatString(msg.BadNumber,0x0,0xff)) ;} ;if(Ox210[0x1]>0xff||isNaN(Ox210[0x1])||Ox210[0x1]!=Math.round(Ox210[0x1])){ Ox210[0x1]=0xff ; frm[OxO9e84[0xb]][OxO9e84[0x4f]]=0xff ; alert(formatString(msg.BadNumber,0x0,0xff)) ;} ;if(Ox210[0x2]>0xff||isNaN(Ox210[0x2])||Ox210[0x2]!=Math.round(Ox210[0x2])){ Ox210[0x2]=0xff ; frm[OxO9e84[0xc]][OxO9e84[0x4f]]=0xff ; alert(formatString(msg.BadNumber,0x0,0xff)) ;} ;return Ox210;}  ; function Form_Set_Rgb(Ox210){ frm[OxO9e84[0xa]][OxO9e84[0x4f]]=Ox210[0x0] ; frm[OxO9e84[0xb]][OxO9e84[0x4f]]=Ox210[0x1] ; frm[OxO9e84[0xc]][OxO9e84[0x4f]]=Ox210[0x2] ;}  ; function SetupCursors(){var Ox22c=Form_Get_Hsb();var Ox210=Form_Get_Rgb();if(RgbToYuv(Ox210)[0x0]>=0.5){ SetGradientPositionDark() ;} else { SetGradientPositionLight() ;} ;if(event[OxO9e84[0x5b]]!=null){if(event[OxO9e84[0x5b]][OxO9e84[0x6c]]==OxO9e84[0x6d]){return ;} ;if(event[OxO9e84[0x5b]][OxO9e84[0x6c]]==OxO9e84[0x6e]){return ;} ;} ;var x;var y;var z;if(ColorMode>=0x0&&ColorMode<=0x2){for(var i=0x0;i<0x3;i++){ Ox22c[i]*=0xff ;} ;} ;switch(ColorMode){case 0x0: x=Ox22c[0x1] ; y=Ox22c[0x2] ; z=Ox22c[0x0]==0x0?0x1:Ox22c[0x0] ;break ;case 0x1: x=Ox22c[0x0]==0x0?0x1:Ox22c[0x0] ; y=Ox22c[0x2] ; z=Ox22c[0x1] ;break ;case 0x2: x=Ox22c[0x0]==0x0?0x1:Ox22c[0x0] ; y=Ox22c[0x1] ; z=Ox22c[0x2] ;break ;case 0x3: x=Ox210[0x2] ; y=Ox210[0x1] ; z=Ox210[0x0] ;break ;case 0x4: x=Ox210[0x2] ; y=Ox210[0x0] ; z=Ox210[0x1] ;break ;case 0x5: x=Ox210[0x0] ; y=Ox210[0x1] ; z=Ox210[0x2] ;break ;;;;;;;} ; y=0xff-y ; z=0xff-z ; SetBgPosition(pnlGradientPosition,x-0x5,y-0x5) ; pnlVerticalPosition[OxO9e84[0x58]][OxO9e84[0x6f]]=(z+0x1b)+OxO9e84[0x62] ;}  ; function SetupGradients(){var Ox22c=Form_Get_Hsb();var Ox210=Form_Get_Rgb();switch(ColorMode){case 0x0: SetBg(pnlGradientHsbHue_Hue,RgbToHex(HueToRgb(Ox22c[0x0]))) ;break ;case 0x1:var Ox60= new Array();for(var i=0x0;i<0x3;i++){ Ox60[i]=Math.round(Ox22c[0x2]*0xff) ;} ; SetBg(pnlGradientHsbHue_Hue,RgbToHex(HueToRgb(Ox22c[0x0])),pnlVerticalHsbSaturation_Hue,RgbToHex(HsbToRgb( new Array(Ox22c[0x0],0x1,Ox22c[0x2]))),pnlVerticalHsbSaturation_White,RgbToHex(Ox60)) ; pnlGradientRgb_Overlay1[OxO9e84[0x71]][0x0][OxO9e84[0x70]]=(0x64-Math.round(Ox22c[0x1]*0x64)) ;break ;case 0x2: SetBg(pnlVerticalHsbBrightness_Hue,RgbToHex(HsbToRgb( new Array(Ox22c[0x0],Ox22c[0x1],0x1)))) ; pnlGradientRgb_Overlay1[OxO9e84[0x71]][0x0][OxO9e84[0x70]]=(0x64-Math.round(Ox22c[0x2]*0x64)) ;break ;case 0x3: pnlGradientRgb_Invert[OxO9e84[0x71]][0x3][OxO9e84[0x70]]=0x64-Math.round((Ox210[0x0]/0xff)*0x64) ; SetBg(pnlVerticalRgb_Start,RgbToHex( new Array(0xff,Ox210[0x1],Ox210[0x2])),pnlVerticalRgb_End,RgbToHex( new Array(0x0,Ox210[0x1],Ox210[0x2]))) ;break ;case 0x4: pnlGradientRgb_Invert[OxO9e84[0x71]][0x3][OxO9e84[0x70]]=0x64-Math.round((Ox210[0x1]/0xff)*0x64) ; SetBg(pnlVerticalRgb_Start,RgbToHex( new Array(Ox210[0x0],0xff,Ox210[0x2])),pnlVerticalRgb_End,RgbToHex( new Array(Ox210[0x0],0x0,Ox210[0x2]))) ;break ;case 0x5: pnlGradientRgb_Invert[OxO9e84[0x71]][0x3][OxO9e84[0x70]]=0x64-Math.round((Ox210[0x2]/0xff)*0x64) ; SetBg(pnlVerticalRgb_Start,RgbToHex( new Array(Ox210[0x0],Ox210[0x1],0xff)),pnlVerticalRgb_End,RgbToHex( new Array(Ox210[0x0],Ox210[0x1],0x0))) ;break ;default:;;;;;;;} ;}  ; function SetGradientPositionDark(){if(GradientPositionDark){return ;} ; GradientPositionDark=true ; pnlGradientPosition[OxO9e84[0x58]][OxO9e84[0x72]]=OxO9e84[0x73] ;}  ; function SetGradientPositionLight(){if(!GradientPositionDark){return ;} ; GradientPositionDark=false ; pnlGradientPosition[OxO9e84[0x58]][OxO9e84[0x72]]=OxO9e84[0x74] ;}  ; function pnlGradient_Top_Click(){ event[OxO9e84[0x75]]=true ; SetGradientPosition(event[OxO9e84[0x77]]-0x5,event[OxO9e84[0x76]]-0x5) ; pnlGradient_Top[OxO9e84[0x78]]=OxO9e84[0x79] ;}  ; function pnlGradient_Top_MouseMove(){ event[OxO9e84[0x75]]=true ;if(event[OxO9e84[0x7a]]!=0x1){return ;} ; SetGradientPosition(event[OxO9e84[0x77]]-0x5,event[OxO9e84[0x76]]-0x5) ;}  ; function pnlGradient_Top_MouseDown(){ event[OxO9e84[0x75]]=true ; SetGradientPosition(event[OxO9e84[0x77]]-0x5,event[OxO9e84[0x76]]-0x5) ; pnlGradient_Top[OxO9e84[0x78]]=OxO9e84[0x7b] ;}  ; function pnlGradient_Top_MouseUp(){ event[OxO9e84[0x75]]=true ; SetGradientPosition(event[OxO9e84[0x77]]-0x5,event[OxO9e84[0x76]]-0x5) ; pnlGradient_Top[OxO9e84[0x78]]=OxO9e84[0x79] ;}  ; function Document_MouseUp(){ event[OxO9e84[0x75]]=true ; pnlGradient_Top[OxO9e84[0x78]]=OxO9e84[0x79] ;}  ; function SetVerticalPosition(z){var z=z-POSITIONADJUSTZ;if(z<0x1b){ z=0x1b ;} ;if(z>0x11a){ z=0x11a ;} ; pnlVerticalPosition[OxO9e84[0x58]][OxO9e84[0x6f]]=z+OxO9e84[0x62] ; z=0x1-((z-0x1b)/0xff) ;switch(ColorMode){case 0x0:if(z==0x1){ z=0x0 ;} ; frm[OxO9e84[0x6]][OxO9e84[0x4f]]=Math.round(z*0x168) ; Hsb_Changed() ;break ;case 0x1: frm[OxO9e84[0x8]][OxO9e84[0x4f]]=Math.round(z*0x64) ; Hsb_Changed() ;break ;case 0x2: frm[OxO9e84[0x9]][OxO9e84[0x4f]]=Math.round(z*0x64) ; Hsb_Changed() ;break ;case 0x3: frm[OxO9e84[0xa]][OxO9e84[0x4f]]=Math.round(z*0xff) ; Rgb_Changed() ;break ;case 0x4: frm[OxO9e84[0xb]][OxO9e84[0x4f]]=Math.round(z*0xff) ; Rgb_Changed() ;break ;case 0x5: frm[OxO9e84[0xc]][OxO9e84[0x4f]]=Math.round(z*0xff) ; Rgb_Changed() ;break ;;;;;;;} ;}  ; function pnlVertical_Top_Click(){ SetVerticalPosition(event[OxO9e84[0x76]]-0x5) ; event[OxO9e84[0x75]]=true ;}  ; function pnlVertical_Top_MouseMove(){if(event[OxO9e84[0x7a]]!=0x1){return ;} ; SetVerticalPosition(event[OxO9e84[0x76]]-0x5) ; event[OxO9e84[0x75]]=true ;}  ; function pnlVertical_Top_MouseDown(){ SetVerticalPosition(event[OxO9e84[0x76]]-0x5) ; event[OxO9e84[0x75]]=true ;}  ; function pnlVertical_Top_MouseUp(){ SetVerticalPosition(event[OxO9e84[0x76]]-0x5) ; event[OxO9e84[0x75]]=true ;}  ; function SetCookie(name,Ox128,Ox129){var Ox12a=name+OxO9e84[0x7c]+escape(Ox128)+OxO9e84[0x7d];if(Ox129){var Ox12b= new Date(); Ox12b.setSeconds(Ox12b.getSeconds()+Ox129) ; Ox12a+=OxO9e84[0x7e]+Ox12b.toUTCString()+OxO9e84[0x7f] ;} ; document[OxO9e84[0x80]]=Ox12a ;}  ; function GetCookie(name){var Ox12d=document[OxO9e84[0x80]].split(OxO9e84[0x7f]);for(var i=0x0;i<Ox12d[OxO9e84[0x19]];i++){var Ox12e=Ox12d[i].split(OxO9e84[0x7c]);if(name==Ox12e[0x0].replace(/\s/g,OxO9e84[0x54])){return unescape(Ox12e[0x1]);} ;} ;}  ; function GetCookieDictionary(){var Ox130={};var Ox12d=document[OxO9e84[0x80]].split(OxO9e84[0x7f]);for(var i=0x0;i<Ox12d[OxO9e84[0x19]];i++){var Ox12e=Ox12d[i].split(OxO9e84[0x7c]); Ox130[Ox12e[0x0].replace(/\s/g,OxO9e84[0x54])]=unescape(Ox12e[0x1]) ;} ;return Ox130;}  ; function RgbIsWebSafe(Ox210){var hex=RgbToHex(Ox210);for(var i=0x0;i<0x3;i++){if(OxO9e84[0x81].indexOf(hex.substr(i*0x2,0x2))==-0x1){return false;} ;} ;return true;}  ; function RgbToWebSafeRgb(Ox210){var Ox246= new Array(Ox210[0x0],Ox210[0x1],Ox210[0x2]);if(RgbIsWebSafe(Ox210)){return Ox246;} ;var Ox247= new Array(0x0,0x33,0x66,0x99,0xcc,0xff);for(var i=0x0;i<0x3;i++){for(var j=0x1;j<0x6;j++){if(Ox246[i]>Ox247[j-0x1]&&Ox246[i]<Ox247[j]){if(Ox246[i]-Ox247[j-0x1]>Ox247[j]-Ox246[i]){ Ox246[i]=Ox247[j] ;} else { Ox246[i]=Ox247[j-0x1] ;} ;break ;} ;} ;} ;return Ox246;}  ; function RgbToYuv(Ox210){var Ox249= new Array(); Ox249[0x0]=(Ox210[0x0]*0.299+Ox210[0x1]*0.587+Ox210[0x2]*0.114)/0xff ; Ox249[0x1]=(Ox210[0x0]*-0.169+Ox210[0x1]*-0.332+Ox210[0x2]*0.5+0x80)/0xff ; Ox249[0x2]=(Ox210[0x0]*0.5+Ox210[0x1]*-0.419+Ox210[0x2]*-0.0813+0x80)/0xff ;return Ox249;}  ; function RgbToHsb(Ox210){var Ox24b= new Array(Ox210[0x0],Ox210[0x1],Ox210[0x2]);var Ox24c= new Number(0x1);var Ox24d= new Number(0x0);var Ox24e= new Number(0x1);var Ox22c= new Array(0x0,0x0,0x0);var Ox24f= new Array();for(var i=0x0;i<0x3;i++){ Ox24b[i]=Ox210[i]/0xff ;if(Ox24b[i]<Ox24c){ Ox24c=Ox24b[i] ;} ;if(Ox24b[i]>Ox24d){ Ox24d=Ox24b[i] ;} ;} ; Ox24e=Ox24d-Ox24c ; Ox22c[0x2]=Ox24d ;if(Ox24e==0x0){return Ox22c;} ; Ox22c[0x1]=Ox24e/Ox24d ;for(var i=0x0;i<0x3;i++){ Ox24f[i]=(((Ox24d-Ox24b[i])/0x6)+(Ox24e/0x2))/Ox24e ;} ;if(Ox24b[0x0]==Ox24d){ Ox22c[0x0]=Ox24f[0x2]-Ox24f[0x1] ;} else {if(Ox24b[0x1]==Ox24d){ Ox22c[0x0]=(0x1/0x3)+Ox24f[0x0]-Ox24f[0x2] ;} else {if(Ox24b[0x2]==Ox24d){ Ox22c[0x0]=(0x2/0x3)+Ox24f[0x1]-Ox24f[0x0] ;} ;} ;} ;if(Ox22c[0x0]<0x0){ Ox22c[0x0]+=0x1 ;} else {if(Ox22c[0x0]>0x1){ Ox22c[0x0]-=0x1 ;} ;} ;return Ox22c;}  ; function HsbToRgb(Ox22c){var Ox210=HueToRgb(Ox22c[0x0]);var Ox106=Ox22c[0x2]*0xff;for(var i=0x0;i<0x3;i++){ Ox210[i]=Ox210[i]*Ox22c[0x2] ; Ox210[i]=((Ox210[i]-Ox106)*Ox22c[0x1])+Ox106 ; Ox210[i]=Math.round(Ox210[i]) ;} ;return Ox210;}  ; function RgbToHex(Ox210){var hex= new String();for(var i=0x0;i<0x3;i++){ Ox210[0x2-i]=Math.round(Ox210[0x2-i]) ; hex=Ox210[0x2-i].toString(0x10)+hex ;if(hex[OxO9e84[0x19]]%0x2==0x1){ hex=OxO9e84[0x6b]+hex ;} ;} ;return hex.toUpperCase();}  ; function HexToRgb(hex){var Ox210= new Array();for(var i=0x0;i<0x3;i++){ Ox210[i]= new Number(OxO9e84[0x82]+hex.substr(i*0x2,0x2)) ;} ;return Ox210;}  ; function HueToRgb(Ox254){var Ox255=Ox254*0x168;var Ox210= new Array(0x0,0x0,0x0);var Ox256=(Ox255%0x3c)/0x3c;if(Ox255<0x3c){ Ox210[0x0]=0xff ; Ox210[0x1]=Ox256*0xff ;} else {if(Ox255<0x78){ Ox210[0x1]=0xff ; Ox210[0x0]=(0x1-Ox256)*0xff ;} else {if(Ox255<0xb4){ Ox210[0x1]=0xff ; Ox210[0x2]=Ox256*0xff ;} else {if(Ox255<0xf0){ Ox210[0x2]=0xff ; Ox210[0x1]=(0x1-Ox256)*0xff ;} else {if(Ox255<0x12c){ Ox210[0x2]=0xff ; Ox210[0x0]=Ox256*0xff ;} else {if(Ox255<0x168){ Ox210[0x0]=0xff ; Ox210[0x2]=(0x1-Ox256)*0xff ;} ;} ;} ;} ;} ;} ;return Ox210;}  ; function CheckHexSelect(){if(window[OxO9e84[0x84]]&&window[OxO9e84[0x83]]&&frm[OxO9e84[0xd]]){var Oxe4=OxO9e84[0x49]+frm[OxO9e84[0xd]][OxO9e84[0x4f]];if(Oxe4[OxO9e84[0x19]]==0x7){if(window[OxO9e84[0x85]]!=Oxe4){ window[OxO9e84[0x85]]=Oxe4 ; window.do_select(Oxe4) ;} ;} ;} ;}  ; setInterval(CheckHexSelect,0xa) ;