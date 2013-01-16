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
    id: root

    property alias text: cardLabel.text
    property int fontSizeValue: thumbMode ? 15 : 100
    property bool thumbMode: false

    property variant foregroundColor 
    property variant backgroundColor

    horizontalAlignment: HorizontalAlignment.Fill
    verticalAlignment: VerticalAlignment.Fill

    leftPadding: 20
    topPadding: 10
    bottomPadding: 10
    rightPadding: 20
    layout: DockLayout {}

    background: root.backgroundColor 

    Label {
        horizontalAlignment: HorizontalAlignment.Left
        verticalAlignment: VerticalAlignment.Top

        visible: !thumbMode

        text: cardLabel.text

        textStyle {
            fontSize: FontSize.PointValue
            fontSizeValue: root.fontSizeValue == 100 ? 20 : 8
            color: root.foregroundColor 
        }
    }

    Label {
        id: cardLabel

        horizontalAlignment: HorizontalAlignment.Center
        verticalAlignment: VerticalAlignment.Center

        text: "100"

        textStyle {
            base: SystemDefaults.TextStyles.BigText
            fontSize: FontSize.PointValue
            fontSizeValue: root.fontSizeValue 
            color: root.foregroundColor 
        }
    }    

    Label {
        horizontalAlignment: HorizontalAlignment.Right
        verticalAlignment: VerticalAlignment.Bottom

        visible: !thumbMode
        
        text: cardLabel.text
        
        textStyle {
            fontSize: FontSize.PointValue
            fontSizeValue: root.fontSizeValue == 100 ? 20 : 8 
            color: root.foregroundColor 
        }

        rotationZ: 180
    }
}

