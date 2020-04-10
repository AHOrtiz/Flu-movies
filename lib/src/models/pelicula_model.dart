// To parse this JSON data, do
//
//     final peliculasModel = peliculasModelFromJson(jsonString);

import 'dart:convert';

PeliculasModel peliculasModelFromJson(String str) => PeliculasModel.fromJson(json.decode(str));

String peliculasModelToJson(PeliculasModel data) => json.encode(data.toJson());

class PeliculasModel {
    String id;
    String titulo;
    int year;
    String actor;
    String fotoUrl;
    bool disponible;

    PeliculasModel({
        this.id,
        this.titulo='',
        this.year= 000,
        this.actor='',
        this.fotoUrl,
        this.disponible=true
    });

    factory PeliculasModel.fromJson(Map<String, dynamic> json) => PeliculasModel(
        id          : json["id"],
        titulo      : json["titulo"],
        year        : json["year"],
        actor       : json["actor"],
        fotoUrl     : json["fotoUrl"],
        disponible  : json["disponible"]
    );

    Map<String, dynamic> toJson() => {
        "id"      : id,
        "titulo"  : titulo,
        "year"    : year,
        "actor"   : actor,
        "fotoUrl" : fotoUrl,
        "disponible":disponible
    };
}
