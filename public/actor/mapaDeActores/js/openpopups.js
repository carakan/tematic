//
// openPopUps v1.01 Copyright (c) 2006 openWebWare.com
// This copyright notice MUST stay intact for use.
//
// The perfect pop up window replacement for your advertisements and web 
// applications. Pop up blockers will fail to prevent an openPopUp window 
// from opening. 
//
// This library is free software; you can redistribute it and/or modify 
// it under the terms of the GNU Lesser General Public License as published 
// by the Free Software Foundation; either version 2.1 of the License, or 
// (at your option) any later version.
//
// This library is distributed in the hope that it will be useful, but 
// WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
// or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public 
// License for more details.
//
// You should have received a copy of the GNU Lesser General Public License along 
// with this library; if not, write to the Free Software Foundation, Inc., 59 
// Temple Place, Suite 330, Boston, MA 02111-1307 USA 

// CSS Diretory
cssDir = "styles/";

// Images Directory
imageDir = "images/";

// Include Style Sheet
document.write('<link rel="stylesheet" type="text/css" href="' +cssDir+ 'styles.css">\n');

/* ---------------------------------------------------------------------- *\
  Function    : JSWindow()
  Description : creates a new window
  Usage       : JSWindow("title", oContent, [x], [y], [id], [width])
  Arguments   : title    - The title of the window as displayed in the titlebar
	              oContent - The content of the Div called using getElementbyID
								x        - The number of pixels from the left the window appears when first open
								y        - The number of pixels from the top the window appears when first open
	              id       - The <div> this window will use for its content
                width    - The default width of the window                
\* ---------------------------------------------------------------------- */

function JSWindow(title, oContent, x, y, id, width, popupColor, minimizeIcon)
{
	
	// define variables
	this.title = title;
	this.oContent = oContent;
  this.width = width;
	this.x = x;
	this.y = y;
  this.id = id;
	this.bgcolor = popupColor;
	
	
	// create the table window and define CSS properties
	this.oTable = document.createElement("table");
  this.oTable.id = "Window " + this.id;
	this.oTable.style.width = this.width + "px";
	this.oTable.style.border = "1px solid #000000";
  this.oTable.cellSpacing = 0;
	this.oTable.cellPadding = 2;
	this.oTable.border = 0;
	this.oTable.style.backgroundColor = "#FFFFFF";

	// determine the windows position when first open
	this.oTable.style.position = "absolute";
	this.oTable.style.left = this.x + "px";
	this.oTable.style.top = this.y + "px";

	// link from the table to the JSWindow object
	this.oTable.jsWindow = this;

	// if the table is clicked anywhere, show the table in front of other open windows
	this.oTable.onmousedown = JSWindow.prototype.onBringToFront;

	// append to document body
	document.body.appendChild(this.oTable);

	// add a row for the titlebar
	var oTR = this.oTable.insertRow(0);
	oTR.className = "JSWindowTitleStyle";
	
	
	// Title: add the title to the titlebar	
	oTD = oTR.insertCell(0);
	oTD.innerHTML = title;
	oTD.jsWindow = this;
	oTD.onmousedown = JSWindow.prototype.tdOnMouseDown;
	oTD.style.borderBottom = "1px solid #000000";
	oTD.style.backgroundImage = "url(" + imageDir + "title_bg.jpg)";
	oTD.height = "20";
	oTD.width = "98%";
	
	// Minimize: add the minimize button to the titlebar
	if (minimizeIcon == 1) {
    this.oMinTD = oTR.insertCell(1);
	  this.oMinTD.innerHTML = "<img src='" + imageDir + "minimize.jpg'>";
	  this.oMinTD.onmousedown = JSWindow.prototype.onMinimize;
	  this.oMinTD.jsWindow = this;
    this.oMinTD.style.borderBottom = "1px solid #000000";
	  this.oMinTD.style.backgroundImage = "url(" + imageDir + "title_bg.jpg)";
	  this.oMinTD.width = "1%";
	  this.oMinTD.style.paddingRight = "1px";	
  }
	
	// Close: add the close button to the titlebar
	if (minimizeIcon == 1) {
	  oTD = oTR.insertCell(2);
	}
	else {
	  oTD = oTR.insertCell(1); 
	}
	oTD.innerHTML = "<img src='" + imageDir + "close.jpg'>";
	oTD.jsWindow = this;
	oTD.onmousedown = JSWindow.prototype.onClose;
	oTD.style.borderBottom = "1px solid #000000";
	oTD.style.backgroundImage = "url(" + imageDir + "title_bg.jpg)";
  oTD.width = "1%";
	oTD.style.paddingLeft = "1px";
	
	// add a row for the window's content
	oTR = this.oTable.insertRow(1);
	
	this.oContentTD = oTR.insertCell(0);
	if (minimizeIcon == 1) {
	  this.oContentTD.colSpan = 3;
	}
	else {
	  this.oContentTD.colSpan = 2;
	}  
	this.oContentTD.style.backgroundColor = this.bgcolor;
	this.oContentTD.className = "JSWindowContentStyle";
 
 
	// use the content from the referenced div as the content for the window
	this.oContentTD.innerHTML = document.all["Div" + this.id].innerHTML;
	
}

JSWindow.prototype.onBringToFront = function()
{
	this.jsWindow.bringToFront();
}

JSWindow.prototype.bringToFront = function()
{
	// if not already the last child of the document.body, make it so
	if ( document.body.childNodes[document.body.childNodes.length-1] !== this.oTable )
	{
		// move to bottom of document
		document.body.appendChild(this.oTable);
	}
}

