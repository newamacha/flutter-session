import 'package:flutter/material.dart';

class PersonListItem extends StatelessWidget {
  const PersonListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 30,
              height: 30,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.deepOrangeAccent),
              child: Center(
                  child: Text(
                "MN",
                style: TextStyle(fontSize: 16),
              )),
            ),
            Text("My Name")
          ],
        ),
      ),
    );
  }
}
