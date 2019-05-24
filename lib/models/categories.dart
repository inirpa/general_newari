class Categories{
  int _id;
  String _name;
  String _description;
  String _date;

  Categories(this._name, this._date, [this._description]);
  Categories.withId(this._id, this._name, this._date, [this._description]);

  int get id => _id;
  String get name => _name;
  String get description => _description;
  String get date => _date;

  set name(String newName){
    if(newName.length <= 30){
      this._name = newName;
    }
  }

  set description(String newDescription){
    this._description = newDescription;
  }

  set date(String newDate){
    this._date = newDate;
  }

  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();

    if(id != null){
      map['id'] = _id;
    }
    map['name'] = _name;
    map['description'] = _description;
    map['date'] = _date;

    return map;
  }

  Categories.fromMapObject(Map<String, dynamic>map){
    this._id = map['id'];
    this._name = map['name'];
    this._description = map['description'];
    this._date = map['date'];
  }
}

