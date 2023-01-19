class Photo {
  int? idPhoto;
  String? url;
  int? idSession;

  Photo({this.idPhoto, this.url, this.idSession});

  Photo.fromJson(Map<String, dynamic> json) {
    idPhoto = json['id_photo'];
    url = json['url'];
    idSession = json['id_session'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_photo'] = this.idPhoto;
    data['url'] = this.url;
    data['id_session'] = this.idSession;
    return data;
  }
}
