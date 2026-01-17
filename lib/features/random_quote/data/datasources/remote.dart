import 'dart:convert';

import 'package:clean_app/core/api/api_endpoints.dart';
import 'package:clean_app/core/errors/exceptions.dart';
import 'package:clean_app/core/utils/strings.dart';
import 'package:clean_app/features/random_quote/data/models/quote_model.dart';
import 'package:http/http.dart' as http;

abstract class QuoteRemoteDatasource {
  Future<QuoteDataModel> getData();
}

class QuoteRomoteDatasourceImpl implements QuoteRemoteDatasource {
  http.Client client;
  QuoteRomoteDatasourceImpl({required this.client});

  @override
  Future<QuoteDataModel> getData() async {
    final uriParsing = Uri.parse(ApiEndpoints.randomQuote);
    final response = await client.get(
      uriParsing,
      headers: {AppStrings.contentType: AppStrings.appJson},
    );

    if (response.statusCode == 200) {
      return QuoteDataModel.fromJson(json.decode(response.body));
    } else {
      throw NetworkException();
    }
  }
}
