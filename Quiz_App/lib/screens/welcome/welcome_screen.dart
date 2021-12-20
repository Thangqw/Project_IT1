import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/controllers/login_controller.dart';
import 'package:quiz_app/models/Login.dart';
import 'package:quiz_app/screens/quiz/quiz_screen.dart';
//Giao diện màn hình đăng nhập vào Quiz
 class WelcomeScreen extends StatefulWidget {
   @override
   _WelcomeScreenState createState() => _WelcomeScreenState();
 }
 //vì sử dụng statefull nên phải có lớp state
 class _WelcomeScreenState extends State<WelcomeScreen>{
   // biến quản lý state show pass
   bool _showpass=false;
   // các biến controller để quản lý data nhập vào
   TextEditingController _userController=new TextEditingController();
   TextEditingController _passController= new TextEditingController();
   var _userErr="Sai Tài Khoản hoặc mật khẩu ";
   var _passErr="Mật khẩu phải lớn hơn 6 ký tự";
   var _userInvalid= false;
   var _passInvalid= false;

   // hàm build để xử lý
@override
  Widget build(BuildContext context) {
    return Scaffold(
      // sử dụng stack để tạo một hình nền và các đối tượng khác xếp chồng lên
      body: Stack(
        children: [
          // background
          SvgPicture.asset("assets/icons/13.svg", fit: BoxFit.fill),
          // Vùng an toàn để thiết kế các widget
          SafeArea(
            // tạo lề
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              // thiết kế các lớp con theo bố cục dọc
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // tạo khoảng cách giữa các đối tượng
                  Spacer(flex: 2), //2/6
                  // tiêu đề
                  Text(
                    "Let's Play Quiz,",
                    style: Theme.of(context).textTheme.headline4.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text("Enter your informations below"),
                  Spacer(),
                  // widget nhập vào tên đăng nhập
                  TextField(
                        controller: _userController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFF1C2341),
                          hintText: "Full Name",
                          errorText: _userInvalid ? _userErr: null,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                        ),
                      ),
                  Padding(padding: EdgeInsets.only(bottom: 10)),
                  //widget nhập vào mật khẩu
                  Stack(
                    alignment: AlignmentDirectional.centerEnd,
                    children: [
                      TextField(
                        controller: _passController,
                        obscureText: !_showpass,
                        decoration: InputDecoration(

                          filled: true,
                          fillColor: Color(0xFF1C2341),
                          hintText: "Pass",
                          errorText: _passInvalid ? _passErr : null,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                        ),
                      ),
                      //widget chức năng Show pass hoặc Hide pass
                      GestureDetector(
                        onTap: Showpass,
                        child: Text(
                          _showpass ? "Hide":"Show",
                          style: TextStyle(
                            color: Colors.amber,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                  Spacer(),
                  //Button đăng nhập để vào trang quiz
                  InkWell(
                    onTap: Clicked,
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
                      decoration: BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Text(
                        "Lets Start Quiz",
                        style: Theme.of(context)
                            .textTheme
                            .button
                            .copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                  Spacer(flex: 2), // it will take 2/6 spaces
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  // các hàm state để xử lý các trạng thái của widget
   //xử lý state showpass
  void Showpass(){
  setState(() {
  _showpass=!_showpass;
  });
  }
  // xử lý state Click vào button đăng nhập
  void Clicked(){
    LoginController _loginController = Get.put(LoginController());
    var index=_loginController.login.length;
    var i=0;
    setState(() {
      // điều kiện thoả pass
      if(_passController.text.length<6){ _passInvalid=true;}
      else{ _passInvalid=false;
      }
      // điều kiện thoã thông tin tài khoản
      if(_passInvalid==false){
        for(i;i<index;i++) {
          if (_userController.text == _loginController.login[i].name&&_passController.text==_loginController.login[i].pass ) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => QuizScreen()));
            break;
          }
          else{
            _userInvalid=true;
          }
        }
      }
    });
  }

}
