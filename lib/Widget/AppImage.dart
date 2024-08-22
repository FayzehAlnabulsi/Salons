import 'package:flutter/material.dart';
import 'GeneralWidget.dart';

class AppImage extends StatelessWidget {
  final String image;
  final bool isNetworkImage;
  final double? height;
  final double? width;
  const AppImage(
      {super.key,
      required this.image,
      required this.isNetworkImage,
      this.height,
      this.width});

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      height: height,
      width: width,
      image: isNetworkImage == true
          ? NetworkImage(image)
          : AssetImage(image) as ImageProvider,
      placeholderFit: BoxFit.contain,
      placeholder: GeneralWidget.placeholderImage(),
      imageErrorBuilder: (context, error, stackTrace) =>
          GeneralWidget.imageError(),
      fit: BoxFit.contain,
    );
  }

}
