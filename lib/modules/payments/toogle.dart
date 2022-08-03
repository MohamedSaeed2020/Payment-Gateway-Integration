import 'package:flutter/material.dart';
import 'package:payments/modules/payments/card.dart';
import 'package:payments/modules/payments/kiosk.dart';
import 'package:payments/shared/components/components.dart';
import 'package:payments/shared/components/constants.dart';
import 'package:payments/shared/styles/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentMethodToogleScreen extends StatelessWidget {
  const PaymentMethodToogleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  //navigateAndRemoveUntil(context, const PaymentCardScreen());
                  launchURL();
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                    border: Border.all(
                      color: primaryColor,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Expanded(
                        child: Image(
                          image: AssetImage('assets/images/card.png'),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Pay With Card',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  navigateAndRemoveUntil(context, const PaymentKioskScreen());
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                    border: Border.all(
                      color: primaryColor,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Expanded(
                        child: Image(
                          image: AssetImage('assets/images/ref2.png'),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Pay With Reference Code',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void launchURL() async {
    String _url =
        'https://accept.paymob.com/api/acceptance/iframes/439514?payment_token=$cardPaymentToken';
    if (!await launch(_url)) throw 'Could not launch $_url$cardPaymentToken';
  }
}
