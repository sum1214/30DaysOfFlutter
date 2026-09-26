import 'package:flutter/material.dart';
import 'package:flutter_learing_codepur/models/catalog.dart';
import 'package:flutter_learing_codepur/widgets/home_widgets/catalog_image.dart';
import 'package:flutter_learing_codepur/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(image: catalog.image.toString()),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              mainAxisAlignment: .center,
              children: [
                4.heightBox,
                catalog.name
                    .toString()
                    .text
                    .lg
                    .color(MyTheme.darkBluishColor)
                    .bold
                    .make(),
                catalog.desc
                    .toString()
                    .text
                    .color(Colors.black)
                    .textStyle(context.captionStyle)
                    .make(),
                10.heightBox,
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    '\$${catalog.price}'.text.bold.black.make(),
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        'assets/images/add_to_cart.png',
                        height: 24,
                        width: 24,
                        fit: BoxFit.contain,
                        color: Colors.green,
                      ),
                    ).p16(),
                  ],
                ).pOnly(right: 8),
              ],
            ),
          ),
        ],
      ),
    ).white.roundedLg.height(150).make().py16();
  }
}
