import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);
  LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: Get.width,
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              Text(
                'SAMASUKA',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text(
                'Surat Masuk Surat Keluar',
              ),
              SizedBox(
                height: 100,
              ),
              Container(
                  width: Get.width,
                  padding: EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black12)),
                  child: TextField(
                    controller: controller.usernameC,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person_outline,
                        color: Colors.black26,
                      ),
                      hintText: "Masukkan username",
                      border: InputBorder.none,
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                  width: Get.width,
                  padding: EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black12)),
                  child: TextField(
                    controller: controller.passwordC,
                    obscureText: true,
                    decoration: InputDecoration(
                      suffixIcon: Obx(() => controller.showPassword == false
                          ? InkWell(
                              onTap: () {
                                controller.showPassword.value = true;
                              },
                              child: Icon(
                                Icons.remove_red_eye_outlined,
                                color: Colors.black26,
                              ))
                          : InkWell(
                              onTap: () {
                                controller.showPassword.value = true;
                              },
                              child: Icon(
                                Icons.remove_red_eye,
                                color: Colors.black26,
                              ))),
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: Colors.black26,
                      ),
                      hintText: "Masukkan password",
                      border: InputBorder.none,
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: Get.width,
                child: ElevatedButton(
                  onPressed: () {
                    controller.login();
                  },
                  child: Obx(() => controller.isLoading == false
                      ? Text("Login")
                      : Center(
                          child: CircularProgressIndicator(),
                        )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: Get.width,
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    Get.toNamed(Routes.REGISTER);
                  },
                  child: Text("Daftar Pengguna"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
