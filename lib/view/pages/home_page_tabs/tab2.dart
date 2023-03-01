
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Tab2 extends StatelessWidget {

  final String? pictureId;

  const Tab2({super.key, this.pictureId});

  @override
  Widget build(BuildContext context) {
    return  CachedNetworkImage(imageUrl: "https://picsum.photos/id/$pictureId/367/267");
  }
}
