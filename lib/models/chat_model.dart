// class ChatModel {
//   final String message;
//   final String subtitle;
  

//   ChatModel(this.message, this.subtitle, {required List<String> imagePaths, String? imagePath});
// }







class ChatModel {
  final String message;
  final String subtitle;
  final List<String>? imagePaths;
  final String? imagePath;

  ChatModel(this.message, this.subtitle, {this.imagePaths, this.imagePath});
}