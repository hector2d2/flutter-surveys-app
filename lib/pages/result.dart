import 'package:encuestas/provider/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
        centerTitle: true,
      ),
      body: _ListResult(),
    );
  }
}

class _ListResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    return ListView.builder(
      itemCount: homeProvider.listQuestions.length,
      itemBuilder: (BuildContext context, int index) => _BoxResult(
        index,
        homeProvider.listQuestions[index].title,
        homeProvider.listQuestions[index].answer,
      ),
    );
  }
}

class _BoxResult extends StatelessWidget {
  final int index;
  final String question;
  final String answer;

  const _BoxResult(this.index, this.question, this.answer);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('${index + 1} .-'),
              SizedBox(
                width: 10,
              ),
              Text('$question'),
            ],
          ),
          Container(
            child: Text(answer),
          ),
        ],
      ),
    );
  }
}
