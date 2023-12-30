

// ignore_for_file: unused_element

import 'package:designs/src/models/models.dart';
import 'package:flutter/material.dart';

class SliversWidgets extends StatefulWidget {
  const SliversWidgets({super.key});

  @override
  State<SliversWidgets> createState() => _SliversWidgetsState();
}

class _SliversWidgetsState extends State<SliversWidgets> with SingleTickerProviderStateMixin {

  ScrollController scrollController = ScrollController();

  late AnimationController animationController;
  late Animation<double> moveUp;

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
    moveUp =  Tween(begin: 100.0, end: 0.0 ).animate(CurvedAnimation(parent: animationController, curve: Curves.ease));
    scrollController.addListener(() {

      final int maxScroll = scrollController.position.maxScrollExtent.toInt();
      final int currenPosition = scrollController.position.pixels.toInt();
      
      if (currenPosition >= maxScroll) {
        animationController.forward();
      } else {
        animationController.reverse();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _MainScroll(
          controller: scrollController
        ),
        _BottomButton(
          animationController: animationController,
          animationValue: moveUp,
        )
      ]
    );
  }
}

class _MainScroll extends StatelessWidget {
  const _MainScroll({
    required this.controller,
  });

  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: controller,
      slivers: [
        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegate(
            child: const _Title(), 
            minHeight: 100, 
            maxHeight: 110,
          )
        ),
        SliverAnimatedList(
          initialItemCount: SliversWidget.items.length,
          itemBuilder: (context, index, animation) {
            final SliversWidget item = SliversWidget.items[index];
            return Container(
              height: 100,
              padding: const EdgeInsets.only(left: 20),
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: item.color,
                borderRadius: BorderRadius.circular(25)
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  item.text, 
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                  ),
                )
              ),
            );
          },
        ),
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {

  _SliverCustomHeaderDelegate({
    required this.minHeight, 
    required this.maxHeight, 
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;


  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) => SizedBox.expand(
    child: child,
  );

  @override
  
  double get maxExtent => maxHeight;

  @override
  
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant _SliverCustomHeaderDelegate oldDelegate) => maxHeight != oldDelegate.maxHeight || minHeight != oldDelegate.minHeight || child != oldDelegate.child;
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20.0),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('New', style: TextStyle(fontSize: 40.0, color: Colors.brown.shade700)),
          Text('List', style: TextStyle(fontSize: 30.0, color: Colors.red.shade900),),
        ],
      ),
    );
  }
}

class _List extends StatelessWidget {
  const _List();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: SliversWidget.items.length,
      itemBuilder: (context, index) {
        final SliversWidget item = SliversWidget.items[index];
        return Container(
          height: 100,
          padding: const EdgeInsets.only(left: 20),
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: item.color,
            borderRadius: BorderRadius.circular(25)
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              item.text, 
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600
              ),
            )
          ),
        );
      },
    );
  }
}

class _BottomButton extends StatelessWidget {
  const _BottomButton({
    required this.animationController,
    required this.animationValue,
  });


  final AnimationController animationController;
  final Animation<double> animationValue;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      child: AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget? _) => Transform.translate(
          offset: Offset(0.0, animationValue.value),
          child: Container(
            height: 100,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: const BoxDecoration(
              color: Color(0xffed6762),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(50))
            ),
            child: const Center(
              child: Text('CREATE NEW LIST', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),)
            ),
          ),
        ),
      )
    );
  }
}