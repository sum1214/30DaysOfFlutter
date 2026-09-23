import 'package:flutter/material.dart';
import 'package:flutter_learing_codepur/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        'Catalog App'.text.bold.color(MyTheme.darkBluishColor).xl4.make(),
        'Trending products'.text.xl2.make(),
      ],
    );
  }
}
