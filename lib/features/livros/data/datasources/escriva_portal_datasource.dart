import 'package:dio/dio.dart';
import 'package:escrivah/core/managers/dio_manager.dart';
import 'package:escrivah/core/service_locator.dart';
import 'package:escrivah/features/livros/domain/entities/livro.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart' as parser;

abstract interface class EscrivaPortalDataSource {
  Future<List<Livro>> carregarListaDeLivros();
}

final class EscrivaPortalDataSourceImpl implements EscrivaPortalDataSource {
  @override
  Future<List<Livro>> carregarListaDeLivros() async {
    final List<Livro> livros = <Livro>[];
    final Response<Object> response = await sl<DioManager>().get('');
    final String htmlString = response.data.toString();
    final Document document = parser.parse(htmlString);
    final Element? booksGridElement = document.querySelector('.books-grid');
    if (booksGridElement != null) {
      final List<Element> booksLinks = booksGridElement.querySelectorAll('> a');
      for (final Element bookLink in booksLinks) {
        final String titulo = bookLink.querySelector('.card-title')!.text.trim();
        final String descricao = bookLink.querySelector('.card-description')!.text.trim();
        livros.add(Livro(titulo: titulo, descricao: descricao));
      }
    }
    return livros;
  }
}
