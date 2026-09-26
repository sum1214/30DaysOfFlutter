import 'package:flutter/material.dart';
import 'package:flutter_learing_codepur/models/catalog.dart';
import 'package:flutter_learing_codepur/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailsPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailsPage({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: MyTheme.creamColor),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: OverflowBar(
        alignment: .spaceBetween,
        children: [
          '\$${catalog.price}'.text.bold.xl.red500.make(),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(MyTheme.darkBluishColor),
              shape: WidgetStatePropertyAll(StadiumBorder()),
            ),
            child: 'Buy'.text.make(),
          ),
        ],
      ).pSymmetric(h: 32,v: 48),
      body: SafeArea(
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image.toString()),
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 10.0,
                arcType: .convey,
                edge: .top,
                child: Container(
                  width: context.screenWidth,
                  color: Colors.white,
                  child: Column(
                    children: [
                      catalog.name
                          .toString()
                          .text
                          .xl4
                          .color(MyTheme.darkBluishColor)
                          .bold
                          .make(),
                      catalog.desc
                          .toString()
                          .text
                          .xl
                          .textStyle(context.captionStyle)
                          .make(),
                      10.heightBox,
                    ],
                  ),
                ),
              ).py64(),
            ),
          ],
        ).p8(),
      ),
    );
  }
}
