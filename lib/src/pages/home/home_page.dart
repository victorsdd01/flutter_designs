
import 'dart:convert';
import 'package:designs/src/models/models.dart';
import 'package:designs/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Sections> sections = [];

  Future<void> readJson() async {
    final String response = await  rootBundle.loadString('assets/data/data.json');
    final Map<String,dynamic> data = await jsonDecode(response);
    final result = SectionsResponse.fromMap(data);
    setState(() {  
      sections = result.sections;
    });
  }

  @override
  void initState() {
    readJson();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 100.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(padding: EdgeInsets.only(left: 10.0)),
                  const Text('Dark mode'),
                  Switch.adaptive(
                    value: context.watch<AppTheme>().darkTheme, 
                    onChanged: (value) => Provider.of<AppTheme>(context, listen: false).darkTheme = value
                  ),
                ],
              )
            ],
           )
        ),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(indent: 20.0, endIndent: 80.0,),
        itemCount:sections.length,
        itemBuilder: (context, index) {
          final Sections item = sections[index];
          return ListTile(
            title: Text(item.name),
            trailing: IconButton(
              onPressed: () => Navigator.pushReplacementNamed(context, 'selected-section', arguments: item),
              icon: const Icon(Icons.chevron_right_sharp, color: Colors.black87, size: 20,)
            ),
          );
        },
      )
    );
  }
}