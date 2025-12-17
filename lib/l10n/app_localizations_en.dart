// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'AppVelox Studio';

  @override
  String get monthlyRevenue => 'Monthly Revenue';

  @override
  String get recentTransactions => 'Recent Transactions';

  @override
  String get clientPayment => 'Client Payment';

  @override
  String get paymentReceived => 'Payment Received';

  @override
  String get subscriptionCost => 'Subscription Cost';

  @override
  String get archService => 'App Development Service';

  @override
  String get softLicense => 'Software License';

  @override
  String get transferSuccessful => 'Transfer Successful';

  @override
  String get paymentSent => 'Payment Sent';

  @override
  String get statusCompleted => 'Completed';

  @override
  String get shareReceipt => 'Share Receipt';

  @override
  String get details => 'Details';

  @override
  String get allTransactions => 'All Transactions';

  @override
  String get seeAll => 'See All';

  @override
  String shareTransactionText(String amount, String status) {
    return 'Details: $amount\nStatus: $status\n\nSent via AppVelox Studio';
  }

  @override
  String get noInternetConnection =>
      'It seems, there is no internet access, try again later.';

  @override
  String get thereIsSomeProblem => 'There is some problem!';

  @override
  String get tryAgain => 'Try Again';
}
