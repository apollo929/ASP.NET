///////// JS theme file for FlatCalendarXP 9.0 /////////
// This file is totally configurable. You may remove all the comments in this file to minimize the download size.
// Since the plugins are loaded after theme config, sometimes we would redefine(override) some theme options there for convenience.
////////////////////////////////////////////////////////

var gMonths=["January","February","March","April","May","June","July","August","September","October","November","December"];
var gWeekDay=["Sun","Mon","Tue","Wed","Thu","Fri","Sat"];	// weekday caption from Sunday to Saturday

var gBegin=[1980,1,1];	// calendar date range begin from [Year,Month,Date]. Using gToday here will make it start from today.
var gEnd=[2030,12,31];	// calendar date range end at [Year,Month,Date]
var gsOutOfRange="Sorry, you may not go beyond the designated range!";	// out-of-date-range error message. If set to "", no alerts will popup on such error.
var guOutOfRange=null;	// the background image url for the out-range dates. e.g. "outrange.gif"

var giFirstDOW=0;	// indicates the first day of week. 0:Sunday; 1-6:Monday-Saturday.

var gcCalBG="#F8DEB5";	// the background color of the outer calendar panel.
var guCalBG=null;	//  the background image url for the inner table.
var gcCalFrame="#F8DEB5";	// the background color of the inner table, showing as a frame.
var gsInnerTable="border=0 cellpadding=1 cellspacing=1";	// HTML tag properties of the inner <table> tag, which holds all the calendar cells.
var gsOuterTable="border=0 cellpadding=0 cellspacing=0";	// HTML tag properties of the outmost container <table> tag, which holds the top, middle and bottom sections.

var gbHideTop=false;	// true: hide the top section; false: show it according to the following settings
var giDCStyle=2;	// the style of month-controls in top section.	0: use predefined html dropdowns & gsNavPrev/Next; 1: use gsCalTitle & gsNavPrev/Next; 2: use only gsCalTitle;
var gsCalTitle="gMonths[gCurMonth[1]-1]+'&nbsp;&nbsp;&nbsp;'+gCurMonth[0]";	// dynamic statement to be eval()'ed as the title when giDCStyle>0.
var gbDCSeq=true;	// (effective only when giDCStyle is 0) true: show month box before year box; false: vice-versa;
var gsYearInBox="i";	// dynamic statement to be eval()'ed as the text shown in the year box. e.g. "'A.D.'+i" will show "A.D.2001"
var gsNavPrev="<INPUT type='button' value='&lt;' class='MonthNav' onclick='fPrevMonth(event);this.blur();'>";	// the content of the left month navigator
var gsNavNext="<INPUT type='button' value='&gt;' class='MonthNav' onclick='fNextMonth(event);this.blur();'>";	// the content of the right month navigator

var gbHideBottom=true;	// true: hide the bottom section; false: show it with gsBottom.
var gsBottom="<img src='todaysmall.gif' border=0> <A href='javascript:void(0)' class='BottomAnchor' onclick='if(this.blur)this.blur();if(!fSetDate(gToday[0],gToday[1],gToday[2]))alert(\"You cannot select today!\");return false;' onmouseover='return true;' >Today : "+gMonths[gToday[1]-1]+" "+gToday[2]+", "+gToday[0]+"</A>";	// the content of the bottom section.

var giCellWidth=NN4?68:-1;	// calendar cell width; if set to -1, it'll be auto-adjusted so as to ensure the width of the entire calendar fits in with the calendar's direct parent tag. NN4 doesn't support -1.
var giCellHeight=60;	// calendar cell height;
var giHeadHeight=16;	// calendar head row height;
var giWeekWidth=22;	// calendar week-number-column width;
var giHeadTop=0;	// calendar head row top offset;
var giWeekTop=0;	// calendar week-number-column top offset;

var gcCellBG="white";	// default background color of the cells. Use "" for transparent!!!
var gsCellHTML="";	// default HTML contents for days without any agenda, usually an image tag.
var guCellBGImg="";	// url of default background image for each calendar cell.
var gsAction="";	// default action to be eval()'ed on everyday unless agenda overrides it. null value will result a disabled date and any non-empty string will result a hovering hand cursor.
var gsDays="dayNo";	// the dynamic statement to be eval()'ed into each day cell.

