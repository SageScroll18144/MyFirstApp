class Item {
  String title;
  bool done;

  Item({this.title, this.done});//construtor

  Item.fromJson(Map<String, dynamic> json){//função sem retorno
    title = json['title'];
    done = json['done'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['done'] = this.done;
    return data;
  }

}

//var item = new Item(title: "kjk", done: false);