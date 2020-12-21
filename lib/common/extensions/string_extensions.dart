import 'package:flutter/material.dart';
import 'package:moviesapp_flutter/presentation/app_localizations.dart';

extension StringExtension on String {
  String intelliTrim() {
    return this.length > 15 ? '${this.substring(0, 15)}...' : this;
  }

  String t(BuildContext context) {
    return AppLocalizations.of(context).translate(this);
  }
}
