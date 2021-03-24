import 'package:flutter/material.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _Navegacion();
  }
}

class _Navegacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          onTap: (i) => print('$i'),
          items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline_outlined,
              ),
              label: 'Para ti'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.public,
              ),
              label: 'Encabezados'),
        ]),
        body: _Paginas());
  }
}

class _Paginas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      // physics: BouncingScrollPhysics(),
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.green,
        )
      ],
    );
  }
}


class _NavegacionModel with ChangeNotifier{
  int _paginaActual =  0;
  int get paginaActual => this._paginaActual;
  set paginaActual(int valor){
    this._paginaActual = valor;
    notifyListeners();
  }
}
