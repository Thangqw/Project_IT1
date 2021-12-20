import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:quiz_app/screens/welcome/welcome_screen.dart';
// hàm main để khởi chạy chương trình
void main() {
  runApp(MyApp());
}
// tạo lớp Myapp là chương trình cần thực hiện
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  // hàm class stateless hay statefull đều có hàm build để xử lý
  Widget build(BuildContext context) {
    return GetMaterialApp(//sử dụng widget Meterial để thiết kế giao diện App
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      // Extract Widget WelcomeScreen
      home: WelcomeScreen(),
    );
  }
}
