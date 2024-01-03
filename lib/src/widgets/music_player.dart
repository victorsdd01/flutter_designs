


// ignore_for_file: camel_case_types

import 'dart:math';

import 'package:designs/src/helpers/helpers.dart';
import 'package:designs/src/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({super.key});

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> with TickerProviderStateMixin {

  late AnimationController _animatedButtonController;
  late AnimationController _animationImageContorller;

  late Animation<double> _imageAnimation;

  @override
  void initState() {
    _animatedButtonController = AnimationController(vsync: this, duration: const Duration(milliseconds: 900));
    _animationImageContorller = AnimationController(vsync: this, duration: const Duration(seconds: 60));
    _imageAnimation =  Tween(begin: 0.0, end: 360.0).animate(CurvedAnimation(
        parent: _animationImageContorller, 
        curve: Curves.ease
      )
    );
    super.initState();
  }

  @override
  void dispose() {
    _animatedButtonController.dispose();
    _animationImageContorller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    
    return Scaffold(
      backgroundColor: const Color(0xff211e28),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
              ),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.center,
                colors: [
                  Color(0xff302e3a),
                  Color(0xff211e28),
                ]
              )
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:40.0),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          
                        }, 
                        icon: const Icon(
                          Icons.chevron_left_outlined, 
                          color: Color(0xff6f6f75),
                          size: 40,
                        )
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(
                          Icons.messenger_outline_sharp,
                          size: 25,
                        ), 
                        color: const Color(0xff6f6f75),  
                        onPressed: () {  },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.headphones,
                          size: 25,
                        ), 
                        color: const Color(0xff6f6f75),  
                        onPressed: () {  },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.ios_share_outlined,
                          size: 25,
                        ), 
                        color: const Color(0xff6f6f75),  
                        onPressed: () {  },
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: CustomPaint(
                        painter: _Painter(),
                        child: Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: AnimatedBuilder(
                              animation: _animationImageContorller,
                              builder: (BuildContext context, Widget? child) {
                                return Transform.rotate(
                                  angle: _imageAnimation.value,
                                  child: child,
                                );
                              },
                              child: Image.asset('assets/aurora.jpg', height: 150, width: 150,),
                            )
                          ),
                        ),
                      ),
                    ),
                    
                    const Column(
                      children: [
                        Text('04:53', style: TextStyle(color: Colors.white),),
                        _verticalLinearProgressIndicator(),
                        Text('02:58', style: TextStyle(color: Colors.white),),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Far Away', style: TextStyle(color: Colors.white),),
                    GestureDetector(
                      onTap: () {
                        MusicPlayerProvider musicPlayerProvider = Provider.of<MusicPlayerProvider>(context, listen: false);
                        if (!musicPlayerProvider.play) {
                          _animatedButtonController.forward();
                          _animationImageContorller.repeat();
                          musicPlayerProvider.play = true;
                        } else {
                          _animatedButtonController.reverse();
                          _animationImageContorller.stop(canceled: false);
                          musicPlayerProvider.play = false;
                        }
                      },
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: const Color(0xfff8ca51),
                        child: AnimatedIcon(
                          size: 30,
                          color: Colors.black,
                          icon: AnimatedIcons.play_pause, 
                          progress: _animatedButtonController
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: ListWheelScrollView(
              itemExtent: 42,
              physics: const BouncingScrollPhysics(),
              diameterRatio: 1.5,
              children: Helpers.getLyrics().map((e) => Text(e, style: const TextStyle(color: Colors.white30),)).toList()
            ),
          ),
        ],
      ),
    );
  }
}

class _Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Rect rect = Rect.fromCircle(
      center:const  Offset(0, 0), 
      radius: 180,
    );

    const Gradient gradient = LinearGradient(
      colors: [
        Color(0xff3f3d44),
        Color(0xff1e1c23),
      ]
    );
    final Paint paint = Paint()
    ..strokeWidth = 10.0
    ..style = PaintingStyle.fill
    ..shader = gradient.createShader(rect);
    final Offset position = Offset(size.width * 0.5, size.height / 2);
    final double radius = min(size.width * 0.5, size.height * 0.5);

    
    canvas.drawCircle(position, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class _verticalLinearProgressIndicator extends StatelessWidget {
  const _verticalLinearProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.30,
      width: 5,
      child: const RotatedBox(
        quarterTurns: -1,
        child: LinearProgressIndicator(
          backgroundColor: Color(0xff38363f),
          value: 3.0,
          valueColor: AlwaysStoppedAnimation<Color>(Color(0xffd8d8d9)),
        )
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}