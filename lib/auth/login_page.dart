import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _SampesPageState createState() => _SampesPageState();
}

class _SampesPageState extends State<LoginPage> with SingleTickerProviderStateMixin {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0), // here the desired height
        child: AppBar(
          backgroundColor: const Color.fromRGBO(33, 158, 188, 10),
        ),
      ),
      body: Column(
        children: const [
          Text(''),
          //floating button default
        ],
      ),
    );
  }
}