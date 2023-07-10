class SMModel {
  int idSm;
  String noSurat;
  DateTime tglNs;
  String noAsal;
  DateTime tglNoAsal;
  String pengirim;
  String penerima;
  String perihal;
  String tokenLampiran;
  int dibaca;
  int disposisi;
  int idUser;
  DateTime tglSm;

  SMModel({
    required this.idSm,
    required this.noSurat,
    required this.tglNs,
    required this.noAsal,
    required this.tglNoAsal,
    required this.pengirim,
    required this.penerima,
    required this.perihal,
    required this.tokenLampiran,
    required this.dibaca,
    required this.disposisi,
    required this.idUser,
    required this.tglSm,
  });

  factory SMModel.fromJson(Map<String, dynamic> json) {
    return SMModel(
      idSm: json['id_sm'],
      noSurat: json['no_surat'],
      tglNs: DateTime.parse(json['tgl_ns']),
      noAsal: json['no_asal'],
      tglNoAsal: DateTime.parse(json['tgl_no_asal']),
      pengirim: json['pengirim'],
      penerima: json['penerima'],
      perihal: json['perihal'],
      tokenLampiran: json['token_lampiran'],
      dibaca: json['dibaca'],
      disposisi: json['disposisi'],
      idUser: json['id_user'],
      tglSm: DateTime.parse(json['tgl_sm']),
    );
  }
}
