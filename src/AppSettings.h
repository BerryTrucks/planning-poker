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
#ifndef APPSETTINGS_H_
#define APPSETTINGS_H_

#include <QObject>
#include <QVariant>

class AppSettings: public QObject
{
    Q_OBJECT

    Q_PROPERTY(bool keepAwake READ keepAwake WRITE setKeepAwake NOTIFY keepAwakeChanged)
    Q_PROPERTY(bool scrollToCard READ scrollToCard WRITE setScrollToCard NOTIFY scrollToCardChanged)
    Q_PROPERTY(QVariantMap cardTheme READ cardTheme WRITE setCardTheme NOTIFY cardThemeChanged)

public:
    AppSettings(QObject *parent=0);

    bool keepAwake() const;
    void setKeepAwake(bool value);

    bool scrollToCard() const;
    void setScrollToCard(bool value);

    QVariantMap cardTheme() const;
    void setCardTheme(const QVariantMap &theme);

    QString activeDeckName() const;

public slots:
    void setActiveDeckName(const QString &name);

signals:
    void keepAwakeChanged();
    void scrollToCardChanged();
    void cardThemeChanged();

private:
    QVariantMap m_defaultTheme;
};

#endif /* APPSETTINGS_H_ */
