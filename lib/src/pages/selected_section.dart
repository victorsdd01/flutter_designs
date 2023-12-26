
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
        leading: IconButton(onPressed: ()=> Navigator.pushReplacementNamed(context, 'home'), icon: const Icon(Icons.arrow_back, color: Colors.white, size: 20,)),
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
                  case "SquareHeader()":
                    Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) => ExampleMask(widget: const SquareHeader())
                      )
                    );
                    break;
                    case "RoundedBordersHeader()":
                    Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) => ExampleMask(widget: const RoundedBordersHeader())
                      )
                    );
                    break;
                    case "DiagonalHeader()":
                    Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) => ExampleMask(widget: const DiagonalHeader())
                      )
                    );
                    break;

                  default:
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