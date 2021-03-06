import bb.cascades 1.4

Page {
    //    property alias query: titlebar.kindProperties.textField.text
    function setActive() {
        listview.scrollRole = ScrollRole.Main
    }
    property variant nav
    titleBar: TitleBar {
        id: titlebar
        kind: TitleBarKind.TextField
        kindProperties: TextFieldTitleBarKindProperties {
            textField.input.onSubmitted: {
                search()
            }
            textField.hintText: qsTr("Search in Movies")
            textField.input.keyLayout: KeyLayout.Text
            textField.input.submitKey: SubmitKey.Search
            textField.input.submitKeyFocusBehavior: SubmitKeyFocusBehavior.Lose
            textField.inputMode: TextFieldInputMode.Text
        }
    }
    function search() {
        var q = titlebar.kindProperties.textField.text;
        search_movie(q);
    }
    onCreationCompleted: {
        titlebar.kindProperties.textField.requestFocus()
    }
    property string search_movie_url: "http://v3.wufazhuce.com:8000/api/search/movie/%1"
    function search_movie(q) {
        var endp = search_movie_url.arg(encodeURIComponent(q));
        act_movie.running = true
        var d = _app.fetch(endp);
        var b = d.length > 0;
        act_movie.running = false
        if (b) {
            try {
                var d = JSON.parse(d).data;
                adm.clear()
                adm.append(d);
            } catch (e) {
                console.log(e)
            }
        } else {
            console.log(d)
        }
    }
    function showMovie(hid) {
        var hpview = Qt.createComponent("Detail-MovieView.qml").createObject(nav);
        hpview.nav = nav;
        hpview.mid = hid;
        nav.push(hpview)
    }
    attachedObjects: [
        Common {
            id: co
        }
    ]
    actionBarAutoHideBehavior: ActionBarAutoHideBehavior.HideOnScroll
    actionBarVisibility: ChromeVisibility.Compact
    Container {
        Header {
            id: header_movie
            title: qsTr("Movies")
        }
        ActivityIndicator {
            horizontalAlignment: HorizontalAlignment.Center
            id: act_movie
        }
        Label {
            horizontalAlignment: HorizontalAlignment.Fill
            text: qsTr("Nothing Here")
            textStyle.textAlign: TextAlign.Center
            id: label_movie
        }
        ListView {
            id: listview
            dataModel: ArrayDataModel {
                id: adm
                onItemsChanged: {
                    header_movie.subtitle = adm.size() + qsTr(" results")
                    label_movie.visible = adm.isEmpty();
                }
            }
            scrollIndicatorMode: ScrollIndicatorMode.ProportionalBar
            snapMode: SnapMode.None
            horizontalAlignment: HorizontalAlignment.Fill
            implicitLayoutAnimationsEnabled: false
            function requestView(hid) {
                showMovie(hid)
            }
            property int fontsize: nav.fontsize
            listItemComponents: [
                ListItemComponent {
                    type: ""
                    SearchPictureTemplate {
                        id: spt
                        font_size: spt.ListItem.view.fontsize
                        onRequestView: {
                            spt.ListItem.view.requestView(hid)
                        }
                        hid: ListItemData.id
                        image_url: ListItemData.cover
                        author: ListItemData.title
                    }
                }
            ]
        }
    }
}
