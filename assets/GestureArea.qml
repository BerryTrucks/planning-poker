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
    
    property bool showUnhideMessage: false

    signal doubleTapped
    signal pinched

	horizontalAlignment: HorizontalAlignment.Fill
	verticalAlignment: VerticalAlignment.Fill

    overlapTouchPolicy: OverlapTouchPolicy.Allow

    layout: DockLayout{}

    Label {
        text: qsTr("Double Tap\nto Unhide")
		horizontalAlignment: HorizontalAlignment.Fill
		verticalAlignment: VerticalAlignment.Center

        overlapTouchPolicy: OverlapTouchPolicy.Allow

        opacity: showUnhideMessage ? 1 : 0

        multiline: true
        textStyle {
            base: SystemDefaults.TextStyles.BigText
            textAlign: TextAlign.Center
            color: Color.create(AppSettings.cardTheme.foreground)
        }

    }

    gestureHandlers: [
        DoubleTapHandler {
            onDoubleTapped: root.doubleTapped() 
        },

        PinchHandler {
            id: pinch
            onPinchUpdated: if (event.pinchRatio <= 0.6) root.pinched()
        }
    ]
}
