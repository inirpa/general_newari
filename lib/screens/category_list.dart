import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:general_newari/screens/word_detail.dart';

class CategoryList extends StatefulWidget {
  @override
  // _CategoryListState createState() => _CategoryListState();
  State<StatefulWidget> createState(){
    return CategoryListState();
  }
}

class CategoryListState extends State<CategoryList> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
        leading: Icon(Icons.category),
      ),

      body: wordListView(),
      floatingActionButton: FloatingActionButton (
        onPressed: (){
          debugPrint('clicked');
          navigateToWords('From floating');
        },
        tooltip: ('Speak'),
        child: Icon(Icons.mic),
      )
      
    );
  }

  ListView wordListView(){
    TextStyle titleStyle = Theme.of(context).textTheme.subhead;
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position){
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blueAccent,
              child: Icon(Icons.keyboard_arrow_up),
            ),
            title: Text('First word'),
            subtitle: Text('its subtitle'),
            trailing: Icon(Icons.delete, color : Colors.blueGrey),
            onTap: (){
              debugPrint('dummy');
              navigateToWords('From individual list');
            },
          ),
        );
      },
    );
  }

  void navigateToWords(String title){
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WordDetail(title);
    }));
  }
}