import 'package:flutter/cupertino.dart';

abstract class TextStyles {
  static const eventNameStyle = TextStyle(
    color: CupertinoColors.black,
    fontWeight: FontWeight.w600,
  );
  static const eventPlaceStyle = TextStyle(
    color: CupertinoColors.systemGrey,
    fontWeight: FontWeight.w500,
  );
  static const dayNameStyle = TextStyle(
    color: CupertinoColors.black,
    fontSize: 15.5,
    fontWeight: FontWeight.w500,
  );
}
