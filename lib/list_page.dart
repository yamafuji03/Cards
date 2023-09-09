// packages
import 'package:flutter/material.dart';

// dart files
import 'business.dart';
import 'private.dart';

class list_page extends StatefulWidget {
  const list_page({super.key});

  @override
  State<list_page> createState() => _mainpageState();
}

class _mainpageState extends State<list_page> {
  String business_list = "ビジネス用";
  String private_list = "プライベート用";

  List<String> list = ["ビジネス", "プライベート"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("どっちの自己紹介を使う？")),
        body: ListView(
          children: [
            // for work
            ListTile(
              leading: Icon(Icons.work),
              title: Text(business_list),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => business()),
                );
              },
            ),
            // for private
            ListTile(
              leading: Icon(Icons.directions_walk),
              title: Text(private_list),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => private()),
                );
              },
            ),
          ],
        ));
  }
}
