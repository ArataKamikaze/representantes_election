import 'package:flutter/material.dart';

class CandidateSumary extends StatefulWidget {

  var name = "Nome não encontrado";
  var matricula = "Error";
  var sala = "Error";
  bool hasCheck = false;
  var bio = "Error";
  var image = "https://cdn.discordapp.com/attachments/684958105024331816/971485364218900551/Screenshot_19_6.png";
  Function()? onTap = () {};

  CandidateSumary({
    Key? key,
    this.matricula = "E01010",
    this.name = "Jeremy Elbertson",
    this.sala = "CC4MA",
    this.hasCheck = false, 
    this.bio = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    this.image = "https://cdn.discordapp.com/attachments/684958105024331816/971485364218900551/Screenshot_19_6.png",
    this.onTap,
    }) : super(key: key);

  @override
  State<CandidateSumary> createState() => _CandidateSumaryState();
}

class _CandidateSumaryState extends State<CandidateSumary> {
  bool _check = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            widget.image),
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Nome"),
                    Text(widget.name),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Text("Matrícula"),
                    Text(widget.matricula),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Text("Sala"),
                    Text(widget.sala),
                  ],
                ),
                SizedBox(
                  width: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Text("Bio"),
                      Text(
                        widget.bio,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        ),
                    ],
                  ),
                ),
                Checkbox(value: _check, onChanged: null
                )
              ],
            ),
            Container(
              color: const Color(0xffDDDFE0),
              height: 1,
              width: double.infinity,
            )
          ],
        ),
      ),
    );
  }
}