
import 'package:designs/src/models/sections.dart';
import 'package:designs/src/pages/pages.dart';
import 'package:designs/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SelectedSection extends StatelessWidget {
  const SelectedSection({super.key});
  @override
  Widget build(BuildContext context) {

    final Sections data =  ModalRoute.of(context)!.settings.arguments as Sections;
  
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: ()=> Navigator.pushReplacementNamed(context, 'home'), icon: const Icon(Icons.arrow_back, color: Colors.black, size: 20,)),
        title: Text(data.name)
      ),
      body: ListView.builder(
        itemCount: data.widgets.length,
        itemBuilder: (context, index) {
          final Widgets widget =  data.widgets[index];
          return ListTile(
            title: Text(widget.widgetName),
            trailing: IconButton(
              onPressed: () {
                switch (widget.widget) {
                  // section 2
                  case "SquareHeader()":
                    Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) => ExampleMask(widget: const SquareHeader(), name: widget.widgetName, section: data,)
                      )
                    );
                    break;
                    case "RoundedBordersHeader()":
                    Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) => ExampleMask(widget: const RoundedBordersHeader(), name: widget.widgetName, section: data,)
                      )
                    );
                    break;
                    case "DiagonalHeader()":
                    Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) => ExampleMask(widget: const DiagonalHeader(), name: widget.widgetName, section: data,)
                      )
                    );
                    break;
                    case "DiagonalPainter()":
                    Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) => ExampleMask(widget: const DiagonalHeader(), name: widget.widgetName, section: data,)
                      )
                    );
                    break;
                    case "TruanguleHeader()":
                    Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) => ExampleMask(widget: const DiagonalHeader(), name: widget.widgetName, section: data,)
                      )
                    );
                    break;
                    case "TriangulePainter()":
                    Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) => ExampleMask(widget: const DiagonalHeader(), name: widget.widgetName, section: data,)
                      )
                    );
                    break;
                    //------------
                    // section 3
                    case "Rectangle()":
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ExampleMask(widget: const Rectangle(), name: widget.widgetName, section: data)));
                    break;
                    case "AnimatedSquare()":
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ExampleMask(widget: const AnimatedSquare(), name: widget.widgetName, section: data),));
                    break;
                    //seaction 4
                    case "CircularProgress()":
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ExampleMask(widget: const CircularProgress(), name: widget.widgetName, section: data),));
                    break;
                    //------
                    // section 5
                    case "SlideShow()" :
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ExampleMask(widget: const SlideShow(), name: widget.widgetName, section: data),));
                    break;
                    // section 6
                    case "Pinterest()":
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ExampleMask(widget: const Pinteres(), name: widget.widgetName, section: data),));
                    break;
                    //--- section 7
                    case "EmergencyLayout()":
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ExampleMask(widget: const EmergencyLayout(), name: widget.widgetName, section: data)));
                    break;
                    //---- section 8
                    case "SliversWidgets()":
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ExampleMask(widget: const SliversWidgets(), name: widget.widgetName, section: data) ,));
                    break;
                    // ---- section 9
                    case "Twitter()":
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ExampleMask(widget: const Xintro(), name: widget.widgetName, section: data),));
                }
              }, 
              icon: const Icon(Icons.keyboard_arrow_right_outlined, color: Colors.black, size: 20,)
            ),
          );
        },
      ),
    );
  }
}