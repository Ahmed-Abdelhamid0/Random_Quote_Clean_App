import 'package:clean_app/features/random_quote/domain/entities/quote.dart';
import 'package:flutter/material.dart';

class QuoteContent extends StatelessWidget {
  final Quote quote;
  const QuoteContent({super.key, required this.quote});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.black,
      ),
      child: Column(
        children: [
          Text(quote.quoteText,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white,height: 2,fontSize: 15)),
       Container(
        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: Text(quote.author,style: TextStyle(color: Colors.white,fontSize: 20),),
      )
        ],
      ),
    );
  }
}