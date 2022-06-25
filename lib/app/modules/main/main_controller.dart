import 'package:eleicao_representante/app/modules/main/containers/candidacy/candidacy_container.dart';

import 'containers/profile/profile_container.dart';
import 'package:flutter/material.dart';

import 'containers/home/home_container.dart';

class MainController{
  Map<String,Widget> containers = {
    "home" : const HomeContainer(),
    "profile" : const ProfileContainer(),
    "candidacy": CandidacyContainer(),
  };

  Widget setContainer(String key){
      return  containers[key]!;
  }

}