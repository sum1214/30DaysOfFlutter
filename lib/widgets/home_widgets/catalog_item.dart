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
                    .textStyle(context.captionStyle)
                    .make(),
                10.heightBox,
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 8, bottom: 8),
                    child: OverflowBar(
                      alignment: .spaceBetween,
                      children: [
                        '\$${catalog.price}'.text.bold.xl.make(),
                        ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                              MyTheme.darkBluishColor,
                            ),
                            shape: WidgetStatePropertyAll(StadiumBorder()),
                          ),
                          child: 'Buy'.text.make(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ).white.roundedLg.square(100).make().py16();
  }
}
