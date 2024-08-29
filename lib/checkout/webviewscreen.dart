import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class WebviewScreen extends StatelessWidget {
  const WebviewScreen({super.key, required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {


    final WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://18.143.206.136/api/payment/execute/?paymentId=PAYID-M3H7R7Q4C119875AT841503S&token=EC-3A653758636168226&PayerID=ZSVBFLZEMDX58 ')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(url));
    return Scaffold(
      appBar: AppBar(title: const Text('PAYMENT')),
      body: WebViewWidget(controller: controller),
    );
  }
}
