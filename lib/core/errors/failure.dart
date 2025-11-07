import 'package:escrivah/core/helpers/functions.dart';
import 'package:flutter/material.dart';

final class Failure {
  final String message;
  Failure([this.message = 'Ocorreu um erro inesperado.']);

  void show(BuildContext context) {
    showSnackBar(context, message, Colors.red);
  }
}
