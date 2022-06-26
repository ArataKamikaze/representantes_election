import 'package:flutter/material.dart';

class CandidateSumary extends StatefulWidget {
  const CandidateSumary({Key? key}) : super(key: key);

  @override
  State<CandidateSumary> createState() => _CandidateSumaryState();
}

class _CandidateSumaryState extends State<CandidateSumary> {
  bool _check = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
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
              children: const [
                Text("Nome"),
                Text("Jeremy Elbertson"),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Matrícula"),
                Text("E019548"),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Sala"),
                Text("CC4MA"),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
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
          color: const Color(0xffDDDFE0),
          height: 1,
          width: double.infinity,
        )
      ],
    );
  }
}