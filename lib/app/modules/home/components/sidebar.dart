import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);
// Apenas componentes visuais
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      "https://cdn.discordapp.com/attachments/684958105024331816/971485364218900551/Screenshot_19_6.png"),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "e01066@academico.emge.edu.br",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: "Jost",
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 1,
              width: 150,
              color: Colors.white,
            )
          ],
        ),
        Column(
          children: [
            TextButton(onPressed: () {}, child: Text("Inicio")),
            SizedBox(
              height: 25,
            ),
            TextButton(onPressed: () {}, child: Text("Candidatar-se")),
            SizedBox(
              height: 25,
            ),
            TextButton(onPressed: () {}, child: Text("Perfil"))
          ],
        ),
        SizedBox(
          height: 250,
        ),
        Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, '/AuthOrHomePage');
                },
                child: Text("Inicio")),
          ],
        )
      ],
    );
  }
}
