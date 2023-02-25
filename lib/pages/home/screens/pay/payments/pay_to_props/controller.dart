import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:money_formatter/money_formatter.dart';

import 'index.dart';

class PropsController extends GetxController {
  PropsController();
  final controller = PageController().obs;
  Rx<TextEditingController> xrController = TextEditingController().obs;
  Rx<TextEditingController> nameCorporateController =
      TextEditingController().obs;
  Rx<TextEditingController> mfoController = TextEditingController().obs;
  Rx<TextEditingController> appointController = TextEditingController().obs;
  final sumController = MoneyMaskedTextController(
    decimalSeparator: '.',
    thousandSeparator: ' ',
  ).obs;
  MoneyFormatter moneyFormatter = MoneyFormatter(
      amount: 12345678.9012345,
      settings: MoneyFormatterSettings(
          thousandSeparator: ' ',
          decimalSeparator: '.',
          compactFormatType: CompactFormatType.short));
  final sumInputFormat = MoneyMaskedTextController();

  RxDouble commission = 0.0.obs;
  RxDouble totalSum = 0.0.obs;
  String validateXr20(String value) {
    if (value.length == 20) {
      return "Р/с должен быть 20 знаков";
    }
    return 'null';
  }

  final state = PropsState();
}
