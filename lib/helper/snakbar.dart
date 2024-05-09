import 'package:flutter/material.dart';

void showSnakbar(BuildContext context, String messageSnak) {
  ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(messageSnak)));
}
