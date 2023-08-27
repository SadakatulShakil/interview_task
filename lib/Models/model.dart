class UserData {
  final int? id; // Add an ID field
  final String username;
  final String name;
  final String phone;
  final String email;
  final bool isSynced;

  UserData({
    required this.id,
    required this.username,
    required this.name,
    required this.phone,
    required this.email,
    required this.isSynced,

  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'name': name,
      'phone': phone,
      'email': email,
    };
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'name': name,
      'phone': phone,
      'email': email,
      'is_synced': isSynced ? 1 : 0, // Convert bool to int for SQLite
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      id: map['id'],
      username: map['username'],
      name: map['name'],
      phone: map['phone'],
      email: map['email'],
      isSynced: map['is_synced'] == 1, // Convert int to bool for Dart
    );
  }

}
