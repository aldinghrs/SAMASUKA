import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/surat_controller.dart';

class SuratView extends GetView<SuratController> {
  SuratView({Key? key}) : super(key: key);
  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Detail Surat'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.email),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Text(controller.arguments['bagian']),3
                    Text(DateFormat('dd MMMM yyyy').format(
                        DateTime.parse(controller.arguments['tanggal']))),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  controller.arguments['perihal'],
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  controller.arguments['isi'],
                  style: TextStyle(fontSize: 17),
                ),
                SizedBox(
                  height: 40,
                ),
                // Text(controller.arguments['token_lampiran']),
                controller.arguments['token_lampiran'] == ''
                    ? SizedBox()
                    : Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8)),
                        width: Get.width,
                        height: 50,
                        padding: EdgeInsets.all(10),
                        child: InkWell(
                            onTap: () {
                              controller.generatePdfFromBase64();
                            },
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.attach_email_outlined),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Lihat Lampiran",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ],
                              ),
                            )))
              ],
            ),
          ),
        ));
  }
}
