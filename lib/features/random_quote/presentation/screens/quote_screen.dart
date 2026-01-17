import 'package:clean_app/core/utils/colors.dart';
import 'package:clean_app/core/utils/strings.dart';
import 'package:clean_app/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:clean_app/features/random_quote/presentation/widgets/quote_content.dart';
import 'package:clean_app/features/random_quote/presentation/widgets/refresh_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_app/core/widgets/error_widget.dart' as error_widget;


class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {

  // ToDo : get data from api 
  getRandomQuoteFromAPI() =>
      BlocProvider.of<RandomQuoteCubit>(context).getRandomQuote();

  @override
  void initState() {
    getRandomQuoteFromAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => getRandomQuoteFromAPI(),
      child: Scaffold(
        appBar: AppBar(title: Text(AppStrings.appTitle)),
        body: BlocBuilder<RandomQuoteCubit, RandomQuoteState>(
          builder: (context, state) {
            if (state is RandomQuoteisLoading) {
              return Center(child: CircularProgressIndicator(
                color: AppColors.primary,
              ));
            } else if (state is RandomQuoteisError) {
              return error_widget.ErrorWidget();
            } else if (state is RandomQuoteisLoaded) {
              return Column(
                children: [
                  QuoteContent(quote: state.quote),
                  RefreshIcon(),
                ],
              );
            } else {
              return Center(child: CircularProgressIndicator(
                color: AppColors.red,
              ),);
            }
          },
        ),
      ),
    );
  }
}