import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewHome extends StatelessWidget {
  const WebviewHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: WebViewWidget(
        controller: WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setBackgroundColor(const Color(0x00000000))
          ..loadRequest(
            Uri.parse(
                'https://www.figma.com/proto/qKjGUpaDpbgecjgouO7Gwr/Coinpay-Fintech-Finance-Mobile-App-UI-kit-(Community)-(Community)?node-id=176-1303&t=T27tm1jvCTGFvoGC-1'),
          ),
      ),
    );
  }
}
