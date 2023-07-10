import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/input_surat_controller.dart';

class InputSuratView extends GetView<InputSuratController> {
  const InputSuratView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BUAT SURAT'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text("No.Surat"),
                SizedBox(
                  height: 10,
                ),
                Container(
                    width: Get.width,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black12)),
                    child: TextField(
                      controller: controller.noSuratC,
                      decoration: InputDecoration(
                          hintText: "Masukkan No.Surat",
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.black26)),
                    )),
                SizedBox(
                  height: 10,
                ),
                Text("Penerima"),
                SizedBox(
                  height: 10,
                ),
                Container(
                    width: Get.width,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black12)),
                    child: Obx(
                      () => controller.isLoading.value == true
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : DropdownButtonFormField<int>(
                              value: controller.users.isNotEmpty
                                  ? controller.users[0]['id_user']
                                  : null,
                              items: controller.users.map((user) {
                                return DropdownMenuItem<int>(
                                  value: user['id_user'],
                                  child: Text(user['nama_lengkap']),
                                );
                              }).toList(),
                              onChanged: (value) {
                                final selectedUser = controller.users
                                    .firstWhere(
                                        (user) => user['id_user'] == value,
                                        orElse: () => null);
                                if (selectedUser != null) {
                                  final idUser = selectedUser['id_user'];
                                  final namaLengkap =
                                      selectedUser['nama_lengkap'];
                                  controller.id_penerima.value =
                                      idUser.toString();
                                  controller.penerima.value =
                                      namaLengkap.toString();
                                }
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                    )),
                SizedBox(
                  height: 10,
                ),
                Text("Perihal"),
                SizedBox(
                  height: 10,
                ),
                Container(
                    width: Get.width,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black12)),
                    child: TextField(
                      controller: controller.perihalC,
                      decoration: InputDecoration(
                        hintText: "Masukkan Perihal Surat",
                        hintStyle: TextStyle(color: Colors.black26),
                        border: InputBorder.none,
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                Text("Isi"),
                SizedBox(
                  height: 10,
                ),
                Container(
                    width: Get.width,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black12)),
                    child: TextField(
                      maxLines: 5,
                      controller: controller.isiC,
                      decoration: InputDecoration(
                          hintText: "Masukkan Isi Surat",
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.black26)),
                    )),
                SizedBox(
                  height: 10,
                ),
                Text("Lampiran"),
                SizedBox(
                  height: 10,
                ),
                Container(
                    width: Get.width,
                    height: 100,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black12)),
                    child: InkWell(
                        onTap: () {
                          // controller.getAttachment();
                          controller.pickPDFFile();
                        },
                        child: Obx(() => controller.lampiranName.value == ''
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.attachment_outlined),
                                    Text("Pilih lampiran"),
                                  ],
                                ),
                              )
                            : Center(
                                child: SizedBox(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.picture_as_pdf_outlined,
                                        color: Colors.red[900],
                                      ),
                                      SizedBox(width: 10),
                                      Text(controller.lampiranName.value)
                                    ],
                                  ),
                                ),
                              )))),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: Get.width,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.createSurat();
                    },
                    child: Text("Kirim"),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
