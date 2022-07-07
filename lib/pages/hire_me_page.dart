import 'package:flutter/material.dart';

class HireMePage extends StatelessWidget {
  const HireMePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/foto-personal.png'),
            ),
            title: Text(
              'José Anibal Tejada Jiménez',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'jose.anibal0211@gmail.com',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10.0,),

          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Soy un desarrollador de aplicaciones móviles en Flutter. Cuento con 9 meses de experiencia en el campo laboral. Algunos de los proyectos en los que he trabajado son Efectivo (Aplicación de gestión empresarial) y Coopprospera (Aplicación de la cooperativa Coopprospera para visualizar el estado de tus cuentas, administrar beneficiarios y realizar transferencias).\n Estas aplicaciones puedes encontrarlas tanto en la App Store como en la Play Store.',
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
