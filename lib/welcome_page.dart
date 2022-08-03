import 'package:flutter/material.dart';
import 'package:logging_auth/auth_controller.dart';

class WelcomePage extends StatelessWidget {
  String email;
  WelcomePage({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
       backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: w,
            height: h*0.3,
            decoration: BoxDecoration(color: Colors.grey),
          ),
          SizedBox(height: 70,),
          Container(
            width: w,
            margin: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
              "Welcome",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
             Text(
              email,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[500],
              ),
            ),
              ],
            ),
          ),
         SizedBox(height: 200,),
          GestureDetector(
            onTap: () {
              AuthController.instance.logout();
            },
            child: Container(
              width: w*0.6,
              height: h*0.07,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey),
                child: Center(child: 
                Text("Sign out",
                style: TextStyle(
                  fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white
                ),
                )
                ),
            ),
          ),
        
        ],
      ),
    
    );
  }
}