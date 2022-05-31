import 'package:eleicao_representante/app/components/button.dart';
import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);
// Apenas componentes visuais
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 32,
        ),
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
          ],
        ),
        SizedBox(
          height: 35,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
              Container(
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Inicio",
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Candidatar-se",
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Perfil",
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              MainButton(
                onPressed: () {
                  Navigator.pop(context, '/AuthOrHomePage');
                },
                child: Text("Inicio"),
                isPrimary: false,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
