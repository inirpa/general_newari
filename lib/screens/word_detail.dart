import 'package:flutter/material.dart';

class WordDetail extends StatefulWidget {
  @override
  WordDetailState createState() => WordDetailState();
}

class WordDetailState extends State<WordDetail> {
  TextEditingController englishController = TextEditingController();
  TextEditingController newariController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.subhead;
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail page'),
      ),
      body:Padding(
          padding: EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  controller: englishController,
                  style: textStyle,
                  onChanged: (value){
                    debugPrint('some update');
                  },
                  decoration: InputDecoration(
                    labelText: 'English word',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)
                    )
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  controller: newariController,
                  style: textStyle,
                  onChanged: (value){
                    debugPrint('some update');
                  },
                  decoration: InputDecoration(
                    labelText: 'Newari translated word',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)
                    )
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text(
                        'Update',
                        textScaleFactor: 1.5,
                       ),
                       onPressed: (){
                         setState(() {
                          debugPrint('update');
                         });
                       },
                    ),
                  ),
                  Container(width: 5.0,),
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text(
                        'Delete',
                        textScaleFactor: 1.5,
                       ),
                       onPressed: (){
                         setState(() {
                           debugPrint('delete');
                         });
                       },
                    ),
                  ),
                  
                ],),
              )
            ],
          ),
        )
    );
  }
}