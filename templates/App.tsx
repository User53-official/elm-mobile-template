import React from 'react';
import {SafeAreaView} from 'react-native';
import WebView from 'react-native-webview';

const App = () => {
  return (
    <SafeAreaView style={{flex: 1}}>
      <WebView
        source={{
          uri: 'file:///android_asset/index.html',
        }}
        javaScriptEnabled={true}
        domStorageEnabled={true}
        sharedCookiesEnabled={true}
        originWhitelist={['*']}
        scalesPageToFit={true}
        startInLoadingState={true}
        mixedContentMode={'always'}
        allowsInlineMediaPlayback={true}
        allowsFullscreenVideo={true}
        allowsLinkPreview={false}
        renderLoading={() => <></>}
      />
    </SafeAreaView>
  );
};

export default App;
