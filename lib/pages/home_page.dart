import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_learing_codepur/models/catalog.dart';
import 'package:flutter_learing_codepur/widgets/catalog_header.dart';
import 'package:flutter_learing_codepur/widgets/catalog_list.dart';
import 'package:flutter_learing_codepur/widgets/drawer.dart';
import 'package:flutter_learing_codepur/widgets/item_widget.dart';
import 'package:flutter_learing_codepur/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    final catalogJson = await rootBundle.loadString(
      'assets/files/catalog.json',
    );
    final decodedData = jsonDecode(catalogJson);
    final productsData = decodedData['products'];
    CatalogModel.items = List.from(productsData).map<Item>((item)=>Item.fromMap(item)).toList();
    print(productsData);
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: Vx.m16,
          child: Column(
            crossAxisAlignment: .start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items.isNotEmpty) 
              CatalogList().expand()
              else 
              Center(child: CircularProgressIndicator())

            ],
          ),
        ),
      )
    );
  }
}
