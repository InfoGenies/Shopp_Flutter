class CurrentAdress {
  final String street;

  final String city;

  final String state;

  final String country;

  final int phone;

  CurrentAdress(
      {required this.street,
      required this.city,
      required this.state,
      required this.country,
      required this.phone});

  factory CurrentAdress.fromMap(Map<dynamic, dynamic> map) {
    return CurrentAdress(
        street: map['street'],
        city: map['city'],
        state: map['state'],
        country: map['country'],
        phone: map['phone']);
  }

  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'city': city,
      'state': state,
      'country': country,
      'phone': phone,
    };
  }
}
