import 'package:encuestas/pages/result.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:encuestas/widgets/custom_question.dart';
import 'package:encuestas/provider/home.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.add_circle_outline),
            onPressed: () {
              final controller = TextEditingController();
              showDialog(
                context: context,
                child: AlertDialog(
                  content: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: controller,
                          decoration: InputDecoration(
                            labelText: 'Add Question',
                          ),
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    FlatButton(
                        child: const Text('CANCEL'),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    FlatButton(
                      child: const Text('SAVE'),
                      onPressed: () {
                        _saveQuestion(controller.text, context);
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: _MySurvey(),
    );
  }
}

void _saveQuestion(String question, BuildContext context) {
  final homeProvider = Provider.of<HomeProvider>(context, listen: false);
  TextEditingController controller = new TextEditingController();

  homeProvider.addListQuestions(CustomQuestion(
    title: question,
    controller: controller,
  ));
}

class _MySurvey extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    return ListView(
      children: [
        ...homeProvider.listQuestions,
        Container(
          margin: EdgeInsets.all(8),
          height: 50,
          child: RaisedButton(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            color: Colors.blue,
            child: Text(
              'Submit',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ResultPage(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
