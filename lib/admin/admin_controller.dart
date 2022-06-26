import 'package:flutter/material.dart';

import 'home/home_container.dart';
import 'profile/profile_container.dart';

class AdminController{

  Map<String,Widget> containers = {
    "home" :  HomeContainer(),
    "profile" : ProfileContainer(),
  };

  Widget setContainer(String key){
      return  containers[key]!;
  }
}