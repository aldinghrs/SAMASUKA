import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
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
                'Register User',
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
                    controller: controller.emailC,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.black26,
                      ),
                      hintText: "Masukkan email",
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
                    decoration: InputDecoration(
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
              Container(
                  width: Get.width,
                  padding: EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black12)),
                  child: TextField(
                    controller: controller.namaC,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person_add_outlined,
                        color: Colors.black26,
                      ),
                      hintText: "Masukkan nama lengkap",
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
                    controller: controller.alamatC,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.house_outlined,
                        color: Colors.black26,
                      ),
                      hintText: "Masukkan alamat",
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
                    controller: controller.telpC,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.phone_android,
                        color: Colors.black26,
                      ),
                      hintText: "Masukkan no.telp",
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
                    controller.save();
                  },
                  child: Obx(() => controller.isLoading == false
                      ? Text("Simpan")
                      : Center(
                          child: CircularProgressIndicator(),
                        )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
