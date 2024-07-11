class MainModel {
  String? createdAt;
  String? iconUrl;
  String? id;
  String? updatedAt;
  String? url;
  String? value;

  MainModel(
      {this.createdAt,
      this.iconUrl,
      this.id,
      this.updatedAt,
      this.url,
      this.value});

  MainModel.fromJson(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    iconUrl = json['icon_url'];
    id = json['id'];
    updatedAt = json['updated_at'];
    url = json['url'];
    value = json['value'];
  }
}
