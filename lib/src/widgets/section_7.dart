

import 'package:designs/src/models/models.dart';
import 'package:flutter/material.dart';

class EmergencyLayout extends StatelessWidget {
  const EmergencyLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Color(0xff5779f5),
                Color(0xFF82B9F8)
              ]
            ),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80))
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.25,
          child: Stack(
            children: [
              const Positioned(
                left: -120,
                top: -110,
                child: Icon(Icons.add, color: Colors.white30, size: 290,)
              ),
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  onPressed: (){}, 
                  icon: const Icon(Icons.more_vert_sharp, color: Colors.white,size: 35,)
                )
              ),
              const Positioned(
                child: Align(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('You have requested', style: TextStyle(color: Colors.white70, fontSize: 18, fontWeight: FontWeight.w500),),
                      SizedBox(height: 10,),
                      Text('Medical assistance', style: TextStyle(color: Colors.white70, fontSize: 23, fontWeight: FontWeight.w800),),
                      // SizedBox(height: 15,),
                      Icon(Icons.add, color: Colors.white, size: 120,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const Expanded(
          child: _List()
        )
      ],
    );
  }
}

class _List extends StatefulWidget {
  const _List();

  @override
  State<_List> createState() => _ListState();
}

class _ListState extends State<_List> {
  late ScrollController _scrollController;
  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      print('current position: ${_scrollController.position.pixels}');
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      padding: const EdgeInsets.only(top: 50),
      controller: _scrollController,
      addAutomaticKeepAlives: true,
      itemCount: ListItem.items.length,
      itemBuilder: (context, index) {
        ListItem item = ListItem.items[index];
        return _ListItem(
          colors: item.colors,
          child: Stack(
            children: [
              Positioned(
                top: -20,
                right: 0,
                child: index == 0 
                ? Transform.rotate(angle: 45, child: Icon(item.icon, color: Colors.white12, size: 130,),)  
                : Icon(item.icon, color: Colors.white12, size: 130,)
              ),
              Positioned(
                child: Align(
                  child: Row(
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width * 0.05,),
                      index == 0 
                      ? Transform.rotate(
                        angle: 45, 
                        child: Icon(item.icon, color: Colors.white, size: 45,) ,
                      ) 
                      : Icon(item.icon, color: Colors.white, size: 45,),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
                      Text(item.text, style: const TextStyle(color: Colors.white, fontSize: 18),),
                      const Spacer(),
                      IconButton(
                        onPressed: (){
                          print('index:$index');
                        }, 
                        icon: const Icon(Icons.chevron_right_sharp, color: Colors.white, size: 35,)
                      )
                      
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      });
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem({
    required this.child, 
    this.colors,
  });


  final List<Color>? colors;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12.0),
      height: MediaQuery.of(context).size.height * 0.10,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors != null ? colors! : [
            Color(Colors.pink.shade300.value),
            Color(Colors.purple.shade300.value),
          ]
        ),
        borderRadius: BorderRadius.circular(12)
      ),
      child: child
    );
  }
}