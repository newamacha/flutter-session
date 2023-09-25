import 'package:flutter/material.dart';
import 'package:notesapp/components/ui/PersonListItem.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              PersonListItem()
            ],
          ),
        ),
      ),
    );
  }
}
