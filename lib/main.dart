import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

final box = GetStorage();
void main() async {
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: box.read("token") == null ? Routes.LOGIN : Routes.DASHBOARD,
      getPages: AppPages.routes,
    ),
  );
}
