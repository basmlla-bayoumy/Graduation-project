class ChatModel {
  final String message;
  final String subtitle;
  

  ChatModel(this.message, this.subtitle, {required List<String> imagePaths, String? imagePath});
}