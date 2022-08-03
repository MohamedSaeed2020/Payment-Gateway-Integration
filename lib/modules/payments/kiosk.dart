import 'package:flutter/material.dart';
import 'package:payments/shared/components/constants.dart';
import 'package:payments/shared/styles/colors.dart';

class PaymentKioskScreen extends StatelessWidget {
  const PaymentKioskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Go To Any Market To Pay',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'This Is Your Reference Code',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Card(
              elevation: 12.0,
              shape: Border.all(
                color: primaryColor,
                width: 1,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  referenceCode,
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
