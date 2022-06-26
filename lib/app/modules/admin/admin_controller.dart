import 'package:flutter/material.dart';

import 'containers/home/home_container.dart';
import 'containers/profile/profile_container.dart';

class AdminController{

  Map<String,Widget> containers = {
    "home" : const HomeContainer(),
    "profile" : const ProfileContainer(),
  };

  Widget setContainer(String key){
      return  containers[key]!;
  }
}