import QtQuick 2.9
import Ubuntu.Components 1.3
import QtQuick.Window 2.2
import Morph.Web 0.1
import "UCSComponents"
import QtWebEngine 1.7
import Qt.labs.settings 1.0
import QtSystemInfo 5.5

MainView {
  id:window

  objectName: "mainView"
  theme.name: "Ubuntu.Components.Themes.SuruDark"

  applicationName: "uteezer.tafitson"


  backgroundColor : "transparent"




  WebView {
    id: webview
    anchors{ fill: parent}

    enableSelectOverride: true


    settings.fullScreenSupportEnabled: ture
    property var currentWebview: webview
    settings.pluginsEnabled: true

    onFullScreenRequested: function(request) {
      nav.visible = !nav.visible
      request.accept();
    }



    profile:  WebEngineProfile{
      id: webContext
      persistentCookiesPolicy: WebEngineProfile.ForcePersistentCookies
      property alias dataPath: webContext.persistentStoragePath

      dataPath: dataLocation


      
      httpUserAgent: "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36"
    }

    anchors{
      fill:parent
      centerIn: parent.verticalCenter
    }

    url: "https://www.deezer.com/"
    userScripts: [
      WebEngineScript {
        injectionPoint: WebEngineScript.DocumentCreation
        worldId: WebEngineScript.MainWorld
        name: "QWebChannel"
        sourceUrl: "ubuntutheme.js"
      }
    ]

      
  }
  RadialBottomEdge {
    id: nav
    visible: true
    actions: [
      RadialAction {
        id: subscriptions
        iconName: "grip-large"
        onTriggered: {
          webview.runJavaScript('window.location.assign("https://www.deezer.com/explore")')
        }
        text: qsTr("Explore")
      },
      
      RadialAction {
        id: account
        iconName: "media-playback-start"
        onTriggered: {
          webview.url = 'https://www.deezer.com/shows'
        }
        text: qsTr("Shows")
      },
      RadialAction {
        id: forward
        enabled: webview.canGoForward
        iconName: "go-next"
        onTriggered: {
          webview.goForward()
        }
        text: qsTr("Forward")
      },
      RadialAction {
        id: reload
        iconName: "reload"
        onTriggered: {
          webview.reload()
        }
        text: qsTr("Reload")
      },
      RadialAction {
        id: home
        iconName: "home"
        onTriggered: {
          webview.url = 'https://www.deezer.com/'
        }
        text: qsTr("Home")
      },  
      RadialAction {
        id: back
        enabled: webview.canGoBack
        iconName: "go-previous"
        onTriggered: {
          webview.goBack()
        }
        text: qsTr("Back")
      },
      RadialAction {
        id: trending
        iconName: "like"
        onTriggered: {
          webview.url = 'https://www.deezer.com/profile'
        }
        text: qsTr("Favorites")
      }        
    ]
  }

  Connections {
    target: Qt.inputMethod
    onVisibleChanged: nav.visible = !nav.visible
  }

  Connections {
    target: webview

    onIsFullScreenChanged: {
      window.setFullscreen()
      if (currentWebview.isFullScreen) {
        nav.state = "hidden"
      }
      else {
        nav.state = "shown"
      }
    }
    
  }

  Connections {
    target: window.webview
    
    onIsFullScreenChanged: window.setFullscreen(window.webview.isFullScreen)
  }
  function setFullscreen(fullscreen) {
    if (!window.forceFullscreen) {
      if (fullscreen) {
        if (window.visibility != Window.FullScreen) {
          internal.currentWindowState = window.visibility
          window.visibility = 5
        }
      } else {
        window.visibility = internal.currentWindowState
        //window.currentWebview.fullscreen = false
        //window.currentWebview.fullscreen = false
      }
    }
  }

  ScreenSaver {
    id: screenSaver
    screenSaverEnabled: !(Qt.application.active) || !webview.recentlyAudible
  }
}
