import 'package:finalmad/screens/tasks/task6/homeSix.dart';
import 'package:finalmad/widgets/message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class taskSix extends StatefulWidget {
  const taskSix({Key? key}) : super(key: key);

  @override
  State<taskSix> createState() => taskSixState();
}

class taskSixState extends State<taskSix> {

  static const String KEY_SignIn = "";

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  String showMessage = '';
  bool isShowMessage = false;

  Future<void> saveUser(String name,String pass)async {
    try{
      final SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString('username',name);
      pref.setString('password', pass);

      setState(() {
        isShowMessage = true;
        showMessage = "User have been saved successfully";
        userNameController.text = '';
        passwordController.text = '';
      });
    }
    catch(e){
      setState(() {
        isShowMessage = false;
        showMessage = "Data did not saved";
      });
    }
  }
  void deleteUser() async {
    try {
      final SharedPreferences pref = await SharedPreferences.getInstance();
      pref.remove('password');
      pref.remove('username');
      setState(() {
        isShowMessage = true;
        showMessage = 'Successfully Logout';
        userNameController.text = '';
        passwordController.text = '';
      });
    } catch (e) {
      setState(() {
        isShowMessage = false;
        showMessage = 'Not Successfully Logout';
        userNameController.text = '';
        passwordController.text = '';
      });
    }
  }

  void SignupClick() async {
    if(userNameController.text=='' || passwordController.text==''){
      setState(() {
        isShowMessage = false;
        showMessage = 'Please fill up all fields';
      });
    }
    else{
      saveUser(userNameController.text, passwordController.text);
      final SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setBool(KEY_SignIn, true);
      Get.to(homeSix());
    }
  }

  void LoginClick()async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    var isLoggedIn = pref.getBool(KEY_SignIn);
    if(isLoggedIn!=null){
      if(isLoggedIn){
        Get.to(homeSix());
      }else{

      }
    }
    else{

    }

  }
  @override
  void initState() {
    // TODO: implement initState
    LoginClick();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
            children: [
              SizedBox(height: 20,),
              Center(
                  child: Text("Shared Prefernecs",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                  )
              ),
              SizedBox(height: 10,),
              (isShowMessage == true) ?
                  MyMessage(message: showMessage, success: true)
                  : MyMessage(message: showMessage, success: true),
              (isShowMessage == true) ?
                  const SizedBox(height: 30)
                  : const SizedBox(height: 30),


                Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25),
                  child: TextFormField(
                    controller: userNameController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade300)
                        ),
                        hintText: "Username",
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      fillColor: Colors.grey.shade200,
                      filled: true

                    ),

                  ),
                ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 25,right: 25),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade300)
                      ),
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      fillColor: Colors.grey.shade200,
                      filled: true
                  ),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: (){
                  SignupClick();
                },
                child: Container(
                    padding: const EdgeInsets.all(25),
                    margin:  EdgeInsets.symmetric(horizontal: 25),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),


                    ),
                    child:Center(
                      child: Text("Signup",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),),
                    )
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: (){

                },
                child: Container(
                    padding: const EdgeInsets.all(25),
                    margin:  EdgeInsets.symmetric(horizontal: 25),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),


                    ),
                    child:Center(
                      child: Text("Logout",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),),
                    )
                ),
              ),
            ],

      ),
    );
  }
}
