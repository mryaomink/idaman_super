import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class IdamanBapok extends StatefulWidget {
  const IdamanBapok({super.key});

  @override
  State<IdamanBapok> createState() => _IdamanBapokState();
}

class _IdamanBapokState extends State<IdamanBapok> {
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
            if (request.url
                .startsWith('https://infobapokting.banjarbarukota.go.id/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(
        Uri.parse('https://infobapokting.banjarbarukota.go.id/'),
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
