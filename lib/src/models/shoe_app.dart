class Shoe{

  String image;
  String title;
  String description;


  Shoe({
    required this.title,
    required this.image,
    required this.description,
  });

  static List<Shoe> items = [
    Shoe(
      title: 'Nike Air Max 720', 
      image: 'assets/img/', 
      description: '''The Nike Air Max 720 gies bigger than ever before with Nike's tallest Air until yet, offerting more air underfood for unimaginable, all-day comfort, Has Air...''',
    )
  ];

}