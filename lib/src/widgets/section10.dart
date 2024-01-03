


import 'dart:ui';

import 'package:designs/src/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ShoesApp extends StatelessWidget {
  const ShoesApp({super.key});

  @override
  Widget build(BuildContext context) {

    List<String> sizes = ['7','2.5','8','8.5','9.5'];

    return Scaffold(
      body: SafeArea(
        top: true,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TweenAnimationBuilder(
                    tween: Tween(
                      begin: -40.0,
                      end: 25.0
                    ), 
                    duration: const Duration(
                      milliseconds: 900
                    ),
                    curve: Curves.ease,
                    builder: (context, value, child) {
                      return Transform.translate(
                        offset: Offset((value -25.0), 0.0),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: child!
                        ),
                      );
                    },
                    child: const Text(
                      'For you',
                      style: TextStyle(
                        fontSize: 30, 
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                  TweenAnimationBuilder(
                    curve: Curves.ease,
                    tween: Tween(
                      begin: -20.0,
                      end: 0.0
                    ), 
                    duration: const Duration(
                      milliseconds: 900
                    ),
                    builder: (context, value, child) {
                      return Transform.translate(
                        offset: Offset(0.0, value),
                        child: child!
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Icon(Icons.search)
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0,),
              Container(
                width: MediaQuery.of(context).size.width * 0.90,
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                  color: Colors.amber.shade400,
                  borderRadius: BorderRadius.circular(60),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) => const DetailsPage(),)
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(35),
                        child: Hero(
                          tag: 'nike-image',
                          child: TweenAnimationBuilder(
                            curve: Curves.ease,
                            tween: Tween(begin: - 5.0, end: 5.0),
                            duration: const Duration(seconds: 1),
                            builder: (BuildContext context, double value, Widget? child) {
                               return Transform.translate(
                                  offset: Offset(0.0, value - 5.0),
                                  child: child,
                               );
                             },
                            child: Image.asset(
                              'assets/img/${context.watch<ShoeProvider>().currentColor}.png',
                              filterQuality: FilterQuality.high,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(bottom: 26.0),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.08,
                      child: Center(
                        child: ListView.builder(
                          itemCount: sizes.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final String size = sizes[index];
                            return Container(
                              margin: const EdgeInsets.all(2.0),
                              child: GestureDetector(
                                onTap: () => Provider.of<ShoeProvider>(context, listen: false).selectedShoeSize = index,
                                child: Chip(
                                  color: MaterialStateColor.resolveWith((_) => context.watch<ShoeProvider>().selectedShoeSize == index ?  Colors.orange: Colors.white),
                                  materialTapTargetSize: MaterialTapTargetSize.padded,
                                  side: BorderSide.none,
                                  elevation: 0.6,
                                  label: Text(size, style: TextStyle(color: context.watch<ShoeProvider>().selectedShoeSize == index ? Colors.white : Colors.amber.shade800),)
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                    child: TweenAnimationBuilder(
                      duration: const Duration(milliseconds: 900),
                      tween: Tween(begin: -20.0 ,end: 10.0),
                      curve: Curves.ease,
                      builder: (context, value, child) {
                        return Transform.translate(
                          offset: Offset(value - 10.0, 0.0),
                          child: child!,
                        );
                      },
                      child: const Text(
                        'Nike Air Max 720',
                        style: TextStyle(
                          fontSize: 25, 
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                child:  Text('''The Nike Air Max 720 gies bigger than ever before with Nike's tallest Air until yet, offerting more air underfood for unimaginable, all-day comfort, Has Air...''', 
                  style: TextStyle(wordSpacing: 5.0, letterSpacing: 1.2,height: 1.5, color: Colors.grey.shade600),
                ),
              ),
              const Spacer(),
              TweenAnimationBuilder(
                tween: Tween(begin: 50.0, end: 10.0),
                duration: const Duration(seconds: 2),
                curve: Curves.ease,
                builder: (BuildContext context, value, Widget? child) {
                  return Transform.translate(
                    offset: Offset(0.0, value - 10.0),
                    child: child!,
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 10.0, left: 12.0, right: 12.0),
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(70),
                    color: const Color(0xfff5f5f5)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding:  EdgeInsets.only(
                          left: 15.0
                        ),
                        child: Text("\$180.0", 
                        style: TextStyle(
                          fontWeight: FontWeight.w700, 
                          fontSize: 18
                          )
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right:15.0
                        ),
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith((_) => Colors.orange)
                          ),
                          onPressed: (){}, 
                          child: const Text('Add to cart', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),)
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}

// DETAILS PAGE----

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    List<Color> _colors = [const Color(0xff41545c), const Color(0xff40a6f3), const Color(0xfffcb302), const Color(0xffcedc38)];

    return Scaffold(
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              margin: const EdgeInsets.all(3.5),
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(35)
              ),
              child: Stack(
                children: [
                  Align(
                    child: Hero(
                      tag: 'nike-image',
                      child: Image.asset('assets/img/${context.watch<ShoeProvider>().currentColor}.png')
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {
                        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
                        Navigator.pushReplacement(context, 
                        MaterialPageRoute(
                          builder: (context) => const ShoesApp(),
                        )
                      );
                      },
                      icon: const Icon(Icons.chevron_left_outlined, color: Colors.white, size: 30,)
                    ),
                  )
                ],
              ),
            ),
            TweenAnimationBuilder(
              tween: Tween(begin: -60.0, end: 5.0),
              duration: const Duration(milliseconds: 900),
              builder: (BuildContext context, double value, Widget? child) {
                return Opacity(
                  opacity: clampDouble(value, 0.1, 0.9),
                  child: Transform.translate(
                    offset: Offset(0.0, value - 5.0),
                    child: child,
                  ),
                );
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10.0, top: 25.0, bottom: 25.0),
                    child: Text('Nike Air Max 720', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),)
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10.0),
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: Text(
                '''The Nike Air Max 720 gies bigger than ever before with Nike's tallest Air until yet, offerting more air underfood for unimaginable, all-day comfort, Has Air...''',
                style: TextStyle(wordSpacing: 5.0, letterSpacing: 1.2,height: 1.5, color: Colors.grey.shade600),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:10.0),
                  child: TweenAnimationBuilder(
                    tween: Tween(begin: -50.0 ,end: 5.0),
                    duration: const Duration(seconds: 1),
                    curve: Curves.ease,
                    builder: (BuildContext context, double value, Widget? child) {
                      return Transform.translate(
                        offset: Offset(value - 5.0, 0.0),
                        child: child,
                      );
                    },
                    child: const Text('\$180.0', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),)
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: TweenAnimationBuilder(
                    curve: Curves.ease,
                    tween: Tween(begin: 50.0, end: 5.0),
                    duration: const Duration(seconds: 1),
                    builder: (BuildContext context, double value, Widget? child) {
                      return Transform.translate(
                        offset: Offset(value -5.0, 0.0),
                        child: child!,
                      );
                    },
                    child: TextButton(
                      onPressed: () {
                      
                      },
                      style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((_) => Colors.orange),),
                      child: const Text('Buy now', style: TextStyle(color: Colors.white),)
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 18.0),
                  width: MediaQuery.of(context).size.width / 2,
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _colors.length,
                    itemBuilder: (context, index) {
                      Color color =  _colors[index];
                      return Align(
                        widthFactor: 0.6,
                        child: GestureDetector(
                          onTap: () {
                            final ShoeProvider shoeProvider = Provider.of<ShoeProvider>(context, listen: false);
                            switch (index) {
                              case 0:
                                shoeProvider.currentColor = 'negro';
                              break;
                              case 1:
                                shoeProvider.currentColor = 'azul';
                              break;
                              case 2:
                                shoeProvider.currentColor = 'amarillo';
                              break;
                              case 3:
                                shoeProvider.currentColor = 'verde';
                              break;
                            }
                          },
                          child: CircleAvatar(
                            backgroundColor: color,
                          ),
                        ),
                      );
                    },
                  )
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: TextButton(
                    onPressed: () {
                      
                    }, 
                    style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((_) => Colors.orange.withOpacity(0.4))),
                    child: const Text('More related items', style: TextStyle(color: Colors.white),)
                  ),
                )
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _FloatingButtongs(
                  onClick: () {}, 
                  iconColor: Colors.red, 
                  icon: Icons.favorite,
                ),
                _FloatingButtongs(
                  onClick: () {}, 
                  iconColor: Colors.grey.shade300, 
                  icon: Icons.shopping_cart_rounded,
                ),
                _FloatingButtongs(
                  onClick: () {}, 
                  iconColor: Colors.grey.shade300, 
                  icon: Icons.settings,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _FloatingButtongs extends StatelessWidget {
  const _FloatingButtongs({
    required this.onClick, 
    required this.iconColor,
    required this.icon,
  });

  final Function onClick;
  final Color iconColor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick(),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(offset: const Offset(1.2, 1.0), color: Colors.grey.shade400, blurRadius: 1.0,),
          ]
        ),
        child: Icon(icon, color: iconColor,),
      ),
    );
  }
}