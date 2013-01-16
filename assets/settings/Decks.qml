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

    topMargin: 20
    bottomMargin: 20

    Container {

	    leftPadding: 16
	    rightPadding: 16

	    DropDown {
	        id: dropDown
	
	        title: qsTr("Deck")
	     
	        horizontalAlignment: HorizontalAlignment.Center
	        
	        onSelectedValueChanged: DeckRepository.setActiveDeckName(selectedValue)
	    }

    }

    Divider {}

    attachedObjects: [
        ComponentDefinition {
            id: optionDef
             Option {
            }
        }
    ]

    onCreationCompleted: {
        var activeDeckName = DeckRepository.activeDeck.name

        for (var i = 0; i < DeckRepository.decks.length; i++) {
            var deck = DeckRepository.decks[i]
            var option = optionDef.createObject()
            option.text = deck.name
            option.value = deck.name
            option.description = deck.cards.join(' ')
            option.selected = activeDeckName == deck.name
            dropDown.add(option)
        }
    }
}
