import '../../../../../../common/res/payments/payments.dart';
import '../../../../../../common/style/images.dart';

class PropsState {
  List<Pay> props = [
    Pay(
      id: 0,
      iconLink: ImagesBox.rekvizit_20,
      title: "Оплата по реквизитам",
      link: "🔹 ОПЛАТА НА РАСЧЕТНЫЙ СЧЕТ (20 ЗНАКОВ)",
      route: 'rekvizit20',
      commissionPercent: 1,
      commissionSum: 2000,
    ),
    Pay(
      id: 1,
      iconLink: ImagesBox.rekvizit_25_27,
      title: "Оплата по реквизитам",
      link: "ОПЛАТА В ГОСУДАРСТВЕННЫЙ БЮДЖЕТ (25-27 ЗНАКОВ)",
      route: 'rekvizit25_27',
      commissionPercent: 1,
      commissionSum: 2000,
    ),
  ];
}
