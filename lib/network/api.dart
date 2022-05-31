import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../export_features.dart';

class ImageData {
  static const String _baseUrl = 'https://api.thecatapi.com/v1/images/search?limit=80&mime_types=&order=Random&size=small&page=3&sub_id=demo-ce06ee';

  static Future<List<ImageModel>?> fetchImageData() async {

    http.Response response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      List listImages =jsonDecode(response.body);
      List<ImageModel>? listImage =[];
      listImage = listImages.map((e) => ImageModel.fromJson(e)).toList();

    return listImage;
    }


    return [];
  }
}