import 'package:flutter/material.dart';
import 'package:login/pages/home_page.dart';
import 'package:login/pages/start_page.dart';
import 'package:login/utils/common.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async{
    await Supabase.initialize(url:"https://qpewttmefqniyqflyjmu.supabase.co" ,
    anonKey:"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFwZXd0dG1lZnFuaXlxZmx5am11Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzM2NjI1NDYsImV4cCI6MTk4OTIzODU0Nn0.OnRuoILFCh1WhCTjNx8JGRPaf_OzrBthdhL-H3dXhQk" );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Supabase Login',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  User? _user;
  @override
  void initState() {
    _getAuth();
    super.initState();
  }

Future<void> _getAuth() async {
  setState(() {
   _user = client.auth.currentUser; 
  });

  client.auth.onAuthStateChange.listen((event){
    setState(() {
       _user=event.session?.user;
    });
  }
  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: _user==null ?const StartPage(): const HomePage(),
    );
  }
}
