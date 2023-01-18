class Session {
  int? idSession;
  DateTime? date;
  String? packageInfo;
  int? photosCount;
  int? idUser;

  Session({
    this.idSession,
    this.date,
    this.packageInfo,
    this.photosCount,
    this.idUser,
  });

  Session.fromJson(Map<String, dynamic> json) {
    idSession = json['id_session'];
    date = DateTime.parse(json['date']);
    packageInfo = json['package_info'];
    photosCount = json['photos_count'];
    idUser = json['id_user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_session'] = this.idSession as int;
    data['date'] = this.date.toString();
    data['package_info'] = this.packageInfo;
    data['photos_count'] = this.photosCount as int;
    data['id_user'] = this.idUser as int;
    return data;
  }
}
