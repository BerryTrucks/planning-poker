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
#include "DeckRepository.h"
#include <QStringList>

const static QString NameKey = QLatin1String("name");
const static QString CardsKey = QLatin1String("cards");

DeckRepository::DeckRepository(QObject *parent) : QObject(parent)
{
    addDeck(tr("Cohn Scale"), "? 0 \u00BD 1 2 3 5 8 13 20 40 100 \u221E \u2668");
    addDeck(tr("Fibonacci"), "? 0 1 2 3 5 8 13 21 34 55 89 \u221E \u2668");
    addDeck(tr("T-Shirt sizing"), "? XS S M L XL XXL \u2668");

    m_activeDeck = m_decks.value(0).toMap();
}

QVariantList DeckRepository::decks() const
{
    return m_decks;
}

QVariantMap DeckRepository::activeDeck() const
{
    return m_activeDeck;
}

void DeckRepository::setActiveDeckName(const QString &name)
{
    if (m_activeDeck.value(NameKey).toString() == name)
        return;

    foreach (const QVariant &deck, m_decks) {
        if (deck.toMap().value(NameKey).toString() == name) {
            m_activeDeck = deck.toMap();
            emit activeDeckChanged(name);
            break;
        }
    }
}

void DeckRepository::addDeck(const QString &name, const QString &cardDefintion)
{
    QVariantList cardList;

    foreach (const QString &card, cardDefintion.split(" ")) {
        cardList.append(card);
    }

    QVariantMap map;
    map.insert(NameKey, name);
    map.insert(CardsKey, cardList);
    m_decks.append(map);
}
