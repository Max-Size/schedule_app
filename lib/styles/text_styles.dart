import 'package:flutter/cupertino.dart';

abstract class TextStyles {
  static const eventNameStyle = TextStyle(
    fontSize: 13,
    color: CupertinoColors.black,
    fontWeight: FontWeight.w600,
  );
  static const eventPlaceStyle = TextStyle(
    fontSize: 11,
    color: CupertinoColors.systemGrey,
    fontWeight: FontWeight.w500,
  );
  static const dayNameStyle = TextStyle(
    color: CupertinoColors.black,
    fontSize: 15.5,
    fontWeight: FontWeight.w500,
  );
}
