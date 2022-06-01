import 'package:flutter/material.dart';
import 'package:imagetask/export_features.dart';
import 'package:cached_network_image/cached_network_image.dart';
class HomePage extends StatefulWidget {
   const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ImageModel>? imageList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Image Task'),
      ),
      body: imageList != null
          ? GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 3.0,
          mainAxisSpacing: 2.0,
        ),
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemCount: imageList!.length,
              itemBuilder: (context, index) {
                ImageModel? imageModel = imageList![index];
;                return InkWell(
                  onTap: ()=> onTap(imageModel),
                    child: Hero(
                      tag: imageModel.id.toString(),
                      child: ReusableCachedNetworkImage(
                  imageUrl: '${imageModel.url}',
                ),
                    ));
              },
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }

  Future<void> loadData() async{
    imageList = await ImageData.fetchImageData();
    setState(() {});

  }

  void onTap(ImageModel? imageModel,) async{
   openNewPage(context, ImageDetails(imageModel: imageModel,));
    setState(() {});
  }




}

