import 'package:dio/dio.dart';
import 'package:escrivah/core/helpers/extensions/response_extensions.dart';
import 'package:escrivah/core/managers/dio_manager.dart';
import 'package:escrivah/core/service_locator.dart';
import 'package:escrivah/features/livros/domain/entities/livro.dart';
import 'package:html/dom.dart';

abstract interface class EscrivaPortalDataSource {
  Future<List<Livro>> carregarListaDeLivros();
  Future<Livro> carregarInformacoesDoLivro(Livro livro);
}

final class EscrivaPortalDataSourceImpl implements EscrivaPortalDataSource {
  @override
  Future<List<Livro>> carregarListaDeLivros() async {
    final List<Livro> livros = <Livro>[];
    final Response<Object> response = await sl<DioManager>().get('');
    final Document document = response.toDocument();
    final Element? booksGridElement = document.querySelector('.books-grid');
    if (booksGridElement != null) {
      final List<Element> booksLinks = booksGridElement.querySelectorAll('> a');
      for (final Element bookLink in booksLinks) {
        final String titulo = bookLink.querySelector('.card-title')!.text.trim();
        final String descricao = bookLink.querySelector('.card-description')!.text.trim();
        final String uri = bookLink.attributes['href']!.split('/').lastWhere((String part) => part.isNotEmpty);
        livros.add(Livro(titulo: titulo, descricao: descricao, uri: uri));
      }
    }
    return livros;
  }

  @override
  Future<Livro> carregarInformacoesDoLivro(Livro livro) async {
    final Response<Object> response = await sl<DioManager>().get('/${livro.uri}');
    final Document document = response.toDocument();

    livro.descricaoCompleta = document.querySelector('.book-description')?.text.trim();

    return livro;
  }
}
