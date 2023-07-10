import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class InputSuratController extends GetxController {
  final noSuratC = TextEditingController();
  final penerima = ''.obs;
  final id_penerima = ''.obs;
  final perihalC = TextEditingController();
  final isiC = TextEditingController();
  final isLoading = false.obs;
  final lampiranName = ''.obs;
  final lampiranC = ''.obs;
  final box = GetStorage();
  // List<dynamic> users = [].obs;
  RxList<dynamic> users = <dynamic>[].obs;

  void pickPDFFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null && result.files.isNotEmpty) {
      File file = File(result.files.single.path!);
      lampiranName.value = result.files.single.name;
      // Use the file as needed (e.g., convert to Base64)
      convertPdfToBase64(file.path);
    } else {
      // User canceled the file picker
    }
  }

  Future<void> convertPdfToBase64(String filePath) async {
    File file = File(filePath);
    if (!file.existsSync()) {
      throw Exception('File not found');
    }

    List<int> bytes = await file.readAsBytes();
    String base64String = base64Encode(bytes);
    lampiranC.value = base64String;
    print(lampiranC.value);
    // return base64String;
  }

  void getUsers() async {
    try {
      isLoading.value = true;
      final dio = Dio();
      final token = box.read("token");
      dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await dio.get(
          //Jika menggunakan android emulator maka URL API menjadi http://10.0.2.2, bukan http://127.0.0.1
          'http://10.0.2.2:8000/api/users');

      print(response.data['data']);
      isLoading.value = false;
      users.assignAll(response.data['data']);
      // users = jsonDecode(response.data['data']);
    } catch (e) {
      isLoading.value = false;
      throw Exception('An error occurred: $e');
    }
  }

  void getAttachment() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
    } else {
      // User canceled the picker
    }
  }

  void createSurat() async {
    try {
      final dio = Dio();
      final pengirim = box.read("nama");
      final token = box.read("token");
      dio.options.headers['Authorization'] = 'Bearer $token';
      DateTime now = DateTime.now();
      String formattedDate = DateFormat('yyyy-MM-dd').format(now);

      final params = {
        "no_surat": noSuratC.text,
        "tgl_ns": formattedDate,
        "pengirim": pengirim,
        "penerima": penerima.value,
        "perihal": perihalC.text,
        "isi": isiC.text,
        "id_bagian": 0,
        "token_lampiran": lampiranC.value,
        "dibaca": 0,
        "disposisi": 0,
        "peringatan": 0,
        "id_penerima": id_penerima
      };

      print(params);

      final response = await dio.post(
          //Jika menggunakan android emulator maka URL API menjadi http://10.0.2.2, bukan http://127.0.0.1
          'http://10.0.2.2:8000/api/buatsurat',
          data: {
            "no_surat": noSuratC.text,
            "tgl_ns": formattedDate,
            "pengirim": pengirim,
            "penerima": penerima.value,
            "perihal": perihalC.text,
            "isi": isiC.text,
            "id_bagian": 0,
            "token_lampiran": lampiranC.value,
            "dibaca": 0,
            "disposisi": 0,
            "peringatan": 0,
            "id_penerima": id_penerima.value
          });
      if (response.data['status'] == 'sukses') {
        Get.defaultDialog(
          title: "Berhasil",
          middleText: "Surat berhasil terkirim.",
          onConfirm: () {
            Get.back();
            Get.back();
          },
        );
      }
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }

  @override
  void onInit() {
    super.onInit();
    getUsers();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
