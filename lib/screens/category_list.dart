import 'dart:async';
import 'package:flutter/material.dart';
import 'package:general_newari/models/categories.dart';
import 'package:general_newari/screens/word_detail.dart';
import 'package:general_newari/utils/database_helper.dart';
import 'package:sqflite/sqflite.dart';

class CategoryList extends StatefulWidget {
  @override
  // _CategoryListState createState() => _CategoryListState();
  State<StatefulWidget> createState(){
    return CategoryListState();
  }
}

class CategoryListState extends State<CategoryList> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Categories> categories;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    if(categories==null){
      categories = List<Categories>();
      updateCategoryView();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
        leading: Icon(Icons.category),
      ),

      body: wordListView(),
      floatingActionButton: FloatingActionButton (
        onPressed: (){
          debugPrint('clicked');
          navigateToWords(Categories('',''), 'New category');
        },
        tooltip: ('Speak'),
        child: Icon(Icons.add),
      )
      
    );
  }

  ListView wordListView(){
    TextStyle nameStyle = Theme.of(context).textTheme.subhead;
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position){
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blueAccent,
              child: Icon(Icons.keyboard_arrow_right),
            ),
            title: Text(this.categories[position].name, style: nameStyle,),
            subtitle: Text(this.categories[position].date),
            trailing: GestureDetector(
              child: Icon(Icons.delete, color : Colors.blueGrey),
              onTap: (){
                _deleteCategory(context, categories[position]);
              },
            ),
            onTap: (){
              debugPrint('Detail view');
              navigateToWords(this.categories[position],'Edit ');
            },
          ),
        );
      },
    );
  }

  void navigateToWords(Categories category, String title) async {
    bool result = await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WordDetail(category, title);
    }));
    
    if(result == true){
      updateCategoryView();
    }
  }

  void _deleteCategory(BuildContext context, Categories category) async {
    int result = await databaseHelper.deleteCategory(category.id);
    if(result !=0){
      _showSnackBar(context, 'Category deleted successfully');
      updateCategoryView();
    }
  }

  void _showSnackBar(BuildContext context, String message){
    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void updateCategoryView(){
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database){
      Future<List<Categories>> categoryListFuture = databaseHelper.getCategoryList();
      categoryListFuture.then((categoryList){
        setState(() {
          this.categories = categoryList;
          this.count = categoryList.length;
        });
      });
    });
  }
}