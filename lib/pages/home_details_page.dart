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
      appBar: AppBar(backgroundColor: Colors.white),
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        child: OverflowBar(
          alignment: .spaceBetween,
          children: [
            '\$${catalog.price}'.text.bold.xl.red500.make(),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                  MyTheme.darkBluishColor,
                ),
                shape: WidgetStatePropertyAll(StadiumBorder()),
              ),
              child: 'Add to cart'.text.make(),
            ),
          ],
        ),
      ).pOnly(bottom: 48, left: 16, right: 16),
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
                  padding: EdgeInsets.only(top: 16),
                  width: context.screenWidth,
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
                          .black
                          .xl
                          .textStyle(context.bodySmall)
                          .make(),
                      10.heightBox,
                      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus.'
                          .text
                          .black
                          .textStyle(context.captionStyle)
                          .make()
                          .p16()
                          .expand(),
                    ],
                  ).expand(),
                ),
              ).p8(),
            ),
          ],
        ).p8(),
      ),
    );
  }
}
