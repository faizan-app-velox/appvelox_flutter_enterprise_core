// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Estudio AppVelox';

  @override
  String get monthlyRevenue => 'Ingresos Mensuales';

  @override
  String get recentTransactions => 'Transacciones Recientes';

  @override
  String get clientPayment => 'Pago del Cliente';

  @override
  String get paymentReceived => 'Pago Recibido';

  @override
  String get subscriptionCost => 'Costo de Suscripción';

  @override
  String get archService => 'Servicio de Arquitectura';

  @override
  String get softLicense => 'Licencia de Software';

  @override
  String get transferSuccessful => 'Transferencia Exitosa';

  @override
  String get paymentSent => 'Pago Enviado';

  @override
  String get statusCompleted => 'Completado';

  @override
  String get shareReceipt => 'Compartir Recibo';

  @override
  String get details => 'Detalles';

  @override
  String get allTransactions => 'Todas las Transacciones';

  @override
  String get seeAll => 'Ver Todo';

  @override
  String shareTransactionText(String amount, String status) {
    return 'Detalles: $amount\nEstado: $status\n\nEnviado vía AppVelox Studio';
  }

  @override
  String get noInternetConnection =>
      'It seems, there is no internet access, try again later.';

  @override
  String get thereIsSomeProblem => 'There is some problem!';

  @override
  String get tryAgain => 'Try Again';
}
