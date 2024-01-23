// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ContactUs {
  final String name;
  final String email;
  final String phone;
  final String message;
  final DateTime date;
  final String type;
  const ContactUs({
    required this.name,
    required this.email,
    required this.phone,
    required this.message,
    required this.date,
    required this.type,
  });

  ContactUs copyWith({
    String? name,
    String? email,
    String? phone,
    String? message,
    DateTime? date,
    String? type,
  }) {
    return ContactUs(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      message: message ?? this.message,
      date: date ?? this.date,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'phone': phone,
      'message': message,
      'date': date.millisecondsSinceEpoch,
      'type': type,
    };
  }

  factory ContactUs.fromMap(Map<String, dynamic> map) {
    return ContactUs(
      name: map['name'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      message: map['message'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      type: map['type'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ContactUs.fromJson(String source) =>
      ContactUs.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ContactUs(name: $name, email: $email, phone: $phone, message: $message, date: $date, type: $type)';
  }

  @override
  bool operator ==(covariant ContactUs other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.email == email &&
        other.phone == phone &&
        other.message == message &&
        other.date == date &&
        other.type == type;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        phone.hashCode ^
        message.hashCode ^
        date.hashCode ^
        type.hashCode;
  }
}
