import 'package:flutter/material.dart';

import '../export_features.dart';
class ImageDetails extends StatelessWidget {
  final ImageModel? imageModel;
  const ImageDetails({Key? key, this.imageModel,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Categories? categories ;
    if(imageModel!.categories!.isNotEmpty){
       categories = imageModel!.categories!.first;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Hero(
              tag: imageModel!.id.toString(),
              child: ReusableCachedNetworkImage(
                fit: BoxFit.fill,
                width: double.infinity,
                imageUrl: '${imageModel!.url}',
              ),
            ),
          ),
          const SizedBox(height: 50.0,),
          Row(
            children: [
               const Text('Category :',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),
              categories != null? Text(categories.name.toString()) : const Text('Null')
            ],
          ),
          const SizedBox(height: 10.0,),

          Row(
            children:  [
               const Text('ID :',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),
              categories != null? Text(categories.id.toString()) : const Text('Null')
            ],
          ),

        ],),
    );
  }
}