var giWeekCol=-1;	// -1: disable week-number-column;  0~7: show week numbers at the designated column.
var gsWeekHead="#";	// the text shown in the table head of week-number-column.
var gsWeeks="weekNo";	// the dynamic statement to be eval()'ed into the week-number-column. e.g. "'week '+weekNo" will show "week 1", "week 2" ...

var gcWorkday="#773D08";	// Workday font color
var gcSat="#773D08";	// Saturday font color
var gcSatBG=null;	// Saturday background color
var gcSun="#773D08";	// Sunday font color
var gcSunBG=null;	// Sunday background color

var gcOtherDay="silver";	// the font color of days in other months; It's of no use when giShowOther is set to hide.
var gcOtherDayBG=gcCellBG;	// the background color of days in other months. when giShowOther set to hiding, it'll substitute the gcOtherDay.
var giShowOther=1+2;	// control the look of days in OTHER months. 1: show date & agendas effects; 2: show selected & today effects; 4: hide days in previous month; 8: hide days in next month; 16: when set with 4 and/or 8, the days will be visible but not selectable.  NOTE: values can be added up to create mixed effects.

var gbFocus=false;	// whether to enable the gcToggle highlight whenever mouse pointer focuses over a calendar cell.
var gcToggle="#C47F10";	// the highlight color for the focused cell

var gcFGToday="#990000";	// the font color for today 
var gcBGToday="";	// the background color for today 
var guTodayBGImg="";	// url of image as today's background
var giMarkToday=4+8; // Effects for today - 0: nothing; 1: set background color with gcBGToday; 2: draw a box with gcBGToday; 4: bold the font; 8: set font color with gcFGToday; 16: set background image with guTodayBGImg; - they can be added up to create mixed effects.
var gsTodayTip="Today";	// tooltip for today

var gcFGSelected="black";	// the font color for the selected date
var gcBGSelected=gcToggle;	// the background color for the selected date
var guSelectedBGImg="";	// url of image as background of the selected date
var giMarkSelected=2;	// Effects for selected date - 0: nothing; 1: set background color with gcBGSelected; 2: draw a box with gcBGSelected; 4: bold the font; 8: set font color with gcFGSelected; 16: set background image with guSelectedBGImg; - they can be added up to create mixed effects.
var gsSelectedTip="";	// tooltip for selected dates

var gbBoldAgenda=false;	// whether to boldface the dates with agendas.
var gbInvertBold=false;	// true: invert the boldface effect set by gbBoldAgenda; false: no inverts.
var gbShrink2fit=true;	// whether to hide the week line if none of its day belongs to the current month.
var gdSelect=[0,0,0];	// default selected date in format of [year, month, day]; [0,0,0] means no default date selected.
var giFreeDiv=0;	// The number of absolutely positioned layers you want to customize, they will be named as "freeDiv0", "freeDiv1"...
var gAgendaMask=[-1,-1,-1,-1,-1,-1,-1];	// [message, action, bgcolor, fgcolor, bgimg, boxit, html] - Set the relevant bit to -1 to keep the original agenda/event value of that bit intact. Any other value will be used to override the original one defined in agenda.js. Check the tutorial for details.

var giResizeDelay=KO3?150:50;	// delay in milliseconds before resizing the calendar panel. Calendar may have incorrect initial size if this value is too small.
var gbFlatBorder=false;	// flat the .CalCell css border of any agenda date by setting it to solid style. NOTE: it should always be set to false if .CalCell has no explicit border size.
var gbInvertBorder=false;	// true: invert the effect caused by gbFlatBorder; false: no change.
var gbShareAgenda=true;	// if set to true, a global agenda store will be created and used to share across calendars. Check tutorials for details.
var gsAgShared="gContainer._cxp_agenda";	// shared agenda store name used when gbShareAgenda is true.
var gbCacheAgenda=false;	// false: will prevent the agenda url from being cached; true: cached as normal js file.
var giShowInterval=250;	// interval time in milliseconds that controls the auto-traverse speed.
