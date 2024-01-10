import 'package:flutter/material.dart';

class Constants{
  static SizedBox sizedten(BuildContext ctx) {
    return SizedBox(height: (MediaQuery.of(ctx).size.height)/80,);
  }
  static SizedBox sizedtwenty(BuildContext ctx) {
    return SizedBox(height: (MediaQuery.of(ctx).size.height)/40,);
  }
  static SizedBox sizedwten(BuildContext ctx) {
    return SizedBox(width: (MediaQuery.of(ctx).size.height)/80,);
  }
}