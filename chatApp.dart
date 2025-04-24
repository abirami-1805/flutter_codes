import 'package:flutter/material.dart';
import 'package:chatapp/pages/home.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  var user_controller = TextEditingController();
  var pass_controller = TextEditingController();

  List<String> users=[
    "abi@gmail.com",
    "876@gmail.com"
  ];

  var passwords =[
    "123",
    "jkl7"
  ];

  @override
  Widget build(BuildContext context) {
    var screen_width = MediaQuery.of(context).size.width;
    var screen_height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.yellow,
        title: const Text("Login"),
      ),
      body:Center(
        child: Container(
          margin: EdgeInsets.only(
            left: 0.25* screen_width,
            right: 0.25* screen_width,
            top: 0.2 * screen_height,
            bottom: 0.2* screen_height,
          ),
          decoration: BoxDecoration(
            color: Colors.yellow[300],
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(20),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(labelText: "Username",),
                controller: user_controller,
              ),
              const SizedBox(height:10),
              TextField(
                decoration: InputDecoration(labelText: "Password"),
                controller: pass_controller,
              ),
              const SizedBox(height: 20),

              ElevatedButton(
              onPressed:() { bool isValid = false;
                for (int i=0; i<users.length;i++) {
                  if (user_controller.text == users[i] &&
                      pass_controller.text == passwords[i]) {
                    isValid = true;
                    break;
                  }
                }
                if (isValid){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
                } else{
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content : Text("Invalid username or password")),
                  );
                }
              },
              child: Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
