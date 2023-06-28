class ConsumerModel {
  String? id;
  String? address;
  String? consumerNumber;
  String? email;
  String? name;
  String? phoneNumber;
  String? password;
  String? poleNumber;

  ConsumerModel({this.id, this.email, this.password});
  ConsumerModel.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    address = data['address'];
    consumerNumber = data['consumerNumber'];
    email = data['email'];
    name = data['name'];
    phoneNumber = data['phoneNumber'];
    password = data['password'];
    poleNumber = data['poleNumber'];
  }
  // to-json
  Map<String, dynamic> toJson() => {
        'id': id,
        'comments': address,
        'complaintType': consumerNumber,
        'consumerNumber': email,
        'complaintDesc': name,
        'dateTime': phoneNumber,
        'ipoleNumberd': password,
        'status': poleNumber,
      };
  // copy
  factory ConsumerModel.copy(ConsumerModel r) {
    return ConsumerModel.fromJson(r.toJson());
  }
}
