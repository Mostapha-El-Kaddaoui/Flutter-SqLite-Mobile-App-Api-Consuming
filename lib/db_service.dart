import 'dart:convert';
import 'package:http/http.dart' as http;
import './book.dart';
class ApiService {
  static const String _apiKey = 'Api_Key';
  static const _query = "Artificial Intelligence";
  static const String _endpoint = 'https://www.googleapis.com/books/v1/volumes?q=flutter';
  static Future<List<Book>> fetchBooks() async{
    final response = await http.get(Uri.parse(_endpoint));
    if(response.statusCode == 200){
      final data = json.decode(response.body);
      final List books = data['items'];
      return books.map((b)=>Book.fromJson(b)).toList();
    }else{
      throw Exception('Erreur lors du chargement des articles');
    }
  }
}