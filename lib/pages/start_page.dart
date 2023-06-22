import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  bool _signInLoading = false;
  bool _signUpLoading = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _formKey,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //email
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
               child: TextFormField(),
             ),
            // password
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
               child: TextFormField(),
             ),
            //Sign in Bottom
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
               child: OutlinedButton(
                 onPressed: (){
             
                 },
                 child: const Text("Sign In") ,
               ),
             ),
             //Sign Up Botton
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
               child: OutlinedButton(
                 onPressed: (){
             
                 },
                 child: const Text("Sign Up") ,
               ),
             ),
          ],

        ),
       ,),
    );
  }
}