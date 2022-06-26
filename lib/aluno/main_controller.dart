import 'candidacy/candidacy_container.dart';
import 'package:flutter/material.dart';
import 'home/home_container.dart';
import 'profile/profile_container.dart';

class MainController {
  Map<String, Widget> containers = {
    "home": const HomeContainer(),
    "profile": const ProfileContainer(),
    "candidacy": CandidacyContainer(),
  };

  Widget setContainer(String key) {
    return containers[key]!;
  }
}
