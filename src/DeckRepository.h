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
#ifndef DECKREPOSITORY_H_
#define DECKREPOSITORY_H_

#include <QObject>
#include <QVariant>

class DeckRepository: public QObject
{
    Q_OBJECT

    Q_PROPERTY(QVariantList decks READ decks NOTIFY decksChanged)

    Q_PROPERTY(QVariantMap activeDeck READ activeDeck NOTIFY activeDeckChanged)

public:
    DeckRepository(QObject *parent=0);

    QVariantList decks() const;

    QVariantMap activeDeck() const;

signals:
    void decksChanged();
    void activeDeckChanged(const QString &name);

public slots:
    void setActiveDeckName(const QString &name);

private:
    void addDeck(const QString &name, const QString &cardDefinition);
    QVariantList m_decks;
    QVariantMap m_activeDeck;
};

#endif /* DECKREPOSITORY_H_ */
