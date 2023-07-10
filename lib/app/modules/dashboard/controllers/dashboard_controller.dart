import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:dio/dio.dart';

import '../../../models/SMModel.dart';
import '../../../routes/app_pages.dart';

class DashboardController extends GetxController {
  // List<dynamic> suratMasuk = [].obs;
  final box = GetStorage();

  void readMail(String id_sm, String pengirim, String penerima, String tgl,
      String perihal, String isi, String token_lampiran) async {
    try {
      final dio = Dio();

      final token = box.read("token");
      dio.options.headers['Authorization'] = 'Bearer $token';

      final response = await dio.get(
          //Jika menggunakan android emulator maka URL API menjadi http://10.0.2.2, bukan http://127.0.0.1
          'http://10.0.2.2:8000/api/sm/read/$id_sm');

      if (response.data['status'] == 'sukses') {
        Get.toNamed(Routes.SURAT, arguments: {
          'type': 'masuk',
          'pengirim': pengirim,
          'penerima': penerima,
          'tanggal': tgl,
          'perihal': perihal,
          'isi': isi,
          'token_lampiran': token_lampiran,
        });
      }
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }

  Future<List<dynamic>> ambilSuratMasuk() async {
    try {
      final dio = Dio();

      final token = box.read("token");
      dio.options.headers['Authorization'] = 'Bearer $token';

      final response = await dio.get(
          //Jika menggunakan android emulator maka URL API menjadi http://10.0.2.2, bukan http://127.0.0.1
          'http://10.0.2.2:8000/api/sm');

      print(response.data);
      return response.data['data'];
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }

  Future<List<dynamic>> ambilSuratKeluar() async {
    try {
      final dio = Dio();

      final token = box.read("token");
      dio.options.headers['Authorization'] = 'Bearer $token';

      final response = await dio.get(
          //Jika menggunakan android emulator maka URL API menjadi http://10.0.2.2, bukan http://127.0.0.1
          'http://10.0.2.2:8000/api/sk');

      print(response.data);
      return response.data['data'];
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }

  Future<List<SMModel>> fetchDataFromAPI() async {
    final dio = Dio();
    final url = 'http://10.0.2.2:8000/api/sm';

    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        final responseData = response.data;
        List<dynamic> data = responseData['data'] as List<dynamic>;
        print(data);
        List<SMModel> smModels =
            data.map((json) => SMModel.fromJson(json)).toList();
        return smModels;
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (error) {
      throw Exception('An error occurred: $error');
    }
  }

  // List<Map<String, String>> suratMasuk = [
  //   {
  //     'bagian': 'Keuangan',
  //     'keterangan': 'Masuk',
  //     'tanggal': '2023-06-10',
  //     'dibaca': 'Y',
  //     'perihal': 'Tolong ditandatangani.',
  //     'isi':
  //         "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
  //   },
  //   {
  //     'bagian': 'Kepala Desa',
  //     'keterangan': 'Masuk',
  //     'tanggal': '2023-06-12',
  //     'dibaca': 'N',
  //     'perihal': 'Undangan untuk acara kumpul warga',
  //     'isi':
  //         "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
  //   },
  //   {
  //     'bagian': 'Bendahara',
  //     'keterangan': 'Masuk',
  //     'tanggal': '2023-06-12',
  //     'dibaca': 'Y',
  //     'perihal': 'Laporan keuangan',
  //     'isi':
  //         "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
  //   },
  // ];

  List<Map<String, String>> suratKeluar = [
    {
      'bagian': 'Kemananan',
      'keterangan': 'Keluar',
      'tanggal': '2023-06-14',
      'dibaca': 'N',
      'perihal': 'Pemberitahuan Mengenai Kegiatan Siskamling',
      'isi':
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    },
    {
      'bagian': 'Balai Desa',
      'keterangan': 'Keluar',
      'tanggal': '2023-06-13',
      'dibaca': 'N',
      'perihal': 'Tolong ditandatangani.',
      'isi':
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    },
    {
      'bagian': 'Kepala Sekolah',
      'keterangan': 'Keluar',
      'tanggal': '2023-06-13',
      'dibaca': 'Y',
      'perihal': 'Undangan Seminar Mengenai Pendidikan Anak',
      'isi':
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    },
    {
      'bagian': 'Kepala Desa',
      'keterangan': 'Keluar',
      'tanggal': '2023-06-15',
      'dibaca': 'N',
      'perihal': 'Tolong ditandatangani.',
      'isi':
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    },
    {
      'bagian': 'Kepala Desa',
      'keterangan': 'Keluar',
      'tanggal': '2023-06-16',
      'dibaca': 'Y',
      'perihal': 'Surat Pemberitahuan',
      'isi':
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    },
  ];

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    // ambilSurat();
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
