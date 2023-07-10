import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:samasuka/app/modules/login/controllers/login_controller.dart';

class Profile extends StatelessWidget {
  Profile({super.key});
  final box = GetStorage();
  LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    final nama = box.read("nama");
    final email = box.read("email");
    return SingleChildScrollView(
      child: Container(
        width: Get.width,
        height: Get.height,
        padding: EdgeInsets.all(10),
        child: Column(children: [
          SizedBox(
            height: 30,
          ),
          Lottie.asset('assets/person.json', width: 200, height: 200),
          SizedBox(
            height: 10,
          ),
          Text(
            nama,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            email,
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                controller.logout();
              },
              child: Text("Sign Out"))
        ]),
      ),
    );
  }
}
