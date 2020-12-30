import 'package:flutter/material.dart';
import 'package:encuestas/widgets/custom_question.dart';

class HomeProvider with ChangeNotifier {
  List<CustomQuestion> _listQuestions = [];

  List<CustomQuestion> get listQuestions => this._listQuestions;

  void addListQuestions(CustomQuestion customQuestion) {
    this._listQuestions.add(customQuestion);
    notifyListeners();
  }

  @override
  void dispose() {
    print('hola soy el dispose');
    super.dispose();
  }
}
