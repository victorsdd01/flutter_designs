
import 'dart:convert';
import 'package:designs/src/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ListView.builder(
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