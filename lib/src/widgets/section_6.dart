import 'package:designs/src/models/models.dart';
import 'package:designs/src/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class Pinteres extends StatefulWidget {
  const Pinteres({super.key});

  @override
  State<Pinteres> createState() => _PinteresState();
}

class _PinteresState extends State<Pinteres> with SingleTickerProviderStateMixin {

  ScrollController controller =  ScrollController();
  double previesScrollPosition = 0.0;
  late AnimationController animationController;
  late Animation<double> moveDown;
  late Animation<double> scale;

  @override
  void initState() {
    animationController =  AnimationController(vsync: this, duration: const Duration(milliseconds: 600));
    moveDown = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(parent: animationController, curve: const Interval(0.0, 1.0, curve: Curves.easeInOut)));
    scale = Tween(begin: 25.0, end: 30.0).animate(CurvedAnimation(parent: animationController, curve: const Interval(0.0, 1.0, curve: Curves.easeInOut)));
    controller.addListener(() {
      double currenPosition = controller.position.pixels;
  
      if (currenPosition > previesScrollPosition) {
        animationController.forward();
      } else {
        animationController.reverse();
      }
      previesScrollPosition = currenPosition;
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [ 
          _GridView(controller: controller,),
          Positioned(
            bottom: 30.0,
            right: 60.0,
            left: 60.0,
            child: AnimatedBuilder(
              animation: animationController,
              builder: (BuildContext context, Widget? _) {  
                return Transform.translate(
                  offset: Offset(0.0, moveDown.value),
                  child: _BottomNavigationBar()
                );
              },
            ), 
          )
        ]
      )
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        color: Colors.white,
        height: 60,
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _buttons(context)
        ),
      ),
    );


  }

  List<Widget>  _buttons(context) {
    final List<Widget> buttons = [];
    for (var index = 0; index < Buttons.buttons.length; index++) {
      Buttons current = Buttons.buttons[index];
      buttons.addAll([
        _NavigationBarButton(
         icon: current.icon,
         color: Provider.of<PinteresProvider>(context).selectedButton == index && Provider.of<PinteresProvider>(context).selectedButton != Buttons.buttons.length - 1 ? Colors.red : current.color,
         iconSize:Provider.of<PinteresProvider>(context).selectedButton == index && Provider.of<PinteresProvider>(context).selectedButton != Buttons.buttons.length - 1 ? 30 : current.iconSize,
         onClick: (){
          if (current.id != Buttons.buttons.length - 1) {
           Provider.of<PinteresProvider>(context, listen: false).selectedButton = current.id;
          }
         },
        ),
      ]);
    }
    return buttons;
  }
}

class _NavigationBarButton extends StatefulWidget {
  const _NavigationBarButton({
    this.color = Colors.black, 
    required this.icon,
    required this.onClick, 
    this.iconSize = 20
  });


  final Color? color;
  final Widget icon;
  final Function onClick;
  final double? iconSize;

  @override
  State<_NavigationBarButton> createState() => _NavigationBarButtonState();
}

class _NavigationBarButtonState extends State<_NavigationBarButton> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> scale;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    scale = Tween(begin: 25.0, end: 35.0).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOutBack));
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: controller,
      alignment: Alignment.centerRight,
      child: IconButton(
        onPressed: () => widget.onClick(),
        iconSize: widget.iconSize, 
        color: widget.color,
        icon: widget.icon,
      ),
    );
  }
}

class _GridView extends StatelessWidget {
  const _GridView({
    required this.controller
  });

  final ScrollController controller;
  @override
  Widget build(BuildContext context) {
    return GridView.custom(
      controller: controller,
      gridDelegate: SliverQuiltedGridDelegate(
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        repeatPattern: QuiltedGridRepeatPattern.inverted,
        pattern: const [
          QuiltedGridTile(2, 2),
          QuiltedGridTile(1, 1),
          QuiltedGridTile(1, 1),
          QuiltedGridTile(1, 2),
        ],
      ),
      childrenDelegate: SliverChildBuilderDelegate(
        childCount: 50,
        (context, index) => ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/b/b6/Image_created_with_a_mobile_phone.png', 
            fit: BoxFit.cover
          ),
        ),
      ),
      
    );
  }
}