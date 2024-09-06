import QtQuick 2.9
import Ubuntu.Components 1.3
import QtQuick.Window 2.2
import Morph.Web 0.1
import "UCSComponents"
import QtWebEngine 1.7
import Qt.labs.settings 1.0
import QtSystemInfo 5.5

// Main application view
MainView {
  id: window
  objectName: "uteezer"  // The unique name for this view
  theme.name: "Ubuntu.Components.Themes.SuruDark"  // Set the theme to SuruDark
  applicationName: "uteezer.tafitson"  // Application name identifier
  backgroundColor : "#000000"  // Background color of the main view

  // WebView component to render web content
  WebView {
    id: webview
    anchors { fill: parent }  // Make the WebView fill the parent container
    enableSelectOverride: true  // Allow custom selection behavior
    settings.fullScreenSupportEnabled: true  // Enable fullscreen support
    property var currentWebview: webview  // Alias for the current WebView instance
    settings.pluginsEnabled: true  // Enable web plugins

    // Handle fullscreen requests
    onFullScreenRequested: function(request) {
      nav.visible = !nav.visible  // Toggle navigation visibility
      request.accept();  // Accept the fullscreen request
    }

    // WebEngine profile settings for the WebView
    profile: WebEngineProfile {
      id: webContext
      persistentCookiesPolicy: WebEngineProfile.ForcePersistentCookies  // Ensure cookies are persistent
      storageName: "Storage"  // Name of the storage for web data
      persistentStoragePath: "/home/phablet/.cache/uteezer.tafitson/QtWebEngine"  // Path for persistent storage
      property alias dataPath: webContext.persistentStoragePath  // Alias for data path
      dataPath: dataLocation  // Path to the data location
      httpUserAgent: "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36"  // User-Agent string for HTTP requests
    }

    anchors {
      fill: parent  // Make WebView fill its parent container
    }

    url: "https://www.deezer.com/"  // URL to load in the WebView
    userScripts: [
      WebEngineScript {
        injectionPoint: WebEngineScript.DocumentReady  // Inject script when the document is ready
        worldId: WebEngineScript.UserWorld  // Use the UserWorld for script execution
        name: "QWebChannel"  // Name of the script
        sourceUrl: "ubuntutheme.js"  // URL of the script source
      }
    ]
  }

  // Radial bottom edge for navigation actions
  RadialBottomEdge {
    id: nav
    visible: true  // Make the navigation visible by default
    actions: [
      RadialAction {
        id: explore
        iconName: "grip-large"
        onTriggered: {
          webview.runJavaScript('var link = document.getElementsByClassName("chakra-link")[2]; \
            link.click();')  // Execute JavaScript to click the explore link
        }
        text: qsTr("Explore")  // Text for the explore action
      },
      RadialAction {
        id: podcasts
        iconName: "media-playback-start"
        onTriggered: {
          webview.runJavaScript(' \
            var link = document.querySelector("a[href*=\'/channels/podcasts\']"); \
            if (link) { \
              link.click(); \
            } else { \
              var button = document.querySelector("a[href*=\'/shows\'] button"); \
              if (button) { \
                button.click(); \
              } \
            } \
          ')  // Execute JavaScript to click the podcasts link or button
        }
        text: qsTr("Podcasts")  // Text for the podcasts action
      },
      RadialAction {
        id: forward
        enabled: webview.canGoForward  // Enable forward action if possible
        iconName: "go-next"
        onTriggered: {
          webview.goForward()  // Navigate forward in history
        }
        text: qsTr("Forward")  // Text for the forward action
      },
      RadialAction {
        id: reload
        iconName: "reload"
        onTriggered: {
          webview.reload()  // Reload the current page
        }
        text: qsTr("Reload")  // Text for the reload action
      },
      RadialAction {
        id: home
        iconName: "home"
        onTriggered: {
          webview.runJavaScript('var link = document.getElementsByClassName("chakra-link")[0]; \
            link.click();')  // Execute JavaScript to click the home link
        }
        text: qsTr("Home")  // Text for the home action
      },
      RadialAction {
        id: back
        enabled: webview.canGoBack  // Enable back action if possible
        iconName: "go-previous"
        onTriggered: {
          webview.goBack()  // Navigate back in history
        }
        text: qsTr("Back")  // Text for the back action
      },
      RadialAction {
        id: favorites
        iconName: "like"
        onTriggered: {
          webview.runJavaScript('var link = document.getElementsByClassName("chakra-link")[3]; \
            link.click();')  // Execute JavaScript to click the favorites link
        }
        text: qsTr("Favorites")  // Text for the favorites action
      }
    ]
  }

  // Connection to handle input method visibility changes
  Connections {
    target: Qt.inputMethod
    onVisibleChanged: nav.visible = !nav.visible  // Toggle navigation visibility when input method visibility changes
  }

  // Connection to handle fullscreen changes in WebView
  Connections {
    target: webview
    onIsFullScreenChanged: {
      window.setFullscreen()  // Update the window's fullscreen state
      if (currentWebview.isFullScreen) {
        nav.state = "hidden"  // Hide navigation if in fullscreen
      } else {
        nav.state = "shown"  // Show navigation if not in fullscreen
      }
    }
  }

  // Function to set fullscreen mode
  function setFullscreen(fullscreen) {
    if (!window.forceFullscreen) {  // Check if force fullscreen is not enabled
      if (fullscreen) {
        if (window.visibility != Window.FullScreen) {
          internal.currentWindowState = window.visibility  // Store current window state
          window.visibility = Window.FullScreen  // Set window to fullscreen
        }
      } else {
        window.visibility = internal.currentWindowState  // Restore previous window state
      }
    }
  }

  // Connection to handle URI handler events
  Connections {
    target: UriHandler
    onOpened: {
      if (uris.length > 0) {
        console.log('Incoming call from UriHandler ' + uris[0]);  // Log the URI
        webview.url = uris[0];  // Load the URI in the WebView
      }
    }
  }

  // ScreenSaver configuration
  ScreenSaver {
    id: screenSaver
    screenSaverEnabled: !(Qt.application.active) || !webview.recentlyAudible  // Enable screen saver if application is not active or WebView is not recently audible
  }
}
