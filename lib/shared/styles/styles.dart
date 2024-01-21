import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

TextStyle defaultTextStyle = const TextStyle(fontSize: 18.0);
TextStyle defaultTitleStyle = const TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

TextStyle blueTextStyle = TextStyle(
  color: Colors.blue[700],
  fontSize: 18.0,
);

TextStyle greyTextStyle = TextStyle(
  color: greyColor,
  fontSize: 18.0,
);

TextStyle darkGreenTextStyle = TextStyle(
  color: darkGreenColor,
  fontSize: 18.0,
);
TextStyle darkGreenTitleStyle = TextStyle(
  color: darkGreenColor,
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
);

TextStyle inputHintText = GoogleFonts.roboto(
  textStyle: TextStyle(
    color: greyColor,
    fontSize: 18.0,
  ),
);

TextStyle tileTitleStyle = const TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.bold,
);
TextStyle tileSubtitleStyle = TextStyle(
  fontSize: 16.0,
  color: greyColor,
);
TextStyle tileTrailingStyle = TextStyle(
  fontSize: 20.0,
  color: greyColor,
  fontWeight: FontWeight.bold,
);

TextStyle displayLarge = GoogleFonts.roboto(
  textStyle: TextStyle(
    color: darkGreenColor,
    fontWeight: FontWeight.bold,
  ),
);
TextStyle displayMedium = GoogleFonts.roboto(
  textStyle: TextStyle(
    color: darkGreenColor,
    fontWeight: FontWeight.bold,
    fontSize: 22.0,
  ),
);
