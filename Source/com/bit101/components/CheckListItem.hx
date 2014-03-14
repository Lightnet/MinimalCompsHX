/**
* ListItem.as
* Keith Peters
* version 0.9.10
* 
* A single item in a list. 
* 
* Copyright (c) 2011 Keith Peters
* 
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
* 
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
* 
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

//http://www.bit-101.com/blog/?p=2574


package com.bit101.components;

import flash.display.DisplayObjectContainer;
import flash.events.MouseEvent;
import flash.events.Event;

class CheckListItem extends ListItem
{
	var _checkBox:CheckBox;
	
	public function new(parent:DisplayObjectContainer = null, xpos:Float = 0, ypos:Float = 0, data:Dynamic = null)
	{
		super(parent, xpos, ypos, data);
	}
	
	override function addChildren():Void
	{
		super.addChildren();
		_checkBox = new CheckBox(this, 5, 5, "", onCheck);
		_label.visible = false;
	}

	public override function draw():Void
	{
		super.draw();
		
		//make sure the data is null else it give error in the trace
		if(_data == null) return;
		
		//if(_data is String)
		if(Std.is(_data, String))
		{
			//_checkBox.label = _data as String;
			_checkBox.label = cast(_data,  String);
		}
		//else if(_data.label is String)
		else if(Std.is(_data.label, String))
		{
			_checkBox.label = _data.label;
		}
		else
		{
			//_checkBox.label = _data.toString();
			_checkBox.label = Std.string(_data);
		}
		
		
		if(_data.checked != null)
		{
			_checkBox.selected = _data.checked;
		}
	}

	function onCheck(event:Event):Void
	{
		_data.checked = _checkBox.selected;
	}
	
}