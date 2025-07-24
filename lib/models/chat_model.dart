import 'package:hive/hive.dart';

part 'chat_model.g.dart';

@HiveType(typeId: 0)
class ChatModel extends HiveObject {
  @HiveField(0)
  final String message;

  @HiveField(1)
  final String subtitle;

  @HiveField(2)
  final List<String> imagePaths;

  @HiveField(3)
  final List<String> aiResponses;

  ChatModel({
    required this.message,
    required this.subtitle,
    required this.imagePaths,
    required this.aiResponses,
  });
}



