import 'package:flutter/material.dart';

import 'candidate_header.dart';

class CandidateInfo extends StatefulWidget {
  var name = "Nome não encontrado";
  var matricula = "Error";
  var sala = "Error";
  var bio = "Error";
  Function()? onTap = () {};
  var image = "https://cdn.discordapp.com/attachments/684958105024331816/971485364218900551/Screenshot_19_6.png";

  CandidateInfo({
    Key? key,
    this.matricula = "E01010",
    this.name = "Jeremy Elbertson",
    this.sala = "CC4MA",
    this.bio = "Error",
    this.onTap,
    this.image = "https://cdn.discordapp.com/attachments/684958105024331816/971485364218900551/Screenshot_19_6.png",
    }) : super(key: key);

  @override
  State<CandidateInfo> createState() => _CandidateInfoState();
}

class _CandidateInfoState extends State<CandidateInfo> {
  bool _check = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Column(
        children: [
          CandidateHeader(name: widget.name,matricula: widget.matricula, sala: widget.sala,hasCheck: true,),
          Container(
            color: Colors.white,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: 200,
                    height: 300,
                    decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                widget.image),
                          ),
                        ),
                  ),
                ),
                
                  SizedBox(
                  height: 300,
                  width: 700,
                  child: Column(
                      children: [
                        const Text("Descrição"),
                        Expanded(child: Text(widget.bio)),
                      ],
                    ),
                ),
              ],
            ),
          ),
          Container(
              color: const Color(0xffDDDFE0),
              height: 1,
              width: double.infinity,
            )
        ],
      
      ),
    );
  }
}
