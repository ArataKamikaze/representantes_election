import 'package:flutter/material.dart';

import 'candidate_header.dart';

class CandidateInfo extends StatefulWidget {
  var name = "Nome não encontrado";
  var matricula = "Error";
  var sala = "Error";
  var bio = "Error";
  Function()? onTap = () {};
  var image =
      "https://cdn.discordapp.com/attachments/853795302388662302/992523892356829315/avatar-0484d1625a1c619bacf85f51f872f85b.jpg";
      var motivacoes = "Error";

  CandidateInfo({
    Key? key,
    this.matricula = "E01010",
    this.name = "Jeremy Elbertson",
    this.sala = "CC4MA",
    this.bio = "Error",
    this.onTap,
    this.image =
        "https://cdn.discordapp.com/attachments/853795302388662302/992523892356829315/avatar-0484d1625a1c619bacf85f51f872f85b.jpg",
    this.motivacoes = "Erroaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaar",
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
      child: Container(
        child: Column(
          children: [
            CandidateHeader(
              name: widget.name,
              matricula: widget.matricula,
              sala: widget.sala,
              hasCheck: true,
            ),
            Row(
              children: [
                Container(
                  child: Image.network(widget.image),
                  height: 300,
                ),
                Expanded(
                  child: Container(
                    height: 300,
                    padding: EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Biografia",
                            style: TextStyle(fontSize: 20),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            width: double.infinity,
                            color: Colors.grey[200],
                            child: Text(
                              widget.bio,
                              maxLines: null,
                              style: TextStyle(fontSize: 15,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: .7,
                                  height: 1.5,
                                  decorationColor: Colors.grey[600],
                                  decorationStyle: TextDecorationStyle.wavy,
                                  decorationThickness: 1,
                                  ),
                            ),
                          ),
                          Text(
                            "Motivações",
                            style: TextStyle(fontSize: 20),
                          ),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(10),
                            color: Colors.grey[200],
                            child: Text(
                              widget.motivacoes,
                              maxLines: null,
                              style: TextStyle(fontSize: 15,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: .7,
                                  height: 1.5,
                                  decorationColor: Colors.grey[600],
                                  decorationStyle: TextDecorationStyle.wavy,
                                  decorationThickness: 1,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
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
