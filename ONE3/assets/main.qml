/*
 * Copyright (c) 2011-2015 BlackBerry Limited.
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 * http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import bb.cascades 1.4
import "Common.js" as C
TabbedPane {
    Menu.definition: MenuDefinition {
        helpAction: HelpActionItem {
            // 帮助
            onTriggered: {
                var aboutpage = Qt.createComponent("Page-About.qml").createObject(currentNav);
                aboutpage.nav = currentNav;
                
                currentNav.push(aboutpage)
            }
        }
        settingsAction: SettingsActionItem {
            // 设置
        }
    }
    property variant currentNav: activeTab.nav
    showTabsOnActionBar: true
    Tab { //主页
        title: qsTr("Home") + Retranslate.onLocaleOrLanguageChanged
        imageSource: "asset:///icon/ic_home.png"
        property alias nav: nav_hp
        NavigationPane {
            id: nav_hp
            onPopTransitionEnded: C.onPopTransitionEnded(page)
            onPushTransitionEnded: C.onPushTransitionEnded(page)
        }
    }
    Tab { //阅读
        title: qsTr("Article") + Retranslate.onLocaleOrLanguageChanged
        imageSource: "asset:///icon/ic_doctype_generic.png"
        property alias nav: nav_read
        NavigationPane {
            id: nav_read
            onPopTransitionEnded: C.onPopTransitionEnded(page)
            onPushTransitionEnded: C.onPushTransitionEnded(page)
        }
    }
    Tab { //音乐 tab
        title: qsTr("Music") + Retranslate.onLocaleOrLanguageChanged
        imageSource: "asset:///icon/ic_doctype_music.png"
        property alias nav: nav_music
        NavigationPane {
            id: nav_music
            onPopTransitionEnded: C.onPopTransitionEnded(page)
            onPushTransitionEnded: C.onPushTransitionEnded(page)
        }
    }
    Tab { //电影 tab
        title: qsTr("Movie") + Retranslate.onLocaleOrLanguageChanged
        imageSource: "asset:///icon/ic_doctype_video.png"
        property alias nav: nav_movie
        NavigationPane {
            id: nav_movie
            onPopTransitionEnded: C.onPopTransitionEnded(page)
            onPushTransitionEnded: C.onPushTransitionEnded(page)
        }
    }
}
