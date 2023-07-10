import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/login_page.dart';
import 'package:flutter_application_1/Pages/register_page.dart';


import 'Start_page.dart';

class ONboardingPage extends StatefulWidget {
  const ONboardingPage({super.key});

  @override
  State<ONboardingPage> createState() => _ONboardingPageState();
}

class _ONboardingPageState extends State<ONboardingPage> {
  PageController _controller = PageController(); 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          PageView(
            controller: _controller,
            children: [
             StartPG(),
             LoginPage(),
             RegisterPAges(),
            ],
          ),
            ],
      ),
    );
  }
}