import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:whats_app_clone/shared/styles/styles.dart';

void pageNavigation(BuildContext context, Widget page) {
  Navigator.push(context,
      PageTransition(type: PageTransitionType.rightToLeft, child: page));
}

void showAlertDialog(BuildContext context,
    {required String text, String? title}) {
  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: title != null
          ? Text(
              title,
              style: defaultTitleStyle,
            )
          : null,
      content: Text(
        text,
        style: defaultTextStyle,
      ),
      actions: [
        TextButton(
            onPressed:() =>  Navigator.of(context).pop(),
            child: Text(
              'Ok',
              style: darkGreenTextStyle,
            )),
      ],
    ),
  );
}


Widget defaultButton(
        {required BuildContext context,
        required String text,
        required double width,
        required Function() onTap}) =>
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      height: 40,
      width: width,
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(text),
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3.0),
        ))),
      ),
    );
