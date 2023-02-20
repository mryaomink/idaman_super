import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class IdamanCctv extends StatefulWidget {
  const IdamanCctv({super.key});

  @override
  State<IdamanCctv> createState() => _IdamanCctvState();
}

class _IdamanCctvState extends State<IdamanCctv> {
  late WebViewController _webViewController;
  @override
  void initState() {
    super.initState();
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0xff000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://cctv.banjarbarukota.go.id/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(
        Uri.parse('https://cctv.banjarbarukota.go.id/'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: WebViewWidget(controller: _webViewController),
            )
          ],
        ),
      ),
    );
  }
}
