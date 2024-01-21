import 'package:flutter/material.dart';
import 'package:whats_app_clone/modules/authinticate/enter_phone_page.dart';
import 'package:whats_app_clone/shared/components/components.dart';
import 'package:whats_app_clone/shared/styles/styles.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class PolicyAgree extends StatelessWidget {
  const PolicyAgree({Key? key}) : super(key: key);

  void acceptButtonSubmit(BuildContext context) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.ethernet) {
      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const EnterPhoneView(),
          ),
        );
      }
    } else {
      if (context.mounted) {
        showAlertDialog(
          context,
          text: 'A cellular data network is required to active WhatsApp Messenger.',
          title: 'Alert',
        );
      }

      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: double.infinity,
              child: FittedBox(
                child: Text(
                  'Welcome to WhatsApp',
                  style: Theme.of(context).textTheme.displayLarge,
                  maxLines: 1,
                ),
              ),
            ),
            Image.asset(
              'assets/images/image1.jpg',
              width: double.infinity,
              fit: BoxFit.contain,
            ),
            Column(
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Read our ',
                    style: greyTextStyle,
                    children: <TextSpan>[
                      TextSpan(text: 'Privacy policy', style: blueTextStyle),
                      TextSpan(
                          text: '. Tap "Agree and continue" to accept the ', style: greyTextStyle),
                      TextSpan(text: 'Terms of Service', style: blueTextStyle),
                      TextSpan(text: '.', style: greyTextStyle),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                defaultButton(
                    context: context,
                    text: 'AGREE AND CONTINUE',
                    width: double.infinity,
                    onTap: () => acceptButtonSubmit(context)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
