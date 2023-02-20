import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class IdamanPenerbangan extends StatefulWidget {
  const IdamanPenerbangan({super.key});

  @override
  State<IdamanPenerbangan> createState() => _IdamanPenerbanganState();
}

class _IdamanPenerbanganState extends State<IdamanPenerbangan> {
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
            if (request.url.startsWith(
                'https://syamsudinnoor-airport.co.id/id/informasi-penerbangan-terbaru/index')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(
        Uri.parse(
            'https://syamsudinnoor-airport.co.id/id/informasi-penerbangan-terbaru/index'),
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
