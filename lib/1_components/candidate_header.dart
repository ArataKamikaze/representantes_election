import 'package:flutter/material.dart';

class CandidateHeader extends StatefulWidget {
   var name = "Nome não encontrado";
  var matricula = "Error";
  var sala = "Error";
  bool hasCheck = false;

  CandidateHeader({
    Key? key,
    this.matricula = "E01010",
    this.name = "Jeremy Elbertson",
    this.sala = "CC4MA",
    this.hasCheck = false,  
  }) : super(key: key);

  @override
  State<CandidateHeader> createState() => _CandidateHeaderState();
}

class _CandidateHeaderState extends State<CandidateHeader> {
  bool _check = false;

  @override
  Widget build(BuildContext context) {
    return Container(
          color: const Color(0xff135085),
          height: 75,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Nome",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                  Text(
                    widget.name,
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:  [
                  Text(
                    "Matrícula",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                  Text(
                    widget.matricula,
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:  [
                  Text(
                    "Sala",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                  Text(
                    widget.sala,
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ],
              ),
              widget.hasCheck?
              Checkbox(
                  value: true,
                  onChanged: null
                  ):Container(),
            ],
          ),
        );
  }
}