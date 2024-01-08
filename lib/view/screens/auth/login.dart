import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton( icon: const Icon(Icons.arrow_back_ios), onPressed: (){}, iconSize: 20,),
        title: Image.asset('assets/images/netflix-old-logo.png', height: 50,),
        centerTitle: true,
        actions: const [Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Help'),
        )],
      ),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                
              ),
              controller: emailController,
            )
          ],
        ),
      )),
    );
  }
}