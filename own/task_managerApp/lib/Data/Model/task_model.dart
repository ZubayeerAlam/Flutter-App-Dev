class taskModel {
  String? title;
  String? description;
  String? status;
  String? email;
  String? createdDate;
  String? sId;

  taskModel(
      {this.title,
        this.description,
        this.status,
        this.email,
        this.createdDate,
        this.sId});

  taskModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    status = json['status'];
    email = json['email'];
    createdDate = json['createdDate'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['status'] = this.status;
    data['email'] = this.email;
    data['createdDate'] = this.createdDate;
    data['_id'] = this.sId;
    return data;
  }
}
