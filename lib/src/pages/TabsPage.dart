import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => new _NavegacionModel(),
        child: Scaffold(bottomNavigationBar: _Navegacion(), body: _Paginas()));
  }
}

class _Navegacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final navegacionModel = Provider.of<_NavegacionModel>(context);
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: navegacionModel.paginaActual,
            onTap: (i) => navegacionModel.paginaActual = i ,
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
    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return PageView(
      controller: navegacionModel.pageController,
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

class _NavegacionModel with ChangeNotifier {

  int _paginaActual = 0;

  PageController _pageController = new PageController();

  int get paginaActual => this._paginaActual;
  set paginaActual(int valor) {
    this._paginaActual = valor;
    _pageController.animateToPage(valor, duration: Duration(milliseconds: 250) , curve: Curves.easeOut);
    notifyListeners();
  }

  PageController get pageController => this._pageController;
}
