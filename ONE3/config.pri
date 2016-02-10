# Config.pri file version 2.0. Auto-generated by IDE. Any changes made by user will be lost!
BASEDIR = $$quote($$_PRO_FILE_PWD_)

device {
    CONFIG(debug, debug|release) {
        profile {
            CONFIG += \
                config_pri_assets \
                config_pri_source_group1
        } else {
            CONFIG += \
                config_pri_assets \
                config_pri_source_group1
        }

    }

    CONFIG(release, debug|release) {
        !profile {
            CONFIG += \
                config_pri_assets \
                config_pri_source_group1
        }
    }
}

simulator {
    CONFIG(debug, debug|release) {
        !profile {
            CONFIG += \
                config_pri_assets \
                config_pri_source_group1
        }
    }
}

config_pri_assets {
    OTHER_FILES += \
        $$quote($$BASEDIR/assets/AuthorView.qml) \
        $$quote($$BASEDIR/assets/Common.js) \
        $$quote($$BASEDIR/assets/ListHomepageView.qml) \
        $$quote($$BASEDIR/assets/Page-About.qml) \
        $$quote($$BASEDIR/assets/SingleEssayView.qml) \
        $$quote($$BASEDIR/assets/SingleHomepageView.qml) \
        $$quote($$BASEDIR/assets/SingleSerialView.qml) \
        $$quote($$BASEDIR/assets/WebBrowser.qml) \
        $$quote($$BASEDIR/assets/icon/ic_diagnostics.png) \
        $$quote($$BASEDIR/assets/icon/ic_doctype_generic.png) \
        $$quote($$BASEDIR/assets/icon/ic_doctype_music.png) \
        $$quote($$BASEDIR/assets/icon/ic_doctype_video.png) \
        $$quote($$BASEDIR/assets/icon/ic_email_dk.png) \
        $$quote($$BASEDIR/assets/icon/ic_home.png) \
        $$quote($$BASEDIR/assets/icon/ic_info.png) \
        $$quote($$BASEDIR/assets/icon/ic_microphone.png) \
        $$quote($$BASEDIR/assets/icon/ic_microphone_mute.png) \
        $$quote($$BASEDIR/assets/icon/ic_notes.png) \
        $$quote($$BASEDIR/assets/icon/ic_open.png) \
        $$quote($$BASEDIR/assets/icon/ic_open_link.png) \
        $$quote($$BASEDIR/assets/icon/ic_pause.png) \
        $$quote($$BASEDIR/assets/icon/ic_play.png) \
        $$quote($$BASEDIR/assets/icon/ic_share.png) \
        $$quote($$BASEDIR/assets/icon/ic_speaker_dk.png) \
        $$quote($$BASEDIR/assets/icon/ic_speaker_mute.png) \
        $$quote($$BASEDIR/assets/main.qml)
}

config_pri_source_group1 {
    SOURCES += \
        $$quote($$BASEDIR/src/WebImageView.cpp) \
        $$quote($$BASEDIR/src/applicationui.cpp) \
        $$quote($$BASEDIR/src/main.cpp)

    HEADERS += \
        $$quote($$BASEDIR/src/WebImageView.h) \
        $$quote($$BASEDIR/src/applicationui.hpp)
}

CONFIG += precompile_header

PRECOMPILED_HEADER = $$quote($$BASEDIR/precompiled.h)

lupdate_inclusion {
    SOURCES += \
        $$quote($$BASEDIR/../src/*.c) \
        $$quote($$BASEDIR/../src/*.c++) \
        $$quote($$BASEDIR/../src/*.cc) \
        $$quote($$BASEDIR/../src/*.cpp) \
        $$quote($$BASEDIR/../src/*.cxx) \
        $$quote($$BASEDIR/../assets/*.qml) \
        $$quote($$BASEDIR/../assets/*.js) \
        $$quote($$BASEDIR/../assets/*.qs) \
        $$quote($$BASEDIR/../assets/icon/*.qml) \
        $$quote($$BASEDIR/../assets/icon/*.js) \
        $$quote($$BASEDIR/../assets/icon/*.qs)

    HEADERS += \
        $$quote($$BASEDIR/../src/*.h) \
        $$quote($$BASEDIR/../src/*.h++) \
        $$quote($$BASEDIR/../src/*.hh) \
        $$quote($$BASEDIR/../src/*.hpp) \
        $$quote($$BASEDIR/../src/*.hxx)
}

TRANSLATIONS = $$quote($${TARGET}_zh_CN.ts) \
    $$quote($${TARGET}.ts)
