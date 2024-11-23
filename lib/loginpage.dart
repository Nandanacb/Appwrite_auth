import 'package:auth/appwriteservise.dart';
import 'package:auth/homescreen.dart';
import 'package:auth/signuppage.dart';
import 'package:flutter/material.dart';
class Loginpage extends StatefulWidget{
  @override
  State<Loginpage> createState()=>_LoginpageState();
}
class _LoginpageState extends State<Loginpage>{
late AppwriteServices _appwriteServices;

 
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _appwriteServices=AppwriteServices();
  }
 
 @override
  Widget build(BuildContext context){
    return Scaffold(
     body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
        
             SizedBox(height: 100),
                Text(
                  "Log in",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                
                SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  width: 300,
                  child: TextField(
                   controller: emailController,
                    decoration: InputDecoration(
                      hintText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  width: 300,
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
        
        
        SizedBox(height: 100),
        SizedBox(
                height: 50,
                width: 300,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink[400],
                  ),
                  onPressed: () async{
                    if(emailController.text.isNotEmpty && passwordController.text.isNotEmpty){
                      try{
                        await _appwriteServices.loginUser(
                          emailController.text,
                           passwordController.text,
                           );
                           Navigator.pushReplacement(
                            context,
                             MaterialPageRoute(builder: (context)=>Homescreen()));
                             emailController.clear();
                             passwordController.clear();
                      }catch(e){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content:Text('please fill both fields')));
                      }
                    }
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
  


            SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Dont have an account?",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Signuppage()),
                      );
                    },
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
        
        
        ],),
      ]),
      ),

    );
  }
}