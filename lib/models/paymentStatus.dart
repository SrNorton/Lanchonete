class PaymentStatus{
  int? id;
  DateTime? dateCreated;
  DateTime? dateApproved;
  String? status;

  PaymentStatus({
      this.id,
      this.dateCreated,
      this.dateApproved,
       this.status
  });

  PaymentStatus.fromJson(Map<String, dynamic> json){
    
      id = json['id'];
      dateCreated = DateTime.parse(json['date_created'] ?? "2019-07-10T14:47:58.000Z");
      dateApproved = DateTime.parse(json['date_approved'] ?? "2019-07-10T14:47:58.000Z");
      status = json['status']?.toString() ?? 'Status não informado';
  }

}