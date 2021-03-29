import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jc_app_news/src/models/CategoriaModel.dart';
import 'package:jc_app_news/src/models/NewsModel.dart';
import 'package:http/http.dart' as http;

final _urlNews = 'https://newsapi.org/v2';
final _apiKey = '9783a05966e34df0a985f5ac84b470a2';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];
  String _categoriaSeleccionada = 'business';
  bool _isLoading = true;

  List<Categoria> categorias = [
    Categoria(FontAwesomeIcons.building, 'business'),
    Categoria(FontAwesomeIcons.tv, 'entertainment'),
    Categoria(FontAwesomeIcons.addressCard, 'general'),
    Categoria(FontAwesomeIcons.headSideVirus, 'health'),
    Categoria(FontAwesomeIcons.vials, 'science'),
    Categoria(FontAwesomeIcons.volleyballBall, 'sports'),
    Categoria(FontAwesomeIcons.memory, 'technology'),
  ];

  Map<String, List<Article>> articulosPorCategoria = {};

  NewsService() {
    this.getTopHeadlines();
    categorias.forEach((element) {
      this.articulosPorCategoria[element.name] = [];
    });
    this.getArticulosxCategoria(this._categoriaSeleccionada);
  }

  get categoriaSeleccionada => this._categoriaSeleccionada;
  set categoriaSeleccionada(String valor) {
    this._categoriaSeleccionada = valor;
    this._isLoading = true;
    this.getArticulosxCategoria(valor);
    notifyListeners();
  }

  bool get isLoading => this._isLoading;

  List<Article> get getArticulosxCategoriaSeleccionada =>
      this.articulosPorCategoria[this.categoriaSeleccionada];

  getTopHeadlines() async {
    final url = '$_urlNews/top-headlines?apiKey=$_apiKey&country=us';
    final resp = await http.get(Uri.parse(url));
    final newsResponse = newsResponseFromJson(resp.body);

    this.headlines.addAll(newsResponse.articles);
    notifyListeners();
  }

  getArticulosxCategoria(String categoria) async {
    if (this.articulosPorCategoria[categoria].length > 0) {
      this._isLoading = false;
      notifyListeners();
      return this.articulosPorCategoria[categoria];
    }

    final url =
        '$_urlNews/top-headlines?apiKey=$_apiKey&country=us&category=$categoria';
    final resp = await http.get(Uri.parse(url));
    final newsResponse = newsResponseFromJson(resp.body);

    this.articulosPorCategoria[categoria].addAll(newsResponse.articles);
    this._isLoading = false;
    notifyListeners();
  }
}
