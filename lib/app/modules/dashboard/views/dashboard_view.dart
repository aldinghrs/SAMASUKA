import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:samasuka/app/widgets/list_inbox.dart';
import 'package:samasuka/app/widgets/list_outbox.dart';
import 'package:samasuka/app/widgets/profile.dart';

import '../../../routes/app_pages.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.inbox_outlined),
                  text: "Surat Masuk",
                ),
                Tab(
                  icon: Icon(Icons.outbox_outlined),
                  text: "Surat Keluar",
                ),
                Tab(
                  icon: Icon(Icons.person_outline),
                  text: "Profil",
                ),
              ],
            ),
            title: Column(
              children: [
                Text('SAMASUKA'),
                Text(
                  'Surat Masuk Surat Keluar',
                  style: TextStyle(fontSize: 10),
                )
              ],
            ),
            centerTitle: true,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.toNamed(Routes.INPUT_SURAT);
            },
            child: Icon(Icons.add),
          ),

          body: TabBarView(
            children: [ListInbox(), ListOutbox(), Profile()],
          ),

          // body: SingleChildScrollView(
          //     child: Container(
          //         padding: EdgeInsets.all(10),
          //         width: Get.width,
          //         height: Get.height,
          //         child: Column(
          //           children: [
          //             SizedBox(
          //               height: 20,
          //             ),
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 Container(
          //                   width: Get.width / 2.2,
          //                   decoration: BoxDecoration(
          //                       color: Colors.blue[50],
          //                       borderRadius: BorderRadius.circular(10)),
          //                   padding: EdgeInsets.all(4),
          //                   child: Column(
          //                     children: [
          //                       Text("Surat masuk"),
          //                       Text(
          //                         "1",
          //                         style: TextStyle(fontSize: 40),
          //                       )
          //                     ],
          //                   ),
          //                 ),
          //                 Container(
          //                   width: Get.width / 2.2,
          //                   decoration: BoxDecoration(
          //                       color: Colors.blue[50],
          //                       borderRadius: BorderRadius.circular(10)),
          //                   padding: EdgeInsets.all(4),
          //                   child: Column(
          //                     children: [
          //                       Text("Surat keluar"),
          //                       Text(
          //                         "2",
          //                         style: TextStyle(fontSize: 40),
          //                       )
          //                     ],
          //                   ),
          //                 )
          //               ],
          //             ),
          //             SizedBox(
          //               height: 10,
          //             ),
          //             Expanded(
          //                 child: Container(
          //               width: Get.width,
          //               child: ListView.builder(
          //                 itemCount: controller.dataList.length,
          //                 itemBuilder: (BuildContext context, int index) {
          //                   final data = controller.dataList[index];
          //                   return Container(
          //                       width: Get.width,
          //                       padding: EdgeInsets.all(8.0),
          //                       margin: EdgeInsets.symmetric(vertical: 4.0),
          //                       decoration: BoxDecoration(
          //                           borderRadius: BorderRadius.circular(10),
          //                           color: Colors.blue[50]),
          //                       child: InkWell(
          //                         onTap: () {},
          //                         child: Row(
          //                           mainAxisAlignment: MainAxisAlignment.center,
          //                           crossAxisAlignment: CrossAxisAlignment.center,
          //                           children: [
          //                             // Container(
          //                             //   width: 30,
          //                             //   child: Text('${data['no']}.'),
          //                             // ),
          //                             Container(
          //                               width: Get.width / 2,
          //                               child: Column(
          //                                 mainAxisAlignment:
          //                                     MainAxisAlignment.start,
          //                                 crossAxisAlignment:
          //                                     CrossAxisAlignment.start,
          //                                 children: [
          //                                   Text(
          //                                     data['tanggal'].toString(),
          //                                     style: TextStyle(fontSize: 10),
          //                                   ),
          //                                   Text(
          //                                     data['bagian'].toString(),
          //                                     style: TextStyle(
          //                                         color: Colors.black87,
          //                                         fontSize: 16,
          //                                         fontWeight: FontWeight.w700),
          //                                   ),
          //                                 ],
          //                               ),
          //                             ),
          //                             Container(
          //                               alignment: Alignment.centerRight,
          //                               width: Get.width / 3,
          //                               child: Text(
          //                                 data['keterangan'].toString(),
          //                                 style: TextStyle(
          //                                     color:
          //                                         data['keterangan'].toString() ==
          //                                                 'Masuk'
          //                                             ? Colors.green
          //                                             : Colors.red),
          //                               ),
          //                             ),
          //                           ],
          //                         ),
          //                       ));
          //                 },
          //               ),
          //             ))
          //           ],
          //         ))),
        ));
  }
}
