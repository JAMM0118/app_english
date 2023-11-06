// To parse this JSON data, do
//
//     final standModel = standModelFromJson(jsonString);

import 'dart:convert';

StandModel standModelFromJson(String str) => StandModel.fromJson(json.decode(str));

String standModelToJson(StandModel data) => json.encode(data.toJson());

class StandModel {
    final String titulo;
    final String imageBackground;
    final String textoBody;

    StandModel({
        required this.titulo,
        required this.imageBackground,
        required this.textoBody,
    });

    factory StandModel.fromJson(Map<String, dynamic> json) => StandModel(
        titulo: json["titulo"],
        imageBackground: json["image-background"],
        textoBody: json["texto-body"],
    );

    Map<String, dynamic> toJson() => {
        "titulo": titulo,
        "image-background": imageBackground,
        "texto-body": textoBody,
    };
}
