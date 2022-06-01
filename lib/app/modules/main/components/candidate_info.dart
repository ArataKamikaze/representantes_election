import 'package:flutter/material.dart';

class CandidateInfo extends StatefulWidget {
  const CandidateInfo({Key? key}) : super(key: key);

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
        Container(
          color: const Color(0xff135085),
          height: 75,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text(
                    "Nome",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                  Text(
                    "Jeremy Elbertson",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text(
                    "Matrícula",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                  Text(
                    "E019548",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text(
                    "Sala",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                  Text(
                    "CC4MA",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ],
              ),
              Checkbox(
                  value: _check,
                  onChanged: (a) {
                    setState(() {
                      _check = !_check;
                    });
                  })
            ],
          ),
        ),
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
