import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';

class RegisterController extends GetxController {
  final usernameC = TextEditingController();
  final passwordC = TextEditingController();
  final namaC = TextEditingController();
  final emailC = TextEditingController();
  final alamatC = TextEditingController();
  final telpC = TextEditingController();
  final box = GetStorage();

  final isLoading = false.obs;
  final showPassword = false.obs;

  final count = 0.obs;

  void save() async {
    try {
      isLoading.value = true;
      final dio = Dio();
      final token = box.read("token");
      dio.options.headers['Authorization'] = 'Bearer $token';

      final response = await dio.post(
          //Jika menggunakan android emulator maka URL API menjadi http://10.0.2.2, bukan http://127.0.0.1
          'http://10.0.2.2:8000/api/register',
          data: {
            "username": usernameC.text,
            "email": emailC.text,
            "password": passwordC.text,
            "nama_lengkap": namaC.text,
            "alamat": alamatC.text,
            "telp": telpC.text
          });

      print(response.data);
      if (response.data['status'] == 'sukses') {
        Get.snackbar(
            "Berhasil", "Pendaftaran User Baru Berhasil. Silahkan login.",
            margin: EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 10),
            backgroundColor: Colors.green[200]);
        Get.toNamed(Routes.LOGIN);
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("Gagal", "Pendaftaran User baru gagal $e",
          margin: EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 10),
          backgroundColor: Colors.red[200]);
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
