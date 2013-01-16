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
#ifndef PlanningPoker_HPP_
#define PlanningPoker_HPP_

#include <QObject>

class AppSettings;
class DeckRepository;

namespace bb { namespace cascades { class Application; }}

/*!
 * @brief Application pane object
 *
 *Use this object to create and init app UI, to create context objects, to register the new meta types etc.
 */
class PlanningPoker : public QObject
{
    Q_OBJECT
public:
    PlanningPoker(bb::cascades::Application *app);
    virtual ~PlanningPoker() {}

private slots:
    void onKeepAwakeChanged();

private:
    void applySettings();
    void setupAppCover(bb::cascades::Application *app);

    AppSettings *m_settings;
    DeckRepository *m_deckRepository;
};


#endif /* PlanningPoker_HPP_ */
