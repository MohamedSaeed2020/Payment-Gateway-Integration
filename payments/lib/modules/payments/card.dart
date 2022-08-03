import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:payments/modules/register/register.dart';
import 'package:payments/shared/components/components.dart';
import 'package:payments/shared/components/constants.dart';
import 'package:payments/shared/styles/colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentCardScreen extends StatelessWidget {
  const PaymentCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {
              exitDialog(context);
            },
            child: const Padding(
              padding: EdgeInsets.all(12.0),
              child: Icon(Icons.exit_to_app),
            ),
          )
        ],
      ),
      body: WebView(
        initialUrl:
            'https://accept.paymob.com/api/acceptance/iframes/439514?payment_token=$cardPaymentToken',
        javascriptMode: JavascriptMode.unrestricted,
        onProgress: (int progress) {
          log('WebView is loading (progress : $progress%)');
        },
        javascriptChannels: <JavascriptChannel>{
          _toasterJavascriptChannel(context),
        },
        navigationDelegate: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            log('blocking navigation to $request}');
            return NavigationDecision.prevent;
          }
          log('allowing navigation to $request');
          return NavigationDecision.navigate;
        },
        onPageStarted: (String url) {
          log('Page started loading: $url');
        },
        onPageFinished: (String url) {
          log('Page finished loading: $url');
        },
        gestureNavigationEnabled: true,
        backgroundColor: const Color(0x00000000),
      ),
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }

  void exitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text(
            'Are You Sure Completed Payment?',
            style: TextStyle(
              fontSize: 16,
              color: primaryColor,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                navigateAndRemoveUntil(context, RegisterScreen());
              },
              child: const Text(
                'Yes',
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'No',
              ),
            ),
          ],
        );
      },
    );
  }
}
