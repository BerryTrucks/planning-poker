import bb.cascades 1.0

Sheet {
    id: sheet

    Page {

        titleBar: TitleBar {
            title: qsTr("About")
            acceptAction: ActionItem {
                title: qsTr("Close")
                onTriggered: sheet.close()
            }
        }

        ScrollView {
            Container {
                topPadding: 40
                horizontalAlignment: HorizontalAlignment.Fill

                Label {
                    horizontalAlignment: HorizontalAlignment.Fill
                    text: qsTr("Planning Poker v%1\n" +
                    "Copyright 2013, Mario Boikov").arg("1.0")
                    
                    textStyle {
                        base: SystemDefaults.TextStyles.TitleText
                        textAlign: TextAlign.Center
                    }
                    multiline: true
                }

                Container {
                    topPadding: 40
                    leftPadding: 16
                    rightPadding: 16

	                Label {
	                    bottomMargin: 0
	                    text: qsTr("INFO")
	                    textStyle.base: SystemDefaults.TextStyles.SmallText
	                }

                    Divider {
                        topMargin: 0
                    }

                    Label {
                        text: qsTr("<html>" +
                        "Planning Poker is released under the <a href='http://www.apache.org/licenses/LICENSE-2.0.html'>Apache License v2.0</a>\n\n" +
                        "For source code and more information, please visit the project's <a href='https://bitbucket.org/marioboikov/planning-poker'>home page</a>"+
                        "</html>")
                        
                        multiline: true
                    }
                }

                Container {
                    topPadding: 40
                    leftPadding: 16
                    rightPadding: 16

	                Label {
	                    bottomMargin: 0
	                    text: qsTr("ATTRIBUTIONS")
	                    textStyle.base: SystemDefaults.TextStyles.SmallText
	                }

                    Divider {
                        topMargin: 0
                    }

                    Container {
                        layout: StackLayout {orientation: LayoutOrientation.LeftToRight }

                        ImageView {
                            imageSource: "asset:///images/team.png"
                        }

	                    Label {
	                        layoutProperties: StackLayoutProperties { spaceQuota: 1 }
	                        text: qsTr("<html>" +
	                        "<a href='%1'>%2</a> " +
	                        "designed by <a href='%3'>%4</a> " +
	                        "from The Noun Project" +
	                        "</html>")
	                        .arg("http://thenounproject.com/noun/team/#icon-No8501")
	                        .arg("Team")
	                        .arg("http://thenounproject.com/bjorna1/#")
	                        .arg("Björn Andersson")
	                        multiline: true
	                    }
	                }
                }
            }
        }

    }

}