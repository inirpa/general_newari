import 'package:flutter/material.dart';
import 'package:general_newari/models/categories.dart';
import 'package:general_newari/utils/database_helper.dart';
import 'package:intl/intl.dart';

class WordDetail extends StatefulWidget {
  final String appBarTitle;
  final Categories categories;
  WordDetail(this.categories, this.appBarTitle);

  @override
  WordDetailState createState() => WordDetailState(this.categories, this.appBarTitle);
}

class WordDetailState extends State<WordDetail> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  String appBarTitle;
  Categories categories;
  TextEditingController englishController = TextEditingController();
  TextEditingController newariController = TextEditingController();
  TextEditingController iconController = TextEditingController();

  WordDetailState(this.categories, this.appBarTitle);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.subhead;

    englishController.text = categories.name;
    newariController.text = categories.description;
    iconController.text = categories.icon;

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
                    updateName();
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
                    updateDescription();
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
                child: TextField(
                  controller: iconController,
                  style: textStyle,
                  onChanged: (value){
                    debugPrint('some update');
                    updateIcon();
                  },
                  decoration: InputDecoration(
                    labelText: 'Category icon',
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
                          _save();
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
                           _delete();
                         });
                       },
                    ),
                  ),
                ],
                ),
              ),
            ],
          ),
        )
    )
    );
  }

  void toPreviousScreen(){
    debugPrint('Pop and move to previous screen');
    Navigator.pop(context, true);
  }

  void updateName(){
    categories.name = englishController.text;
  }

  void updateDescription(){
    categories.description = newariController.text;
  }

  void updateIcon(){
    categories.icon = iconController.text;
  }

  void _save() async{
    int result;
    toPreviousScreen();
    categories.date = DateFormat.yMMMMd().format(DateTime.now());
    if(categories.id != null){
      result = await databaseHelper.updateCategory(categories);
    }else{
      result = await databaseHelper.insertCategory(categories);
    }

    if(result != 0){
      _showAlertDialog('Success','Category upated');
    }else{
      _showAlertDialog('Error','Operation failed');
    }
  }

  void _delete() async{
    toPreviousScreen();
    if(categories.id == null){
      _showAlertDialog('Error', 'Category not deleted');
      return;
    }else{
      int result = await databaseHelper.deleteCategory(categories.id);
      if(result != 0){
        _showAlertDialog('Success','Category delted');
      }else{
        _showAlertDialog('Error','Operation failed');
      }
    }
  }

  void _showAlertDialog(String title, String message){
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(
      context: context,
      builder: (_) => alertDialog,
    );
  }
} 