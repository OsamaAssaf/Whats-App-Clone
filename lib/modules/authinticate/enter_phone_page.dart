import 'dart:io';

import 'package:flutter/material.dart';
import 'package:whats_app_clone/layout/country_list_layout.dart';
import 'package:whats_app_clone/modules/other/help_page.dart';
import 'package:whats_app_clone/shared/components/components.dart';
import 'package:whats_app_clone/shared/components/constansts.dart';
import 'package:whats_app_clone/shared/network/remote/authinticate/phone_auth.dart';
import 'package:whats_app_clone/shared/styles/colors.dart';
import 'package:whats_app_clone/shared/styles/styles.dart';

class EnterPhoneView extends StatefulWidget {
  const EnterPhoneView({Key? key}) : super(key: key);

  @override
  State<EnterPhoneView> createState() => _EnterPhoneViewState();
}

class _EnterPhoneViewState extends State<EnterPhoneView> {
  double borderWidth = 1.0;
  String? countryName;
  String? countryPhoneCode;

  late TextEditingController _phoneNumberController;

  navigateToHelpPage(BuildContext context) {
    pageNavigation(context, const HelpPage());
  }

  void nextButtonSubmit() {
    if (_phoneNumberController.text == '') {
      showAlertDialog(context, text: 'Please enter your phone number.');
      return;
    }
    String phoneNumber = '$countryPhoneCode${_phoneNumberController.text}';
    print(phoneNumber);
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text(
                'You entered the phone number:',
                style: defaultTextStyle,
              ),
              content: RichText(
                  text: TextSpan(
                      text: phoneNumber,
                      style: defaultTitleStyle,
                      children: <TextSpan>[
                    TextSpan(
                        text:
                            '\n\nIs this OK, or would you like to edit the number?',
                        style: defaultTextStyle),
                  ]),
              ),
          actions: [
            TextButton(onPressed: (){}, child:const Text('OK')),
            TextButton(onPressed: (){Navigator.of(ctx).pop();}, child:const Text('Edit')),
          ],
            ));
  }

  void showCountryPicker() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => const CountryListLayout()))
        .then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        countryName = countryList.firstWhere(
            (element) => element['code']!.toLowerCase() == value)['name'];
        countryPhoneCode = countryList
            .firstWhere((element) => element['code']!.toLowerCase() == value)[
                'dialCode']!
            .replaceFirst('+', '');
      });
    });
  }

  @override
  void initState() {
    _phoneNumberController = TextEditingController();
    final String defaultLocale = Platform.localeName;
    setState(() {
      countryName = countryList.firstWhere(
          (element) => element['code'] == defaultLocale.split('_')[1])['name'];
      countryPhoneCode = countryList
          .firstWhere((element) =>
              element['code'] == defaultLocale.split('_')[1])['dialCode']!
          .replaceFirst('+', '');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'Enter your phone number',
          style: Theme.of(context).textTheme.headline2,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: greyColor,
        actions: [
          PopupMenuButton(
            itemBuilder: (BuildContext ctx) => <PopupMenuItem>[
              PopupMenuItem(
                height: 40,
                child: const SizedBox(
                  width: 100,
                  child: Text('Help'),
                ),
                onTap: () {
                  pageNavigation(context, const HelpPage());
                },
              ),
            ],
          ),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'WhatsApp will need to verify your phone number.',
                style: defaultTextStyle,
                textAlign: TextAlign.center,
              ),
              RichText(
                  text: TextSpan(
                      text: 'What\'s my number?', style: blueTextStyle)),
              GestureDetector(
                child: Container(
                  height: 40,
                  width: 250,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: borderWidth, color: darkGreenColor))),
                  child: Row(
                    children: [
                      Expanded(child: Center(child: Text(countryName!))),
                      const Icon(Icons.arrow_drop_down_outlined),
                    ],
                  ),
                ),
                onTap: showCountryPicker,
                onTapCancel: () {
                  setState(() {
                    borderWidth = 1.0;
                  });
                },
                onTapDown: (_) {
                  setState(() {
                    borderWidth = 2.0;
                  });
                },
                onTapUp: (_) {
                  setState(() {
                    borderWidth = 1.0;
                  });
                },
              ),
              SizedBox(
                width: 250,
                height: 40,
                child: Row(
                  children: [
                    SizedBox(
                      width: 50,
                      child: TextField(
                        controller:
                            TextEditingController(text: countryPhoneCode),
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: darkGreenColor),
                          ),
                          prefix: Icon(
                            Icons.add,
                            size: 10,
                            color: greyColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                      child: TextField(
                        controller: _phoneNumberController,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: darkGreenColor),
                          ),
                          hintText: 'phone number',
                          hintStyle: inputHintText,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Text(
                'Carrier charges may apply',
                style: greyTextStyle,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: defaultButton(
          context: context, text: 'NEXT', width: 150, onTap: nextButtonSubmit),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
