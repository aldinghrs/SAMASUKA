import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final showPassword = false.obs;
  final usernameC = TextEditingController();
  final passwordC = TextEditingController();
  final box = GetStorage();
  final isLoading = false.obs;

  void logout() async {
    box.erase();
    Get.offAndToNamed(Routes.LOGIN);
  }

  void login() async {
    try {
      // Kirim data login ke API menggunakan Dio
      final response = await Dio().post(
        //Jika menggunakan android emulator maka URL API menjadi http://10.0.2.2, bukan http://127.0.0.1
        'http://10.0.2.2:8000/api/login',
        data: {
          'username': usernameC.text,
          'password': passwordC.text,
        },
      );

      if (response.data['status'] == 'sukses') {
        // Simpan token ke dalam penyimpanan lokal
        final token = response.data['token'];
        final email = response.data['data']['email'];
        final nama = response.data['data']['nama_lengkap'];

        box.write('nama', nama);
        box.write("token", token);
        box.write("email", email);

        Get.snackbar("Login Berhasil", "Selamat datang $nama",
            margin: EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 10),
            backgroundColor: Colors.green[200]);
        Get.offAllNamed(Routes.DASHBOARD);
      } else if (response.statusCode == 401) {
        Get.snackbar(
            'Gagal', 'Login gagal. Periksa kembali username dan password Anda.',
            margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      }
    } catch (e) {
      // Jika gagal login, tampilkan pesan kesalahan
      Get.snackbar('Gagal', 'Username atau password salah',
          margin: EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 10),
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }
}
