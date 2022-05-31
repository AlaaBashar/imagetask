class ImageModel {
  List<dynamic>? breeds;
  List<Categories>? categories;
  String? id;
  String? url;
  int? width;
  int? height;

  ImageModel(
      {this.breeds,
        this.categories,
        this.id,
        this.url,
        this.width,
        this.height});

  ImageModel.fromJson(Map<String, dynamic>? json) {
    if (json!['breeds'] != null) {
      breeds = json['breeds'];

    }
    categories = [];
    if (json['categories'] != null) {
      List list = json['categories'] ;
      categories = list.map((e) => Categories.fromJson(e)).toList();
    }
    id = json['id'];
    url = json['url'];
    width = json['width'];
    height = json['height'];
  }


}

class Categories {
  int? id;
  String? name;

  Categories({this.id, this.name});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }


}
