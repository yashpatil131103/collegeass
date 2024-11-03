import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project_handling_app/pages/login_page.dart';

class Confirmationpage extends StatefulWidget {
  const Confirmationpage({super.key});

  @override
  State<Confirmationpage> createState() => _ConfirmationpageState();
}

class _ConfirmationpageState extends State<Confirmationpage>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Navigate to Loginpage once the animation completes
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x00962e),
      body: Center(
        child: Lottie.asset(
          "assets/check.json",
          controller: _controller,
          onLoaded: (composition) {
            _controller
              ..duration = composition.duration
              ..forward();
          },
        ),
      ),
    );
  }
}
