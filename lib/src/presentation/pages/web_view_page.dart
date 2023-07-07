import 'package:flutter/material.dart';
import 'package:gelp_questionnaire/src/presentation/utils/gelp_colors.dart';
import 'package:gelp_questionnaire/src/presentation/widgets/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final Function(bool) onAccept;
  final Function(WebResourceError) onError;

  const WebViewPage({
    super.key,
    required this.onAccept,
    required this.onError,
  });

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late final WebViewController _webViewController;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    const useTermURL =
        'https://docs.google.com/forms/d/e/1FAIpQLSeNj2WXz12-xD3L4r-rLvfBTc7aSP3-Kpqx6IZoSPHI6PSUiQ/viewform';
    // const useTermURL = 'https://www.google.com.br/';
    const acceptedURL =
        'https://docs.google.com/forms/d/e/1FAIpQLSeNj2WXz12-xD3L4r-rLvfBTc7aSP3-Kpqx6IZoSPHI6PSUiQ/formResponse';

    var controller = WebViewController.fromPlatformCreationParams(
      const PlatformWebViewControllerCreationParams(),
    );

    controller.setBackgroundColor(GelpColors.primary);
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
            setState(() {
              isLoading = true;
            });
          },
          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');
            setState(() {
              isLoading = false;
              if (url == acceptedURL) {
                Future.delayed(
                  const Duration(seconds: 2),
                  () {
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                );
                widget.onAccept(true);
              }
            });
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('''
                          Page resource error:
                          code: ${error.errorCode}
                          description: ${error.description}
                          errorType: ${error.errorType}
                          isForMainFrame: ${error.isForMainFrame}
                        ''');
            widget.onError(error);
          },
        ),
      )
      ..loadRequest(Uri.parse(useTermURL));

    _webViewController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GelpImageAppBar(
        showPopButton: true,
      ),
      backgroundColor: Colors.white,
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: GelpColors.primary,
              ),
            )
          : WebViewWidget(controller: _webViewController),
    );
  }
}
