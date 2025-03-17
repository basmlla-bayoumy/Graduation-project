class Homepage2Model {
  final String ? image ;

  Homepage2Model({required this.image});

  factory Homepage2Model.fromJson(jsonData) 
  {
    return Homepage2Model(
      image:jsonData ?['orgin_image'],
     );
  }

}