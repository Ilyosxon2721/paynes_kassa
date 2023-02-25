import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import 'print_check_controller.dart';

class PrintCheck extends GetxController {
  final black = PdfColor.fromHex('000000FF');
  final transparent = PdfColor.fromHex('FFFFFFFF');
  final checkDetails = Get.put(PrintCheckController());

  Future<Uint8List> generatePdf(
    PdfPageFormat format,
  ) async {
    final doc = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
    final fontBlack = await PdfGoogleFonts.robotoBlack();
    final font = await PdfGoogleFonts.robotoMedium();
    double fontSizeMedium = 6.0;
    double fontSize = 7.0;
    double fontSizeBold = 9.0;
    double dividerHeight = 6.0;
    doc.addPage(
      pw.Page(
        pageFormat: format,
        build: (context) {
          return pw.Column(children: [
            pw.Container(
              decoration: pw.BoxDecoration(
                  border: pw.Border.all(),
                  borderRadius: const pw.BorderRadius.only(
                      topLeft: pw.Radius.circular(12),
                      topRight: pw.Radius.circular(12),
                      bottomLeft: pw.Radius.circular(12))),
              height: 170,
              child: pw.Row(
                children: [
                  pw.Expanded(
                    flex: 1,
                    child: pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text(checkDetails.titleCheckName,
                            style: pw.TextStyle(
                                font: fontBlack,
                                fontSize: fontSizeBold,
                                fontWeight: pw.FontWeight.bold)),
                        pw.Text(checkDetails.titleLtdName,
                            style: pw.TextStyle(
                                font: fontBlack, fontSize: fontSizeBold)),
                        pw.Text(checkDetails.titleTypeWallet,
                            style:
                                pw.TextStyle(font: font, fontSize: fontSize)),
                        pw.Text(checkDetails.date.toString(),
                            style:
                                pw.TextStyle(font: font, fontSize: fontSize)),
                        pw.Text(checkDetails.totalSum,
                            style: pw.TextStyle(
                                font: fontBlack, fontSize: fontSizeBold)),
                        pw.Text(checkDetails.payHashCode,
                            style:
                                pw.TextStyle(font: font, fontSize: fontSize)),
                        pw.Text(checkDetails.cashierName,
                            style: pw.TextStyle(
                                font: font, fontSize: fontSizeBold)),
                        pw.Text(checkDetails.cashierSign,
                            style:
                                pw.TextStyle(font: font, fontSize: fontSize)),
                      ],
                    ),
                  ),
                  pw.VerticalDivider(),
                  pw.Expanded(
                    flex: 2,
                    child: pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text(
                          checkDetails.payInCompanyName,
                          style: pw.TextStyle(
                              font: fontBlack, fontSize: fontSizeBold),
                        ),
                        pw.Divider(
                          color: black,
                          height: dividerHeight,
                        ),
                        pw.Row(
                          children: [
                            //left body
                            pw.Expanded(
                              flex: 1,
                              child: pw.Column(
                                mainAxisAlignment:
                                    pw.MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Text(checkDetails.payInBankNameTitle,
                                      style: pw.TextStyle(
                                          font: fontBlack, fontSize: fontSize)),
                                  pw.Container(height: dividerHeight),
                                  pw.Text(checkDetails.payInPropsTitle,
                                      style: pw.TextStyle(
                                          font: fontBlack, fontSize: fontSize)),
                                  pw.Container(height: dividerHeight),
                                  pw.Text(checkDetails.payInBankMfoTitle,
                                      style: pw.TextStyle(
                                          font: fontBlack, fontSize: fontSize)),
                                  pw.Container(height: dividerHeight),
                                  pw.Text(checkDetails.payInBankInnTitle,
                                      style: pw.TextStyle(
                                          font: fontBlack, fontSize: fontSize)),
                                  pw.Container(height: dividerHeight),
                                ],
                              ),
                            ),
                            //right body
                            pw.Expanded(
                              flex: 2,
                              child: pw.Column(
                                mainAxisAlignment:
                                    pw.MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Text(checkDetails.payInBankName,
                                      style: pw.TextStyle(
                                          font: font, fontSize: fontSize)),
                                  pw.Divider(
                                    color: black,
                                    height: dividerHeight,
                                  ),
                                  pw.Text(checkDetails.payInProps,
                                      style: pw.TextStyle(
                                          font: font, fontSize: fontSize)),
                                  pw.Divider(
                                      color: black,
                                      height: dividerHeight,
                                      indent: 0),
                                  pw.Text(checkDetails.payInBankMfo,
                                      style: pw.TextStyle(
                                          font: font, fontSize: fontSize)),
                                  pw.Divider(
                                    color: black,
                                    height: dividerHeight,
                                  ),
                                  pw.Text(checkDetails.payInBankInn,
                                      style: pw.TextStyle(
                                          font: font, fontSize: fontSize)),
                                  pw.Divider(
                                    color: black,
                                    height: dividerHeight,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        pw.Column(
                          children: [
                            pw.Text(checkDetails.payerName,
                                style: pw.TextStyle(
                                    font: fontBlack, fontSize: fontSizeBold)),
                            pw.Divider(
                              color: black,
                              height: dividerHeight,
                            ),
                            pw.Text(checkDetails.payerNameTitle,
                                style: pw.TextStyle(
                                    font: font, fontSize: fontSizeMedium)),
                          ],
                        ),
                        pw.Column(
                          children: [
                            pw.Text(checkDetails.payAppoint,
                                style: pw.TextStyle(
                                    font: fontBlack, fontSize: fontSizeBold)),
                            pw.Divider(
                              color: black,
                              height: dividerHeight,
                            ),
                            pw.Text(checkDetails.payAppointTitle,
                                style: pw.TextStyle(
                                    font: font, fontSize: fontSizeMedium)),
                          ],
                        ),
                        pw.Divider(
                          color: black,
                          height: dividerHeight,
                        ),
                        pw.Row(
                          children: [
                            pw.Container(
                                // width: 20.w,
                                // height: 20.w,
                                // child: pw.PrettyQr(
                                //   roundEdges: true,
                                //   size: 200,
                                //   data: "Paynes",
                                //   errorCorrectLevel: QrErrorCorrectLevel.M,
                                // ),
                                ),
                            pw.Expanded(flex: 2, child: pw.Container()),
                            pw.Expanded(
                              flex: 1,
                              child: pw.Container(
                                decoration: const pw.BoxDecoration(
                                    border: pw.Border(left: pw.BorderSide())),
                                child: pw.Column(
                                  mainAxisAlignment:
                                      pw.MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: pw.CrossAxisAlignment.end,
                                  children: [
                                    pw.Padding(
                                      padding: const pw.EdgeInsets.only(
                                          left: 2.0, right: 2.0),
                                      child: pw.Row(
                                        mainAxisAlignment:
                                            pw.MainAxisAlignment.spaceBetween,
                                        children: [
                                          pw.Text(checkDetails.sumToPayTitle,
                                              style: pw.TextStyle(
                                                  font: font,
                                                  fontSize: fontSize)),
                                          pw.Text(checkDetails.sumToPay,
                                              style: pw.TextStyle(
                                                  font: font,
                                                  fontSize: fontSize))
                                        ],
                                      ),
                                    ),
                                    pw.Divider(
                                        color: black,
                                        height: dividerHeight,
                                        indent: 0),
                                    pw.Padding(
                                      padding: const pw.EdgeInsets.only(
                                          left: 2.0, right: 2.0),
                                      child: pw.Row(
                                        mainAxisAlignment:
                                            pw.MainAxisAlignment.spaceBetween,
                                        children: [
                                          pw.Text(
                                              checkDetails.commissionPayTitle,
                                              style: pw.TextStyle(
                                                  font: font,
                                                  fontSize: fontSize)),
                                          pw.Text(checkDetails.commissionPay,
                                              style: pw.TextStyle(
                                                  font: font,
                                                  fontSize: fontSize))
                                        ],
                                      ),
                                    ),
                                    pw.Divider(
                                        color: black,
                                        height: dividerHeight,
                                        indent: 0),
                                    pw.Padding(
                                      padding: const pw.EdgeInsets.only(
                                          left: 2.0, right: 2.0),
                                      child: pw.Row(
                                        mainAxisAlignment:
                                            pw.MainAxisAlignment.spaceBetween,
                                        children: [
                                          pw.Text(checkDetails.totalPayTitle,
                                              style: pw.TextStyle(
                                                  font: font,
                                                  fontSize: fontSize)),
                                          pw.Text(checkDetails.totalSum,
                                              style: pw.TextStyle(
                                                  font: font,
                                                  fontSize: fontSize))
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
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
            pw.SizedBox(height: 10),
            pw.Container(
              decoration: pw.BoxDecoration(
                  border: pw.Border.all(),
                  borderRadius: const pw.BorderRadius.only(
                      topLeft: pw.Radius.circular(12),
                      topRight: pw.Radius.circular(12),
                      bottomLeft: pw.Radius.circular(12))),
              height: 170,
              child: pw.Row(
                children: [
                  pw.Expanded(
                    flex: 1,
                    child: pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text(checkDetails.titleCheckName,
                            style: pw.TextStyle(
                                font: fontBlack,
                                fontSize: fontSizeBold,
                                fontWeight: pw.FontWeight.bold)),
                        pw.Text(checkDetails.titleLtdName,
                            style: pw.TextStyle(
                                font: fontBlack, fontSize: fontSizeBold)),
                        pw.Text(checkDetails.titleTypeWallet,
                            style:
                                pw.TextStyle(font: font, fontSize: fontSize)),
                        pw.Text(checkDetails.date.toString(),
                            style:
                                pw.TextStyle(font: font, fontSize: fontSize)),
                        pw.Text(checkDetails.totalSum,
                            style: pw.TextStyle(
                                font: fontBlack, fontSize: fontSizeBold)),
                        pw.Text(checkDetails.payHashCode,
                            style:
                                pw.TextStyle(font: font, fontSize: fontSize)),
                        pw.Text(checkDetails.cashierName,
                            style: pw.TextStyle(
                                font: font, fontSize: fontSizeBold)),
                        pw.Text(checkDetails.cashierSign,
                            style:
                                pw.TextStyle(font: font, fontSize: fontSize)),
                      ],
                    ),
                  ),
                  pw.VerticalDivider(),
                  pw.Expanded(
                    flex: 2,
                    child: pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text(
                          checkDetails.payInCompanyName,
                          style: pw.TextStyle(
                              font: fontBlack, fontSize: fontSizeBold),
                        ),
                        pw.Divider(
                          color: black,
                          height: dividerHeight,
                        ),
                        pw.Row(
                          children: [
                            //left body
                            pw.Expanded(
                              flex: 1,
                              child: pw.Column(
                                mainAxisAlignment:
                                    pw.MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Text(checkDetails.payInBankNameTitle,
                                      style: pw.TextStyle(
                                          font: fontBlack, fontSize: fontSize)),
                                  pw.Container(height: dividerHeight),
                                  pw.Text(checkDetails.payInPropsTitle,
                                      style: pw.TextStyle(
                                          font: fontBlack, fontSize: fontSize)),
                                  pw.Container(height: dividerHeight),
                                  pw.Text(checkDetails.payInBankMfoTitle,
                                      style: pw.TextStyle(
                                          font: fontBlack, fontSize: fontSize)),
                                  pw.Container(height: dividerHeight),
                                  pw.Text(checkDetails.payInBankInnTitle,
                                      style: pw.TextStyle(
                                          font: fontBlack, fontSize: fontSize)),
                                  pw.Container(height: dividerHeight),
                                ],
                              ),
                            ),
                            //right body
                            pw.Expanded(
                              flex: 2,
                              child: pw.Column(
                                mainAxisAlignment:
                                    pw.MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Text(checkDetails.payInBankName,
                                      style: pw.TextStyle(
                                          font: font, fontSize: fontSize)),
                                  pw.Divider(
                                    color: black,
                                    height: dividerHeight,
                                  ),
                                  pw.Text(checkDetails.payInProps,
                                      style: pw.TextStyle(
                                          font: font, fontSize: fontSize)),
                                  pw.Divider(
                                      color: black,
                                      height: dividerHeight,
                                      indent: 0),
                                  pw.Text(checkDetails.payInBankMfo,
                                      style: pw.TextStyle(
                                          font: font, fontSize: fontSize)),
                                  pw.Divider(
                                    color: black,
                                    height: dividerHeight,
                                  ),
                                  pw.Text(checkDetails.payInBankInn,
                                      style: pw.TextStyle(
                                          font: font, fontSize: fontSize)),
                                  pw.Divider(
                                    color: black,
                                    height: dividerHeight,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        pw.Column(
                          children: [
                            pw.Text(checkDetails.payerName,
                                style: pw.TextStyle(
                                    font: fontBlack, fontSize: fontSizeBold)),
                            pw.Divider(
                              color: black,
                              height: dividerHeight,
                            ),
                            pw.Text(checkDetails.payerNameTitle,
                                style: pw.TextStyle(
                                    font: font, fontSize: fontSizeMedium)),
                          ],
                        ),
                        pw.Column(
                          children: [
                            pw.Text(checkDetails.payAppoint,
                                style: pw.TextStyle(
                                    font: fontBlack, fontSize: fontSizeBold)),
                            pw.Divider(
                              color: black,
                              height: dividerHeight,
                            ),
                            pw.Text(checkDetails.payAppointTitle,
                                style: pw.TextStyle(
                                    font: font, fontSize: fontSizeMedium)),
                          ],
                        ),
                        pw.Divider(
                          color: black,
                          height: dividerHeight,
                        ),
                        pw.Row(
                          children: [
                            pw.Container(
                                // width: 20.w,
                                // height: 20.w,
                                // child: pw.PrettyQr(
                                //   roundEdges: true,
                                //   size: 200,
                                //   data: "Paynes",
                                //   errorCorrectLevel: QrErrorCorrectLevel.M,
                                // ),
                                ),
                            pw.Expanded(flex: 2, child: pw.Container()),
                            pw.Expanded(
                              flex: 1,
                              child: pw.Container(
                                decoration: const pw.BoxDecoration(
                                    border: pw.Border(left: pw.BorderSide())),
                                child: pw.Column(
                                  mainAxisAlignment:
                                      pw.MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: pw.CrossAxisAlignment.end,
                                  children: [
                                    pw.Padding(
                                      padding: const pw.EdgeInsets.only(
                                          left: 2.0, right: 2.0),
                                      child: pw.Row(
                                        mainAxisAlignment:
                                            pw.MainAxisAlignment.spaceBetween,
                                        children: [
                                          pw.Text(checkDetails.sumToPayTitle,
                                              style: pw.TextStyle(
                                                  font: font,
                                                  fontSize: fontSize)),
                                          pw.Text(checkDetails.sumToPay,
                                              style: pw.TextStyle(
                                                  font: font,
                                                  fontSize: fontSize))
                                        ],
                                      ),
                                    ),
                                    pw.Divider(
                                        color: black,
                                        height: dividerHeight,
                                        indent: 0),
                                    pw.Padding(
                                      padding: const pw.EdgeInsets.only(
                                          left: 2.0, right: 2.0),
                                      child: pw.Row(
                                        mainAxisAlignment:
                                            pw.MainAxisAlignment.spaceBetween,
                                        children: [
                                          pw.Text(
                                              checkDetails.commissionPayTitle,
                                              style: pw.TextStyle(
                                                  font: font,
                                                  fontSize: fontSize)),
                                          pw.Text(checkDetails.commissionPay,
                                              style: pw.TextStyle(
                                                  font: font,
                                                  fontSize: fontSize))
                                        ],
                                      ),
                                    ),
                                    pw.Divider(
                                        color: black,
                                        height: dividerHeight,
                                        indent: 0),
                                    pw.Padding(
                                      padding: const pw.EdgeInsets.only(
                                          left: 2.0, right: 2.0),
                                      child: pw.Row(
                                        mainAxisAlignment:
                                            pw.MainAxisAlignment.spaceBetween,
                                        children: [
                                          pw.Text(checkDetails.totalPayTitle,
                                              style: pw.TextStyle(
                                                  font: font,
                                                  fontSize: fontSize)),
                                          pw.Text(checkDetails.totalSum,
                                              style: pw.TextStyle(
                                                  font: font,
                                                  fontSize: fontSize))
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
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
          ]);
        },
      ),
    );
    return doc.save();
    // await Printing.layoutPdf(
    //   onLayout: (PdfPageFormat format) async => doc.save(),
    //   format: PdfPageFormat.a4,
    //   usePrinterSettings: true,
    // );
  }
}
