class Package {
  int? idPackage;
  String? namePackage;
  int? downloadCount;
  int? printCount;

  Package(
      {this.idPackage, this.namePackage, this.downloadCount, this.printCount});

  Package.fromJson(Map<String, dynamic> json) {
    idPackage = json['id_package'];
    namePackage = json['name_package'];
    downloadCount = json['download_count'];
    printCount = json['print_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_package'] = this.idPackage;
    data['name_package'] = this.namePackage;
    data['download_count'] = this.downloadCount;
    data['print_count'] = this.printCount;
    return data;
  }
}
