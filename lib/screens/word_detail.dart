import 'package:flutter/material.dart';

class WordDetail extends StatefulWidget {
  String appBarTitle;
  WordDetail(this.appBarTitle);

  @override
  WordDetailState createState() => WordDetailState(this.appBarTitle);
}

class WordDetailState extends State<WordDetail> {
  String appBarTitle;
  TextEditingController englishController = TextEditingController();
  TextEditingController newariController = TextEditingController();

  WordDetailState(this.appBarTitle);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.subhead;
    return WillPopScope(
      onWillPop: (){
        toPreviousScreen();
      },
    child: Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: (){
            toPreviousScreen();
          }
        )
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
    )
    );
  }

  void toPreviousScreen(){
    debugPrint('Pop and move to previous screen');
    Navigator.pop(context);
  }
}