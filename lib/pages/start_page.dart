import 'package:flutter/material.dart';
import 'package:login/utils/common.dart';

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
               child: TextFormField(
                   validator:(value){
                      if (value==null || value.isEmpty){
                         return "Por favor completar Correo";
                      }
                      return null;
                   },
                   controller: _emailController,
                   decoration: const InputDecoration(
                               label: Text("Email"),
                   ),
               ),
             ),
            // password
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
               child: TextFormField(
                   validator:(value){
                      if (value==null || value.isEmpty){
                         return "Por favor llenar clave de acceso";
                      }
                      return null;
                   },
                   controller: _passwordController,
                   decoration: const InputDecoration(
                               label: Text("Password"),
                   ),

               ),
             ),
            //Sign in Bottom
             _signInLoading ? const Center()
             :Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
               child: OutlinedButton(
                 onPressed: () async {
                     final isValid = _formKey.currentState?.validate();
                     if (isValid !=true){
                      return;
                     }
                     setState(() {
                       _signInLoading=true;
                     });
                      try{
                         await client.auth.signInWithPassword(
                          email: _emailController.text,
                          password: _passwordController.text);
           
                      }catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Fallo ingreso"),
                           backgroundColor: Colors.redAccent,    
                        ));
                      setState(() {
                        _signInLoading = false;
                      });
                      }

                 },
                 child: const Text("Sign In") ,
               ),
             ),
             //Sign Up Botton
             _signUpLoading ? const Center()
             :Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
               child: OutlinedButton(
                 onPressed: () async{
                     final isValid = _formKey.currentState?.validate();
                     if (isValid !=true){
                      return;
                     }
                     setState(() {
                       _signUpLoading=true;
                     });
                      try{
                         await client.auth.signUp(
                          email: _emailController.text,
                          password: _passwordController.text);
                          ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Verificar Correo"),
                          backgroundColor: Colors.redAccent,));
                      }catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                          content: Text("Fallo registro"),
                           backgroundColor: Colors.redAccent,    
                        ));
                      setState(() {
                        _signUpLoading = false;
                      });
                      }             
                 },
                 child: const Text("Sign Up") ,
               ),
             ),
          ],

        ),
       ),
    );
  }
}