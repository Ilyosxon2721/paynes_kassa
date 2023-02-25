import 'package:get/get.dart';
import 'package:paynes_kassa/common/routes/names.dart';
import 'package:paynes_kassa/common/style/images.dart';

class Payment {
  int id;
  String iconLink;
  String title;
  String link;
  String route;
  // String textFieldTitle;
  // double commissionPercent;
  // int commissionSum;

  Payment(
    this.id,
    this.iconLink,
    this.title,
    this.link,
    this.route,
  );
}

class Pay {
  int id;
  String iconLink;
  String title;
  String link;

  double commissionPercent;
  int commissionSum;
  String route;

  Pay(
      {required this.id,
      required this.iconLink,
      required this.title,
      required this.link,
      required this.route,
      required this.commissionPercent,
      required this.commissionSum});
}

class Payments extends GetxController {
  List<Payment> payments = [
    Payment(
      0,
      ImagesBox.rekvizitLogo,
      "Оплата по реквизитам",
      "📑 Оплата по реквизитам",
      AppRoutes.verifyWithQr,
    ),
    Payment(
      1,
      ImagesBox.budgetLogo,
      "Гос.платежи и ГСБДД (ГАИ)",
      "🏛 Гос. платежи и ГСБДД (ГАИ)",
      AppRoutes.verifyWithQr,
    ),
    Payment(
      2,
      ImagesBox.comunalLogo,
      "Коммунальные платежи",
      "🏡 Коммунальные платежи",
      AppRoutes.verifyWithQr,
    ),
    Payment(
      3,
      ImagesBox.creditPercentLogo,
      "Погашение кредита",
      "🏦 Погашение кредита",
      AppRoutes.verifyWithQr,
    ),
    Payment(
      4,
      ImagesBox.taxLogo,
      "Налоги",
      "⚖ Налоги",
      AppRoutes.verifyWithQr,
    ),
    Payment(
      5,
      ImagesBox.insuranceLogo,
      "Страхование",
      "🛡 Страхование",
      AppRoutes.verifyWithQr,
    ),
    Payment(
      6,
      ImagesBox.educationLogo,
      "Образование",
      "🎓 Образование",
      AppRoutes.verifyWithQr,
    ),
  ];
}
