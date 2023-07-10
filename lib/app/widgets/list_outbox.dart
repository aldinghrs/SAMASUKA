import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samasuka/app/routes/app_pages.dart';

import '../modules/dashboard/controllers/dashboard_controller.dart';

class ListOutbox extends StatelessWidget {
  ListOutbox({
    super.key,
  });

  DashboardController controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: controller.ambilSuratKeluar(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error occurred: ${snapshot.error}'),
            );
          } else {
            // Data has been fetched successfully
            final List<dynamic> itemList = snapshot.data!;

            return ListView.builder(
              itemCount: itemList.length,
              itemBuilder: (context, index) {
                final data = itemList[index];
                return Container(
                    margin: EdgeInsets.only(
                        left: 15, right: 15, bottom: 5, top: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(5)),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.SURAT, arguments: {
                          'pengirim': data['pengirim'],
                          'penerima': data['penerima'],
                          'tanggal': data['tgl_ns'],
                          'dibaca': data['dibaca'],
                          'perihal': data['perihal'],
                          'isi': data['isi'],
                          'token_lampiran': data['token_lampiran']
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: Get.width / 1.5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data['tgl_ns'].toString(),
                                  style: TextStyle(fontSize: 10),
                                ),
                                Text(
                                  data['pengirim'].toString(),
                                  style: TextStyle(
                                    color: Colors.black87,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  data['perihal'].toString(),
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                          Container(
                              alignment: Alignment.centerRight,
                              width: Get.width / 5,
                              child: data['dibaca'].toString() == 'Y'
                                  ? Icon(Icons.mark_email_read_outlined,
                                      color: Colors.black45)
                                  : Icon(
                                      Icons.mark_email_unread_outlined,
                                      color: Colors.green[800],
                                    )),
                        ],
                      ),
                    ));
              },
            );
          }
        });
  }
}
