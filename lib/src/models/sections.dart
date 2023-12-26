
class SectionsResponse {

  List<Sections> sections;
  SectionsResponse({
    required this.sections
  });

  factory SectionsResponse.fromMap(Map<String, dynamic> json) => SectionsResponse(
    sections: List<Sections>.from(json["sections"].map((x) => Sections.fromMap(x))),
  );

}

class Sections{
  int id;
  String name;
  String routeName;
  List<Widgets> widgets;

  Sections({
    required this.id,
    required this.name,
    required this.routeName,
    required this.widgets
  });

  factory Sections.fromMap(Map<String,dynamic> json) => Sections(
    id: json["id"], 
    name: json["name"], 
    routeName: json["routeName"], 
    widgets: List<Widgets>.from(json["widgets"].map((x)=> Widgets.fromMap(x)))
  );
}

class Widgets{
  String widgetName;
  String widget;
  Widgets({
    required this.widgetName,
    required this.widget
  });

  factory Widgets.fromMap(Map<String,dynamic> json) => Widgets(
    widgetName: json['widgetName'], 
    widget: json['widget']
  );
}