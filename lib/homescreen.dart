import 'package:auth/appwriteservise.dart';
import 'package:auth/loginpage.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget{
  @override
  State<Homescreen> createState()=>_HomescreenState();
}
class _HomescreenState extends State<Homescreen>{

  late AppwriteServices _appwriteServices;
  void initState(){
    super.initState();
    _appwriteServices=AppwriteServices();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Homescreen"),
        centerTitle: true,
        actions: [
         GestureDetector(onTap: () async {
          try{
            await _appwriteServices.logoutUser();
            Navigator.push(context, MaterialPageRoute(
              builder: (context)=>Loginpage()));
          }catch(e){
            print(e);
          }
           
         },
         child: Icon(Icons.logout),
         )
        ],
      ),
      body: Center(child: Text('Home screen')),
    );
  }
}