import 'package:flutter/material.dart';
import 'package:flutter_learing_codepur/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      errorBuilder: (context, error, stackTrace) =>
          const Icon(Icons.broken_image),
    ).box.roundedLg.p8.color(MyTheme.creamColor).make().p16().w32(context);
  }
}
