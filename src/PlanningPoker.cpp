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
#include "PlanningPoker.hpp"

#include <bb/cascades/Application>
#include <bb/cascades/QmlDocument>
#include <bb/cascades/AbstractPane>
#include <bb/cascades/Container>
#include <bb/cascades/ImageView>
#include <bb/cascades/SceneCover>
#include <bb/cascades/DockLayout>
#include <bb/cascades/Color>
#include <bb/cascades/Window>

#include "AppSettings.h"
#include "DeckRepository.h"

using namespace bb::cascades;

PlanningPoker::PlanningPoker(bb::cascades::Application *app)
: QObject(app)
{
    m_settings = new AppSettings(this);
    m_deckRepository = new DeckRepository(this);

    applySettings();

    connect(m_settings, SIGNAL(keepAwakeChanged()), SLOT(onKeepAwakeChanged()));
    connect(m_deckRepository, SIGNAL(activeDeckChanged(QString)), m_settings, SLOT(setActiveDeckName(QString)));

    // create scene document from main.qml asset
    // set parent to created document to ensure it exists for the whole application lifetime
    QmlDocument *qml = QmlDocument::create("asset:///main.qml").parent(this);

    qml->setContextProperty(QLatin1String("AppSettings"), m_settings);
    qml->setContextProperty(QLatin1String("DeckRepository"), m_deckRepository);

    // create root object for the UI
    AbstractPane *root = qml->createRootObject<AbstractPane>();
    // set created root object as a scene
    app->setScene(root);

    setupAppCover(app);
}

void PlanningPoker::setupAppCover(bb::cascades::Application *app)
{
    ImageView *imageView = ImageView::create("asset:///images/cover.png").
            horizontal(HorizontalAlignment::Center).
            vertical(VerticalAlignment::Center);

    Container *container = Container::create();
    container->setLayout(DockLayout::create());
    container->setBackground(Color::fromARGB(0xff262626));
    container->add(imageView);

    app->setCover(SceneCover::create().content(container));
}

void PlanningPoker::onKeepAwakeChanged()
{
    Application *app = static_cast<Application *>(parent());
    ScreenIdleMode::Type mode = m_settings->keepAwake() ? ScreenIdleMode::KeepAwake : ScreenIdleMode::Normal;
    app->mainWindow()->setScreenIdleMode(mode);
}

void PlanningPoker::applySettings()
{
    onKeepAwakeChanged();
    m_deckRepository->setActiveDeckName(m_settings->activeDeckName());
}
