/*
 * Copyright 2013 Mario Boikov
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */
import bb.cascades 1.0

Container {
	DropDown {
	    id: dropDown

	    function isSelected(theme) {
	        return theme.foreground == AppSettings.cardTheme.foreground &&
	                theme.background == AppSettings.cardTheme.background
	    }

	    horizontalAlignment: HorizontalAlignment.Center
	    title: qsTr("Card theme")

        onSelectedValueChanged: AppSettings.cardTheme = selectedValue

	    Option {
	        text: qsTr("Dark")
	        value: {'foreground':'#fafafa', 'background':'#262626'}
	        selected: dropDown.isSelected(value)
	    }
	    
	    Option {
	        text: qsTr("Light")
	        value: {'foreground':'#262626', 'background':'#fafafa'}
	        selected: dropDown.isSelected(value)
	    }
	}
	
	Divider {}   
}
