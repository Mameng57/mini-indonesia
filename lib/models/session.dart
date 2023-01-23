class Session {
  int? idSession;
  DateTime? dateTaken;
  DateTime? dateDue;
  String? namePackage;
  int? downloadCount;
  int? printCount;
  String? name;

  Session({
    this.idSession,
    this.dateTaken,
    this.dateDue,
    this.namePackage,
    this.downloadCount,
    this.printCount,
    this.name,
  });

  Session.fromJson(Map<String, dynamic> json) {
    idSession = json['id_session'];
    dateTaken = DateTime.parse(json['date_taken']);
    dateDue = DateTime.parse(json['date_due']);
    namePackage = json['name_package'];
    downloadCount = json['download_count'];
    printCount = json['print_count'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_session'] = this.idSession;
    data['date_taken'] = this.dateTaken.toString();
    data['date_due'] = this.dateDue.toString();
    data['name_package'] = this.namePackage;
    data['download_count'] = this.downloadCount;
    data['print_count'] = this.printCount;
    data['name'] = this.name;
    return data;
  }
}
