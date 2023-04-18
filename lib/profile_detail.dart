import 'package:first_flutter_app/model/profile.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProfileDetail extends StatelessWidget {
  Profile profile;
  ProfileDetail({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chi tiết ${profile.name}"),
        centerTitle: true,
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(
          width: 300,
          height: 300,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            color: Colors.pink,
            child: Column(children: [
              Text(
                profile.name,
                style: const TextStyle(color: Colors.white),
              ),
              Text(
                profile.age.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            ]),
          ),
        )
      ]),
    );
  }
}
