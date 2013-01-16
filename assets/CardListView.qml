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

ListView {
    id: cardListView

    property int listWidth: 0
    property int listHeight: 0
    property variant foregroundColor: Color.create(AppSettings.cardTheme.foreground)
    property variant backgroundColor: Color.create(AppSettings.cardTheme.background)

    layout: StackListLayout {
        headerMode: ListHeaderMode.None
        orientation: LayoutOrientation.LeftToRight
    }

    snapMode: SnapMode.LeadingEdge
    flickMode: FlickMode.SingleItem

    attachedObjects: [
        LayoutUpdateHandler {
            id: layoutUpdateHandler

            onLayoutFrameChanged: {
                cardListView.listWidth = layoutFrame.width
                cardListView.listHeight = layoutFrame.height
            } 
        }
    ]

    listItemComponents: [
        ListItemComponent {
            Card {
                preferredHeight: ListItem.view.listHeight
                preferredWidth: ListItem.view.listWidth

                text: ListItemData
                foregroundColor: ListItem.view.foregroundColor
                backgroundColor: ListItem.view.backgroundColor
            }
        }
    ]
}