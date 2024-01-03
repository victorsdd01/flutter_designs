

import 'package:designs/src/providers/slider_show_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SlideShow extends StatelessWidget {
  const SlideShow({super.key});



  @override
  Widget build(BuildContext context) {

    List<Widget> pages = const <Widget>[
      _Slide(svg: 'assets/svg/slide-1.svg',),
      _Slide(svg: 'assets/svg/slide-2.svg',),
      _Slide(svg: 'assets/svg/slide-3.svg',),
      _Slide(svg: 'assets/svg/slide-4.svg',),
      _Slide(svg: 'assets/svg/slide-5.svg',),
    ];

    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: _Slides(pages: pages,)
          ),
          _Dots(pages: pages,)
        ],
      )
    );
  }
}

class _Dots extends StatelessWidget {
  const _Dots({required this.pages});

  final List<Widget> pages;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: dots(context),
      ),
    );
  }

  List<Widget> dots(context){
    final List<Widget> dots = [];
    for (var i = 0; i < pages.length; i++) {
      final Widget dot = AnimatedContainer(
        height: (Provider.of<SliderShowProvider>(context).currentPage >= i - 0.5 &&  Provider.of<SliderShowProvider>(context).currentPage < i + 0.5) ? 16 : 12,
        width: (Provider.of<SliderShowProvider>(context).currentPage >= i - 0.5 &&  Provider.of<SliderShowProvider>(context).currentPage < i + 0.5) ? 16 : 12,
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: (Provider.of<SliderShowProvider>(context).currentPage >= i - 0.5 &&  Provider.of<SliderShowProvider>(context).currentPage < i + 0.5) ? Colors.red.shade400 : Colors.red.shade200 ,
          borderRadius: BorderRadius.circular(100)
        ), duration: const Duration(milliseconds: 200),
        curve: Curves.bounceInOut,
      );
      dots.addAll([dot]);
    }
    return dots;
  }
}

class _Slides extends StatefulWidget {
  const _Slides({
    required this.pages
  });


  final List<Widget> pages;

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {

  PageController controller = PageController();

  @override
  void initState() {
    controller.addListener(() => Provider.of<SliderShowProvider>(context, listen: false).currentPage = controller.page!);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      children: widget.pages,
    );
  }
}

class _Slide extends StatelessWidget {
  const _Slide({
    required this.svg
  });

  final String svg;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: SvgPicture.asset(svg)
    );
  }
}