class DetailsModel {
  
  final String ? image ;
 

 DetailsModel({required this.image});
  
  factory DetailsModel.fromJson(jsonData) 
  {
    return DetailsModel(
    image: jsonData['image'], 
     );
  }

  
 
}