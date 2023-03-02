import 'package:flutter/material.dart';
import 'package:taxi_uz/auth/register_page.dart';
import 'package:taxi_uz/auth/sample_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SampesPageState createState() => _SampesPageState();
}

class _SampesPageState extends State<SplashPage> with SingleTickerProviderStateMixin {


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
      body: SamplePage(),
    );
  }
}