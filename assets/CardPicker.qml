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

Sheet {
    id: sheet

    property alias deckModel: listView.dataModel

    signal cardSelected(variant indexPath)

    Page {

        titleBar: TitleBar {
            title: qsTr("Pick card")
            
            acceptAction: ActionItem {
                title: qsTr("Close")
                onTriggered: sheet.close()
            }
        }

        Container {
            background: listView.backgroundColor

	        ListView {
	            id: listView
	
				property variant foregroundColor: Color.create(AppSettings.cardTheme.foreground)
				property variant backgroundColor: Color.create(AppSettings.cardTheme.background)
	
	            topPadding: layout.verticalCellSpacing
	            leftPadding: layout.horizontalCellSpacing
	            rightPadding: layout.horizontalCellSpacing
	
	            layout: GridListLayout {
	                horizontalCellSpacing: 20
	                verticalCellSpacing: 20
	            }
	
	            onTriggered: sheet.cardSelected(indexPath)
	
	            listItemComponents: [
	                ListItemComponent {
	                    Container {
	                        leftPadding: 2
	                        rightPadding: 2
	                        topPadding: 2
	                        bottomPadding: 2
	                        horizontalAlignment: HorizontalAlignment.Fill
	                        verticalAlignment: VerticalAlignment.Fill
	                        background: card.foregroundColor
	                        layout: DockLayout {}
	
		                    Card {
		                        id: card
		                        horizontalAlignment: HorizontalAlignment.Fill
		                        verticalAlignment: VerticalAlignment.Fill
		
		                        text: ListItemData
		                        thumbMode: true
								foregroundColor: parent.ListItem.view.foregroundColor
								backgroundColor: parent.ListItem.view.backgroundColor
		                    }
	                    }
	                }
	            ]
	        }

        }

    }

}