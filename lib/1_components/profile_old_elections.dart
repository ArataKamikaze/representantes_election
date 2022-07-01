
import 'package:flutter/material.dart';

class ProfileOldElections extends StatelessWidget {
  var ano = "";
  var matricula = "";
  var name = "";
  var semestre = "";
  var sala  = "";
  var image = "";
  
  ProfileOldElections({
    Key? key,
    required this.ano,
    required this.matricula,
    required this.name,
    required this.semestre,
    required this.sala,
    this.image = "https://cdn.discordapp.com/attachments/853795302388662302/992523892356829315/avatar-0484d1625a1c619bacf85f51f872f85b.jpg",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: 15, vertical: 5),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 2.0,
            color: Color(0xffededed),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        image),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                (name + " - "+ matricula)                
              )
            ],
          ),
          Text((ano + " - " + semestre + "º Semestre - " + sala)),
        ],
      ),
    );
  }
}
