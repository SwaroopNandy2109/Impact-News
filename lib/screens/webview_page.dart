import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final String url;

  const WebViewPage({this.url});
  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Web View"),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: WebView(
        initialUrl: widget.url,
        //javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
