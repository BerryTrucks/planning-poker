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

    property alias title: titleLabel.text
    property alias checked: toggleButton.checked

    leftPadding: 16
    rightPadding: 16

    layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
    
    Label {
        id: titleLabel

        verticalAlignment: VerticalAlignment.Center
        
        layoutProperties: StackLayoutProperties {
            spaceQuota: 1
        }
    }

    ToggleButton {
        id: toggleButton

        verticalAlignment: VerticalAlignment.Center
    }
}
