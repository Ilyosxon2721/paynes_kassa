import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class PrintCheckController extends GetxController {
  //check left container
  final titleCheckName = 'КВИТАНЦИЯ';
  final titleLtdName = 'Paynes';
  final titleTypeWallet = 'Тип платежа: Наличный';
  final date = DateTime.now();
  final totalSum = '305 000.00 сум';
  final payHashCode = '51561651651561651651651';
  final cashierName = 'Собиров Илёсхон Илхомович';
  final cashierSign = "Подпись оператора ____________";
  late Widget qrCode = PrettyQr(
    image: Image.asset('assets/images/PaynesLogo.png').image,
    roundEdges: true,
    size: 20,
    data: "Paynes",
    errorCorrectLevel: QrErrorCorrectLevel.M,
  );
  //check right container
  //titles
  final payInBankNameTitle = 'Наименование банка';
  final payInBankMfoTitle = 'МФО банка получателя';
  final payInBankInnTitle = 'ИНН';
  final payInPropsTitle = 'Р/с получателя';
  final payerNameTitle = "Плательщик";
  final payAppointTitle = 'Назначение платежа';
  final sumToPayTitle = 'Сумма платежа';
  final commissionPayTitle = 'Комиссия';
  final totalPayTitle = 'Итого';
  //body
  final payInCompanyName = 'OOO RIS ONLINE';
  final payInBankName = 'ТОШКЕНТ Ш., "ANOR BANK" АКЦИЯДОРЛИК ЖАМИЯТИ';
  final payInBankMfo = '01183';
  final payInBankInn = '207125356';
  final payInProps = '20208000305165312002';
  final payerName = "Собиров Илёсхон";
  final payAppoint = 'Курсатилган хизматлар учун';
  final sumToPay = '300 000.00 сум';
  final commissionPay = '5 000.00 сум';
}
