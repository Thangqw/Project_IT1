import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:quiz_app/models/Login.dart';


// Tạo class controller để quản lý và xử lý các model Login
class LoginController extends GetxController
    with SingleGetTickerProviderMixin {
  // tạo list Login lưu các tài khoản thành dạng list
  List<Login> _login = list_User
      .map(
        (login) => Login(
        name: login['name'],
        pass: login['pass']),
  )
      .toList();
  // hàm khởi tạo
  List<Login> get login => this._login;
}