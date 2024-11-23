import 'package:auth/appwriteservise.dart';
import 'package:auth/loginpage.dart';
import 'package:flutter/material.dart';
class Signuppage extends StatefulWidget{
  const Signuppage({super.key});
  @override
  State<Signuppage> createState()=>_SignuppageState();
}
class _SignuppageState extends State<Signuppage>{

  late AppwriteServices _appwriteServices;

  final nameController=TextEditingController();
  final emailController=TextEditingController();
  final passwordController=TextEditingController();

 @override
 void initState(){
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
                  "Sign Up",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 25),
                SizedBox(
                  height: 50,
                  width: 300,
                  child: TextField(
                  controller: nameController,
                    decoration: InputDecoration(
                      hintText: "Name",
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

                  if(nameController.text.isNotEmpty &&
                  emailController.text.isNotEmpty && 
                  passwordController.text.isNotEmpty){
                    try{
                      await _appwriteServices.registerUser(
                        emailController.text,
                         passwordController.text, 
                         nameController.text,
                         );
                         Navigator.push(
                          context, MaterialPageRoute(builder: (context)=>Loginpage(),
                          ),
                          );

                          nameController.clear();
                          emailController.clear();
                          passwordController.clear();
                    }catch(e){
                      print('Error adding user:$e');
                    }
                  }

                  },
                  child: Text(
                    "Sign Up",
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
                    "Already have an account?",
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
                        MaterialPageRoute(builder: (context) => Loginpage()),
                      );
                    },
                    child: Text(
                      "Log in",
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