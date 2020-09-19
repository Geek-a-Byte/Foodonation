class User {
  String name, nid, phone;

  User(this.name, this.nid, this.phone);
  Map<String, dynamic> toJson() => {
        'Name': name,
        'NID': nid,
        'phone-no': phone,
      };
}
