import 'package:flutter/material.dart';
import 'package:netflix/view/screens/main/homepage.dart';
import 'package:netflix/view/widgets/auth/textfeild.dart';
import 'package:netflix/view/widgets/colors.dart';
import 'package:netflix/view/widgets/constants.dart';

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
        // leading: IconButton( icon: const Icon(Icons.arrow_back_ios), onPressed: (){}, iconSize: 20,),
        title: Image.asset('assets/images/netflix-old-logo.png', height: 50,),
        centerTitle: true,
        // actions: const [Padding(
        //   padding: EdgeInsets.all(8.0),
        //   child: Text('Help'),
        // )],
      ),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.fromLTRB(30,0,30,0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Textfeildlogin(labeltxt: 'Email', controller: emailController),
            Constants.sizedten(context),
            Textfeildlogin(labeltxt: 'Password', controller: passwordController),
            Constants.sizedtwenty(context),
            Container(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return HomePage();
                  }));
                }, style: ElevatedButton.styleFrom(backgroundColor: Colors.red, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))), child: const Text('Sign In', style: TextStyle(color: Colors.white),)),
            )
          ],
        ),
      )),
    );
  }
}