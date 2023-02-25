import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paynes_kassa/common/style/images.dart';
import 'package:paynes_kassa/pages/home/screens/pay/payments/gos_uslugi/controller.dart';
import 'package:paynes_kassa/pages/home/screens/print_check/print_check.dart';
import 'package:pdf/pdf.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:printing/printing.dart';

import '../../../../../../../common/controller/telegram/send_message.dart';
import '../../../../../../../common/values/colors.dart';
import '../../../../print_check/print_check_controller.dart';
import '../../pay_to_props/controller.dart';

class MibDialog extends GetxController {
  final sendMsg = Get.put(SendMessageController());
  final controller = Get.put(GosUslugiController());
  final printController = Get.put(PrintCheck());
  void mathSum(percent, commissionSum, summa) {
    final controller = Get.put(PropsController());
    num commission = summa / 100 * percent + commissionSum;
    num total = summa + commission;
    dynamic totalCommission = total - summa;
    // String result = (total / 1000).toString();
    // double resultTotal = double.parse('$result 000'.replaceAll(' ', ''));
    // double resultCommission = resultTotal - summa;
    controller.totalSum.value = total.roundToDouble();
    controller.commission.value = totalCommission.roundToDouble();
  }

  Widget _buildPrintCheck() {
    final checkDetails = Get.put(PrintCheckController());
    return Container(
      width: 250.w,
      height: 350.h,
      decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(checkDetails.titleCheckName),
                  Text(checkDetails.titleLtdName),
                  Text(checkDetails.titleTypeWallet),
                  Text(checkDetails.date.toString()),
                  Text(checkDetails.totalSum),
                  Text(checkDetails.payHashCode),
                  Text(checkDetails.cashierName),
                  Text(checkDetails.cashierSign),
                ],
              ),
            ),
            const VerticalDivider(),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    checkDetails.payInCompanyName,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  Row(
                    children: [
                      //left body
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(checkDetails.payInBankNameTitle),
                            Divider(
                              color: Colors.transparent,
                            ),
                            Text(checkDetails.payInPropsTitle),
                            Divider(
                              color: Colors.transparent,
                            ),
                            Text(checkDetails.payInBankMfoTitle),
                            Divider(
                              color: Colors.transparent,
                            ),
                            Text(checkDetails.payInBankInnTitle),
                            Divider(
                              color: Colors.transparent,
                            ),
                          ],
                        ),
                      ),
                      //right body
                      Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(checkDetails.payInBankName),
                            Divider(
                              color: Colors.black,
                            ),
                            Text(checkDetails.payInProps),
                            Divider(
                              color: Colors.black,
                            ),
                            Text(checkDetails.payInBankMfo),
                            Divider(
                              color: Colors.black,
                            ),
                            Text(checkDetails.payInBankInn),
                            Divider(
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(checkDetails.payerName),
                      Divider(
                        color: Colors.black,
                      ),
                      Text(checkDetails.payerNameTitle),
                    ],
                  ),
                  Column(
                    children: [
                      Text(checkDetails.payAppoint),
                      Divider(
                        color: Colors.black,
                      ),
                      Text(checkDetails.payAppointTitle),
                    ],
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 20.w,
                        height: 20.w,
                        child: PrettyQr(
                          roundEdges: true,
                          size: 200,
                          data: "Paynes",
                          errorCorrectLevel: QrErrorCorrectLevel.M,
                        ),
                      ),
                      Expanded(flex: 2, child: Container()),
                      VerticalDivider(
                        color: Colors.black,
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  checkDetails.sumToPayTitle,
                                ),
                                VerticalDivider(
                                  color: Colors.black,
                                ),
                                Text(checkDetails.sumToPay)
                              ],
                            ),
                            Divider(
                              color: Colors.black,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  checkDetails.commissionPayTitle,
                                ),
                                VerticalDivider(
                                  color: Colors.black,
                                ),
                                Text(checkDetails.commissionPay)
                              ],
                            ),
                            Divider(
                              color: Colors.black,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  checkDetails.totalPayTitle,
                                ),
                                VerticalDivider(
                                  color: Colors.black,
                                ),
                                Text(checkDetails.totalSum)
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getFirstDialog(index) {
    Get.defaultDialog(
        barrierDismissible: false,
        title: controller.state.uslugi[index].link,
        content: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Image.asset(ImagesBox.mib_auksion_yur),
              TextField(
                maxLength: 14,
                cursorColor: AppColors.primaryText,
                controller: controller.xrController.value,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.primaryText),
                      gapPadding: 1,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  focusColor: AppColors.primaryText,
                  isDense: true,
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  labelText: 'Номер квитанции',
                ),
                onEditingComplete: () {
                  sendMsg.sendMessage(controller.xrController.value.text);
                },
              ),
            ],
          ),
        ));
  }

  void getDialogPayToProps20(index) {
    List items = [
      'Наличный',
      'Humo',
      'Uzcard',
      // 'Кэшбек',
      'Humo и Наличный',
      'Uzcard и Наличный',
      // 'Кэшбек и Наличный',
    ];
    Object? currentValue = items.first;
    Get.defaultDialog(
      barrierDismissible: false,
      title: controller.state.uslugi[index].link,
      content: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Obx(() {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                maxLength: 20,
                cursorColor: AppColors.primaryText,
                controller: controller.xrController.value,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.primaryText),
                      gapPadding: 1,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  focusColor: AppColors.primaryText,
                  isDense: true,
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  labelText: 'Введите ИНН',
                ),
                onEditingComplete: () {
                  sendMsg.sendMessage(controller.xrController.value.text);
                },
              ),

              // TextField(
              //   maxLength: 17,
              //   cursorColor: AppColors.primaryText,
              //   controller: controller.sumController.value,
              //   keyboardType: TextInputType.number,
              //   textInputAction: TextInputAction.next,
              //   inputFormatters: [
              //     FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              //     FilteringTextInputFormatter.digitsOnly
              //   ],
              //   decoration: const InputDecoration(
              //     suffixText: 'сўм',
              //     focusedBorder: OutlineInputBorder(
              //         borderSide: BorderSide(color: AppColors.primaryText),
              //         gapPadding: 1,
              //         borderRadius: BorderRadius.all(Radius.circular(10))),
              //     focusColor: AppColors.primaryText,
              //     isDense: true,
              //     errorBorder: OutlineInputBorder(
              //       borderSide: BorderSide(color: Colors.red),
              //     ),
              //     border: OutlineInputBorder(
              //         borderRadius: BorderRadius.all(Radius.circular(10))),
              //     labelText: 'Введите сумму оплаты',
              //   ),
              //   onChanged: (value) {
              //     final result = value.replaceAll(' ', '');
              //     // print(double.parse(result));
              //     mathSum(1.5, 2000, double.parse(result));
              //   },
              // ),
              // controller.totalSum.value != 0.0
              //     ? Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Text(
              //       'Сумма комиссии ${controller.moneyFormatter.copyWith(amount: controller.commission.value).output.nonSymbol} сўм',
              //       style: GoogleFonts.aBeeZee(color: Colors.red),
              //     ),
              //     Text(
              //       'Итого ${controller.moneyFormatter.copyWith(amount: controller.totalSum.value).output.nonSymbol} сўм',
              //       style: GoogleFonts.aBeeZee(color: Colors.green),
              //     ),
              //   ],
              // )
              //     : Container(),
              // SizedBox(
              //   height: 20.h,
              // ),
              // DropdownButtonFormField(
              //     value: currentValue,
              //     isDense: true,
              //     decoration: const InputDecoration(
              //       focusedBorder: OutlineInputBorder(
              //           borderSide: BorderSide(color: AppColors.primaryText),
              //           gapPadding: 1,
              //           borderRadius: BorderRadius.all(Radius.circular(10))),
              //       focusColor: AppColors.primaryText,
              //       isDense: true,
              //       errorBorder: OutlineInputBorder(
              //         borderSide: BorderSide(color: Colors.red),
              //       ),
              //       border: OutlineInputBorder(
              //           borderRadius: BorderRadius.all(Radius.circular(10))),
              //       labelText: 'Способ оплаты',
              //     ),
              //     items: items
              //         .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              //         .toList(),
              //     onChanged: (value) => currentValue = value),
            ],
          );
        }),
      ),
      cancel: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
        onPressed: () {
          controller.appointController.value.text = '';
          controller.mfoController.value.text = '';
          controller.xrController.value.text = '';
          controller.nameCorporateController.value.text = '';
          controller.sumController.value = MoneyMaskedTextController(
            decimalSeparator: '.',
            thousandSeparator: ' ',
          );
          controller.commission.value = 0.0;
          controller.totalSum.value = 0.0;
          sendMsg.cancel();
          Get.back(closeOverlays: true);
        },
        child: const Text(
          'Отмена',
          style: TextStyle(color: Colors.white),
        ),
      ),
      confirm: ElevatedButton(
        style:
            ElevatedButton.styleFrom(backgroundColor: AppColors.primaryElement),
        onPressed: () {
          Get.defaultDialog(
              title: 'Квитанция',
              content: Container(
                width: 400.w,
                height: 500.h,
                child: PdfPreview(
                  build: (format) => printController.generatePdf(
                    PdfPageFormat.a4.copyWith(
                      marginTop: 15.0,
                      marginLeft: 15.0,
                      marginRight: 15.0,
                    ),
                  ),
                ),
              ));
          // printController.printPropsCheck();
          // Get.defaultDialog(
          //   title: 'Квитанция',
          //   content: _buildPrintCheck(),
          // );
        },
        child: const Text(
          'Оплатить',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
