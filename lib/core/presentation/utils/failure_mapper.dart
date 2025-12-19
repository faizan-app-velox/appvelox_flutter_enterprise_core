import 'package:flutter/material.dart';

import '../../../l10n/localization_extension.dart';
import '../../error/failure.dart';

extension FailureMapper on Failure {
  String toMessage(BuildContext context) {
    if (this is NoInternetFailure) {
      return context.l10n.noInternetConnection;
    } else if (this is SomeErrorFailure) {
      return context.l10n.thereIsSomeProblem;
    }
    return context.l10n.thereIsSomeProblem;
  }
}
