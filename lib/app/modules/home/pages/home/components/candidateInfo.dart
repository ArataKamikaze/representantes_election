import 'package:flutter/material.dart';

class CandidateInfo extends StatefulWidget {
  const CandidateInfo({Key? key}) : super(key: key);

  @override
  State<CandidateInfo> createState() => _CandidateInfoState();
}

class _CandidateInfoState extends State<CandidateInfo> {
  bool _check = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Container(
                width: 55,
                height: 55,
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        "https://cdn.discordapp.com/attachments/684958105024331816/971485364218900551/Screenshot_19_6.png"),
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Nome"),
                Text("Jeremy Elbertson"),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Matrícula"),
                Text("E019548"),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Sala"),
                Text("CC4MA"),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Bio"),
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit ..."),
              ],
            ),
            Checkbox(value: _check, onChanged: (a){
              setState(() {
                _check = !_check;
              });
            })
          ],
        ),
        Container(
          color: Color(0xffDDDFE0),
          height: 1,
          width: double.infinity,
        )
      ],
    );
  }
}