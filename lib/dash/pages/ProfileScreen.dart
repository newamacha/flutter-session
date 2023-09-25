import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //todo #1 use safe area
      //todo #2 use padding horizontal = 10 around safe area
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(children: [
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Profile",
                    style: TextStyle(fontSize: 19),
                  ),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.logout)),
                ],
              ),
              const Gap(10),
              //todo #4 use card object here
              const ProfileCard(name: "Kushagra", cardColor: Colors.blue, dob: "12/12/1996"),
              const ProfileCard(name: "Saurav", cardColor: Colors.red, dob: "21/11/1995"),
            ]),
          ),
        ),
      ),
    );
  }
}

//todo #3 Make a ProfileCard stateless class
class ProfileCard extends StatelessWidget {
  final String name;
  final String dob;
  final Color cardColor;
  const ProfileCard(
      {Key? key,
        required this.name,
        required this.cardColor,
        required this.dob}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      child: Container(
        height: 150,

        width: double.infinity,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(name, style: TextStyle(),),
              Text(dob, style: TextStyle(),),
            ],
          ),
        ),
      ),
    );
  }
}