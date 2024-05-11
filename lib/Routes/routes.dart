import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoutingPage {
  static gotoNextPage({required BuildContext context, required gotoNextPage}) {
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => gotoNextPage));
  }

  static gotoNextPageP(
      {required BuildContext context, required gotoNextPagep}) {
    return Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => gotoNextPagep));
  }
}
