import 'package:flutter/material.dart';

import 'app_localizations.dart';

extension LocalizationX on BuildContext {
  AppLocalizations get l10n {
    final localizations = AppLocalizations.of(this);

    if (localizations == null) {
      throw Exception(
        '❌ Localizations not found! \n'
        'Make sure you are calling context.l10n inside a MaterialApp '
        'and that AppLocalizations.delegate is added to localizationsDelegates.',
      );
    }

    return localizations;
  }
}
