import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BanjarbaruTv extends StatefulWidget {
  const BanjarbaruTv({super.key});

  @override
  State<BanjarbaruTv> createState() => _BanjarbaruTvState();
}

class _BanjarbaruTvState extends State<BanjarbaruTv> {
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
                .startsWith('https://www.youtube.com/@banjarbarutv6786/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(
        Uri.parse('https://www.youtube.com/@banjarbarutv6786/'),
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
