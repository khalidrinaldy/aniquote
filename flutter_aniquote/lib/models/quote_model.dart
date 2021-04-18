import 'dart:convert';

class Quote {
  final String anime, character, quote;
  Quote(this.anime, this.character, this.quote);
}

class QuoteModel {
  String anime, character, quote;
  QuoteModel({this.anime, this.character, this.quote});

  factory QuoteModel.fromJson(Map<String, dynamic> json) => QuoteModel(
    anime: json['anime'],
    character: json['character'],
    quote: json['quote']
  );

  Map<String, dynamic> toJson() => {
    'anime' : anime,
    'character' : character,
    'quote' : quote
  };
}

QuoteModel quoteModelFromJson(String str) => QuoteModel.fromJson(json.decode(str));
String quoteModelToJson(QuoteModel data) => json.encode(data.toJson());