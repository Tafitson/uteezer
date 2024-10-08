import QtQuick 2.9
import Lomiri.Components 1.3
import QtQuick.Window 2.2
import Morph.Web 0.1
import "UCSComponents"
import QtWebEngine 1.7
import Qt.labs.settings 1.0
import QtSystemInfo 5.5

MainView {
  id:window
  objectName: "uteezer"
  theme.name: "Lomiri.Components.Themes.SuruDark"

  applicationName: "uteezer.tafitson"

  backgroundColor : "#000000"

  WebView {
    id: webview
    anchors{ fill: parent}

    enableSelectOverride: true


    settings.fullScreenSupportEnabled: true
    property var currentWebview: webview
    settings.pluginsEnabled: true

    onFullScreenRequested: function(request) {
      nav.visible = !nav.visible
      request.accept();
    }



    profile:  WebEngineProfile{
      id: webContext
      persistentCookiesPolicy: WebEngineProfile.ForcePersistentCookies
      storageName: "Storage"
      persistentStoragePath: "/home/phablet/.cache/uteezer.tafitson/QtWebEngine"
      property alias dataPath: webContext.persistentStoragePath

      dataPath: dataLocation


      
      httpUserAgent: "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36"
    }

    anchors{
      fill:parent
    }

    url: "https://www.deezer.com/"
    userScripts: [
      WebEngineScript {
        injectionPoint: WebEngineScript.DocumentReady
        worldId: WebEngineScript.UserWorld
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
        id: home
        iconName: "home"
        onTriggered: {
          webview.runJavaScript('var link = document.getElementsByClassName("css-10rh1s9")[0].childNodes[0]; \
            link.click();')
        }
        text: qsTr("Home")
      },

      RadialAction {
        id: explore
        iconName: "grip-large"
        onTriggered: {
          webview.runJavaScript('var link = document.getElementsByClassName("css-10rh1s9")[0].childNodes[1]; \
            link.click();')
        }
        text: qsTr("Explore")
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
        id: darkmode
        iconName: "night-mode"
        onTriggered: {
          webview.runJavaScript('var profile = document.getElementsByClassName("topbar-profile")[0]; \
            var clickProfile = profile && !profile.classList.contains("is-active"); \
            if(clickProfile) profile.click(); \
            var dmSwitch = document.getElementsByClassName("css-1967ax6")[0]; \
            dmSwitch.click(); \
            if(clickProfile) profile.click();')
        }
        text: qsTr("Toggle Dark Mode")
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
        id: favorites
        iconName: "like"
        onTriggered: {
          webview.runJavaScript('var link = document.getElementsByClassName("css-10rh1s9")[0].childNodes[0]; \
            link.click();')
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
    target: webview
    
    onIsFullScreenChanged: window.setFullscreen(webview.isFullScreen)
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

  Connections {
    target: UriHandler

    onOpened: {

      if (uris.length > 0) {
        console.log('Incoming call from UriHandler ' + uris[0]);
        webview.url = uris[0];
      }
    }
  }


  ScreenSaver {
    id: screenSaver
    screenSaverEnabled: !(Qt.application.active) || !webview.recentlyAudible
  }
}
