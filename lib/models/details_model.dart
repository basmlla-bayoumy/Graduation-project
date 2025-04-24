class DetailsModel {
  
  final String ? image ;
  final String  text;
 

 DetailsModel({required this.image,required this.text});
  
  factory DetailsModel.fromJson(jsonData) 
  {
    return DetailsModel(
    text :jsonData ['letter'],
     image:jsonData['image'] );
  }

  
 
}