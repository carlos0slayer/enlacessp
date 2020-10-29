import 'package:enlacessp/pages/HomePageResources/animated_bootom_bar.dart';
import 'package:enlacessp/pages/indexPage.dart';
import 'package:enlacessp/pages/infraccionesPage.dart';
import 'package:enlacessp/pages/notificationPage.dart';
import 'package:enlacessp/pages/profilePage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  final List<BarItem> barItems = [
    BarItem(
      text: "Inicio",
      iconos: FontAwesomeIcons.home,
      color: Color.fromRGBO(30, 42, 82, 3),
    ),
    BarItem(
        text: "Notificaciones",
        iconos: FontAwesomeIcons.bell,
        color: Color.fromRGBO(16, 127, 209, 3)),
    BarItem(
        text: "Mi Perfil",
        iconos: FontAwesomeIcons.user,
        color: Color.fromRGBO(66, 126, 188, 3)),
  ];

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedBarIndex = 0;

  //Paginas
  final IndexPage _paginaHome = IndexPage();
  final InfraccionesPage _infraccionPage = InfraccionesPage();
  final NotificacionesPage _paginaNotificaciones = NotificacionesPage();
  final PerfilPage _paginaPerfil = PerfilPage();

  Widget _showPage = new IndexPage();

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _paginaHome;
        break;
      case 1:
        return _paginaNotificaciones;
        break;
      case 2:
        return _paginaPerfil;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        child: _showPage,
        duration: const Duration(milliseconds: 700),
      ),
      bottomNavigationBar: AnimatedBottomBar(
        barItems: widget.barItems,
        animationDuration: const Duration(milliseconds: 550),
        onBarTap: (index) {
          setState(() {
            _showPage = _pageChooser(index);
          });
        },
      ),
    );
  }
}
