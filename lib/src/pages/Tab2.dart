import 'package:flutter/material.dart';
import 'package:jc_app_news/src/models/CategoriaModel.dart';
import 'package:jc_app_news/src/services/NewsServices.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              Expanded(child: _ListaCategorias()),
            ],
          ),
        ),
      ),
    );
  }
}

class _ListaCategorias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categorias = Provider.of<NewsService>(context).categorias;

    return ListView.builder(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: categorias.length,
      itemBuilder: (BuildContext context, int index) {
        final nombreCategoria =
            '${categorias[index].name[0].toUpperCase()}${categorias[index].name.substring(1)}';
        return Padding(
            padding: EdgeInsets.all(8),
            child: Column(children: <Widget>[
              _CategoriaButton(categorias[index]),
              SizedBox(
                height: 5,
              ),
              Text(nombreCategoria)
            ]));
      },
    );
  }
}

class _CategoriaButton extends StatelessWidget {
  final Categoria categoria;
  const _CategoriaButton(this.categoria);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final newService = Provider.of<NewsService>(context, listen: false);

        newService.categoriaSeleccionada = categoria.name;
      },
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
        width: 40,
        height: 40,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Icon(
          categoria.icon,
          color: Colors.black54,
        ),
      ),
    );
  }
}
