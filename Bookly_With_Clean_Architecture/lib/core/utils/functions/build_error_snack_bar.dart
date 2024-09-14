import 'package:flutter/material.dart';

SnackBar buildErrorSnackBar(String errMessage) {
  return SnackBar(
    backgroundColor: Colors.red,
    content: Text(
      errMessage,
      style: const TextStyle(color: Colors.white),
    ),
    duration: const Duration(seconds: 3),
  );
}
