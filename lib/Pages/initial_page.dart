import 'dart:async';
import 'package:flutter/material.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _blinkAnimation;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );

    _blinkAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(_controller);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      }
    });

    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1F2A),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xA315745C),
                    blurRadius: 30, 
                    spreadRadius: 8,
                  )
                ]
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/icons/shield_empty.png',
                    width: 100,
                    height: 100,
                  ),
                  
                  AnimatedBuilder(
                    animation: _blinkAnimation,
                    builder: (context, child) {
                      return Transform.scale(
                        scaleY: _blinkAnimation.value, 
                        alignment: Alignment.center,
                        child: child,
                      );
                    },
                    child: Image.asset(
                      'assets/icons/eye_only.png',
                      width: 50,
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 30),

            const Text(
              'LocalEye',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
        
            const SizedBox(height: 10),

            const Text(
              "Your data doesn't leave the country",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 40),

            TextButton(
              onPressed: (){
                print('you clicked Start');
              }, 
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Start',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF1DE9B6),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 8), 
                  Icon(
                    Icons.arrow_forward_ios_sharp, 
                    color: Color(0xFF1DE9B6),
                    size: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}