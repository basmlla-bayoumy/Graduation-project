import 'package:dio/dio.dart';
import 'package:g2/models/details_model.dart';
import 'package:g2/models/homepage2_model.dart';
import 'package:g2/models/words_model.dart';

class Getimages {
  final Dio dio;
  Getimages(this.dio);

  Future<List<DetailsModel>> getImages() async {
    try {
      var response = await dio.get(
          'https://df24-197-37-192-80.ngrok-free.app/api/images?page=1&limit=28',
          options: Options(
            headers: {'Accept': 'application/json'},
            followRedirects: false,
            validateStatus: (status) => true,
          ));
      print(' this is my response $response.data');
      Map<String, dynamic> jsonData = response.data;

      List<dynamic> letters = jsonData['letters'];

      List<DetailsModel> detailsList = [];

      for (var letter in letters) {
        DetailsModel detailsModel = DetailsModel.fromJson(letter);

        detailsList.add(detailsModel);
      }
      return detailsList;
    } catch (e) {
      print('this is error$e');
      return [];
    }
  }

  Future<List<Homepage2Model>> getOutImages() async {
    try {
      var response = await dio.get(
          'https://df24-197-37-192-80.ngrok-free.app/api/letters?page=1&limit=28',
          options: Options(
            headers: {'Accept': 'application/json'},
            followRedirects: false,
            validateStatus: (status) => true,
          ));
      print(' this is my response $response.data');
      Map<String, dynamic> jsonData = response.data;

      List<dynamic> letters = jsonData['letters'];

      List<Homepage2Model> homepage2List = [];

      for (var letter in letters) {
        Homepage2Model homepage2model = Homepage2Model.fromJson(letter);

        homepage2List.add(homepage2model);
      }
      return homepage2List;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<WordsModel>> getWords() async {
    try {
      var response = await dio.get(
          'https://3cbb-197-37-192-80.ngrok-free.app/api/words?page=1&limit=28',
          options: Options(
            headers: {'Accept': 'application/json'},
            followRedirects: false,
            validateStatus: (status) => true,
          ));
      print(' this is my response $response.data');
      Map<String, dynamic> jsonData = response.data;

      List<dynamic> words = jsonData['words'];

      List<WordsModel> wordsList = [];

      for (var word in words) {
        WordsModel wordsModel = WordsModel.fromJson(word);

        wordsList.add(wordsModel);
      }
      return wordsList;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
