class ComplaintModel {
  String? id;
  String? comments;
  String? complaintType;
  String? consumerNumber;
  String? complaintDesc;
  DateTime? dateTime;
  String? imgUrl;
  String? poleNumber;
  String? status;

  ComplaintModel({this.id, this.consumerNumber});
  ComplaintModel.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    comments = data['comments'];
    complaintType = data['complaintType'];
    consumerNumber = data['consumerNumber'];
    complaintDesc = data['complaintDesc'];
    dateTime = data['dateTime'].toDate();
    poleNumber = data['poleNumber'];
    status = data['status'];
  }
  // to-json
  Map<String, dynamic> toJson() => {
        'id': id,
        'comments': comments,
        'complaintType': complaintType,
        'consumerNumber': consumerNumber,
        'complaintDesc': complaintDesc,
        'dateTime': dateTime,
        'ipoleNumberd': poleNumber,
        'status': status,
      };
  // copy
  factory ComplaintModel.copy(ComplaintModel r) {
    return ComplaintModel.fromJson(r.toJson());
  }
}
