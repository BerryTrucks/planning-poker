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
#include "AppSettings.h"
#include <QSettings>

const static QString KeepAwakeKey = QLatin1String("keepAwake");
const static QString ScrollToCardKey = QLatin1String("scrollToCard");
const static QString ActiveDeckNameKey = QLatin1String("activeDeckName");
const static QString CardThemeKey = QLatin1String("cardTheme");

AppSettings::AppSettings(QObject *parent) : QObject(parent)
{
    m_defaultTheme.insert("background", "#262626");
    m_defaultTheme.insert("foreground", "#fafafa");
}

bool AppSettings::keepAwake() const
{
    return QSettings().value(KeepAwakeKey, false).toBool();
}

void AppSettings::setKeepAwake(bool value)
{
    QSettings settings;

    if (value != settings.value(KeepAwakeKey, false).toBool()) {
        settings.setValue(KeepAwakeKey, value);
        emit keepAwakeChanged();
    }
}

bool AppSettings::scrollToCard() const
{
    return QSettings().value(ScrollToCardKey, true).toBool();
}

void AppSettings::setScrollToCard(bool value)
{
    QSettings settings;

    if (value != settings.value(ScrollToCardKey, true).toBool()) {
        settings.setValue(ScrollToCardKey, value);
        emit scrollToCardChanged();
    }
}

QVariantMap AppSettings::cardTheme() const
{
    return QSettings().value(CardThemeKey, m_defaultTheme).toMap();
}

void AppSettings::setCardTheme(const QVariantMap &theme)
{
    QSettings settings;

    if (theme != settings.value(CardThemeKey, m_defaultTheme).toMap()) {
        settings.setValue(CardThemeKey, theme);
        emit cardThemeChanged();
    }
}

QString AppSettings::activeDeckName() const
{
    return QSettings().value(ActiveDeckNameKey, QString()).toString();
}

void AppSettings::setActiveDeckName(const QString &name)
{
    QSettings settings;

    if (name != settings.value(ActiveDeckNameKey, QString()).toString()) {
        settings.setValue(ActiveDeckNameKey, name);
        // emit signal?
    }
}
