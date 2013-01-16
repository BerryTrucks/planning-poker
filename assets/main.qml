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

Page {
    id: pageRoot

    Menu.definition: MenuDefinition {
        helpAction: HelpActionItem {
            title: qsTr("About")
            imageSource: "asset:///images/team.png"
            onTriggered: aboutDef.createObject().open() 
        }

        settingsAction: SettingsActionItem {
            title: qsTr("Settings")
            onTriggered: settingsDef.createObject().open()
        }
    }

    Container {
        layout: DockLayout{}

        background: Color.create(AppSettings.cardTheme.background)

	    CardListView {
	        id: cardListView
	
	        property bool hide: false
	        touchPropagationMode: hide ? TouchPropagationMode.None : TouchPropagationMode.Full
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Fill
	
	        opacity: hide ? 0 : 1

	        dataModel: ArrayDataModel {
	            id: deckModel
	        }
	    }

        GestureArea {
            showUnhideMessage: cardListView.hide
            
            onDoubleTapped: cardListView.hide = !cardListView.hide
            onPinched: cardPicker.open()
        }
    }

    attachedObjects: [
        ComponentDefinition {
            id: settingsDef
            Settings {
                id: settings
                onClosed: settings.destroy()
            }            
        },

        ComponentDefinition {
            id: aboutDef
	        About {
	            id: about
	            onClosed: about.destroy()
	        }
        },

        CardPicker {
            id: cardPicker

            deckModel: cardListView.dataModel

            onCardSelected: {
                close()
                cardListView.scrollToItem(indexPath, AppSettings.scrollToCard ? ScrollAnimation.Smooth : ScrollAnimation.None)
            }
        }
    ]

    function loadDeck() {
        deckModel.clear()
        deckModel.append(DeckRepository.activeDeck.cards)
    }

    onCreationCompleted: {
        DeckRepository.activeDeckChanged.connect(loadDeck)
        loadDeck()
    }
}
