import 'package:flutter/material.dart';

import 'candidate_header.dart';

class CandidateInfo extends StatefulWidget {
  var name = "Nome não encontrado";
  var matricula = "Error";
  var sala = "Error";

  CandidateInfo({
    Key? key,
    this.matricula = "E01010",
    this.name = "Jeremy Elbertson",
    this.sala = "CC4MA",
  
  }) : super(key: key);

  @override
  State<CandidateInfo> createState() => _CandidateInfoState();
}

class _CandidateInfoState extends State<CandidateInfo> {
  String lorem = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis. Ut commodo efficitur neque. Ut diam quam, semper iaculis condimentum ac, vestibulum eu nisl.";
  bool _check = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CandidateHeader(name: widget.name,matricula: widget.matricula, sala: widget.sala,hasCheck: true,),
        Container(
          color: Colors.red,
          child: Row(
            children: [
              Container(
                width: 200,
                color: Colors.green,
              ),
              
              SizedBox(
                height: 300,
                width: 700,
                child: Column(
                    children: [
                      const Text("Descrição"),
                      Expanded(child: Text(lorem))
                    ],
                  ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
