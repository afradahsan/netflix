import 'package:flutter/material.dart';

class Constants{
  static SizedBox sizedten(BuildContext ctx) {
    return SizedBox(height: (MediaQuery.of(ctx).size.height)/80,);
  }
  static SizedBox sizedtwenty(BuildContext ctx) {
    return SizedBox(height: (MediaQuery.of(ctx).size.height)/40,);
  }
}