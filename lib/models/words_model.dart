class WordsModel {
  final String ? image ;

  WordsModel({required this.image});

  factory WordsModel.fromJson(jsonData) 
  {
    return WordsModel(
      image:jsonData ?['largeImageURL'],
     );
  }
}