JSWindow.prototype.tdOnMouseDown = function()
{
	this.jsWindow.onMouseDown();
}

JSWindow.prototype.onMouseDown = function()
{
	// record that an onmousedown has just occurred
	this.bDown = true;
	
	// link from body to this JSWindow object
	document.body.jsWindow = this;

	// save body mouse handlers
	this.saveMouseMove = document.body.onmousemove;
	this.saveMouseUp = document.body.onmouseup;

	// set new handlers.
	document.body.onmousemove = JSWindow.prototype.bodyOnMouseMove;
	document.body.onmouseup = JSWindow.prototype.bodyOnMouseUp;
}

JSWindow.prototype.bodyOnMouseMove = function(evt)
{
	var e = window.event ? window.event : evt;
	this.jsWindow.onMouseMove(e);
}

JSWindow.prototype.onMouseMove = function(evt)
{
	// if mouse not down, stop the move (for IE only)
	if ( (document.all) && !(evt.button & 1) )
	{
		this.onMouseUp();
		return;
	}
	if ( this.bDown )
	{
		this.dx = parseInt(this.oTable.style.left, 10) - evt.clientX;
		this.dy = parseInt(this.oTable.style.top, 10) - evt.clientY;
		this.bDown = false;
	}
	else
	{
		this.oTable.style.left = Math.max((this.dx + evt.clientX),0) + "px";
		this.oTable.style.top = Math.max((this.dy + evt.clientY),0) + "px";
	}
}

JSWindow.prototype.bodyOnMouseUp = function()
{
	this.jsWindow.onMouseUp();
}

JSWindow.prototype.onMouseUp = function()
{
	document.body.onmouseup = this.saveMouseUp;
	document.body.onmousemove = this.saveMouseMove;
	document.body.jsWindow = null;
}


JSWindow.prototype.onMinimize = function()
{
  this.jsWindow.minimize();
}



JSWindow.prototype.minimize = function()
{
	// hide the content
	this.oContent.style.visibility = "hidden";
	this.oContent.style.position = "absolute";
	document.body.appendChild(this.oContent);
	
	this.oTable.deleteRow(1);
	
	// save current position
	this.saveX = this.oTable.style.left;
	this.saveY = this.oTable.style.top;
	
  // get the "window bar"
	if ( !window.jsWindowBar )
	{
		window.jsWindowBar = document.createElement("span");
	  document.body.appendChild(window.jsWindowBar);
	}
	
	window.jsWindowBar.appendChild(this.oTable);
	this.oTable.style.position = "static";
	this.oTable.style.left = "0px";
	this.oTable.style.top = "0px";
	
	this.oMinTD.innerHTML = "<img src='" + imageDir + "maximize.jpg'>";
	this.oMinTD.onmousedown = JSWindow.prototype.onMaximize;
	this.oTable.style.width = "220px";
  this.oTable.style.borderBottom = "0px";
	
}


JSWindow.prototype.onMaximize = function()
{
	this.jsWindow.maximize();
}

JSWindow.prototype.maximize = function()
{
	document.body.appendChild(this.oTable);
	this.oTable.style.position = "absolute";
	
	this.oTable.style.left = this.saveX;
	this.oTable.style.top = this.saveY;
	this.oTable.style.width = this.width + "px"
	this.oTable.style.borderBottom = "1px solid #000000";
	
	// add the content again.
	oTR = this.oTable.insertRow(1);
	
  this.oContentTD = oTR.insertCell(0);
	this.oContentTD.colSpan = 3;
	this.oContentTD.innerHTML = document.all["Div" + this.id].innerHTML;
	
	//oTD.appendChild(this.oContent);
	this.oContent.style.position = "static";
	this.oContent.style.visibility = "visible";
	this.oContentTD.style.backgroundColor = this.bgcolor;
	this.oContentTD.className = "JSWindowContentStyle";
	
  this.oMinTD.style.paddingRight = "1px";	
	this.oMinTD.innerHTML = "<img src='" + imageDir + "minimize.jpg'>";
	this.oMinTD.onmousedown = JSWindow.prototype.onMinimize;

}

JSWindow.prototype.onMaximize = function()
{
	this.jsWindow.maximize();
}

JSWindow.prototype.close = function()
{	
	// remove from browser document
	this.oTable.parentNode.removeChild(this.oTable);
}

JSWindow.prototype.onClose = function()
{
	this.jsWindow.close();
}



/* ---------------------------------------------------------------------- *\
  Function    : hideDiv()
  Description : Hides all Divs on the page.
  Usage       : hideDiv([divNumber])
  Arguments   : divNumber - The number of Divs in the page that must be hidden
\* ---------------------------------------------------------------------- */

function hideDiv(divNumber) {
	for (var count = 1; count <= divNumber;) {
    document.getElementById('Div' + count).style.display = 'none';
		count++;
	}
}



/* ---------------------------------------------------------------------- *\
  Function    : createWindows()
  Description : determines if Window already exists, else calls JSWindow
  Usage       : createWindows([windowID], [width], "title")
  Arguments   : windowID - The <div> this window will use for its content
                width    - The default width of the window
                title    - The title of the window as displayed in the titlebar
\* ---------------------------------------------------------------------- */

function createWindow(title, width, popupColor, windowID, minimizeIcon, x, y)
{
if (document.getElementById('Window ' + windowID)) {
  }
else {
  new JSWindow("&nbsp;" + title, document.getElementById("Div" + windowID), x, y, windowID, width, popupColor, minimizeIcon); 
  }
}
