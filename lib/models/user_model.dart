class UserModel {
   final String ?name;
   final String ?number ;
   final String ?email;
   final String ?age;
  final  String ?uId;
   bool ? isEmailVerified;

  UserModel({
    this.name,
    this.number,
    this.email,
    this.age,
    this.uId,
     this.isEmailVerified 
    });

  factory UserModel.fromJson(Map<String,dynamic>?jsonData) 
  {
    return UserModel(
      uId :jsonData!['uId'],
      name :jsonData['name'],
      number :jsonData['number'],
      email: jsonData['email'],
      age: jsonData['age'],
      isEmailVerified: jsonData['isEmailVerified']
      
     );
  }
 Map<String,dynamic> toMap(){
  return {
    'name' :name,
    'number' :number,
    'email' :email,
    'uId' :uId,
    'age' :age,
    'isEmailVerified':isEmailVerified
  };
 }




}
