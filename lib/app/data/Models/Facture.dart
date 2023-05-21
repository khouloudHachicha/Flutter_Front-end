import 'dart:convert';

List<Facture> factureFromJson(String str) => List<Facture>.from(json.decode(str).map((x) => Facture.fromJson(x)));

String factureToJson(List<Facture> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Facture {
  int num;
  DateTime date;
  String client;
  String vendeur;
  String montant;

  Facture({
    required this.num,
    required this.date,
    required this.client,
    required this.vendeur,
    required this.montant,
  });

  factory Facture.fromJson(Map<String, dynamic> json) => Facture(
    num: json["num"],
    date: DateTime.parse(json["date"]),
    client: json["client"],
    vendeur: json["vendeur"],
    montant: json["montant"],
  );

  Map<String, dynamic> toJson() => {
    "num": num,
    "date": date.toIso8601String(),
    "client": client,
    "vendeur": vendeur,
    "montant": montant,
  };
}
