import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:earth_eye_web/utils/constants/enums.dart';
import 'package:earth_eye_web/utils/formatters/formatters.dart';


class UserModel {
  final String? id;
  String firstName;
  String lastName;
  String username;
  String email;
  String phoneNumber;
  String profilePicture;
  AppRole role;
  DateTime? createdAt;
  DateTime? updatedAt;

  UserModel({
    required this.email,
    this.id,
    this.firstName = "",
    this.lastName = "",
    this.username = "",
    this.phoneNumber = "",
    this.profilePicture = "",
    this.role = AppRole.user,
    this.createdAt,
    this.updatedAt,
  });

  String get fullName => "$firstName $lastName";

  String get formattedPhoneNo => Formatters.formatPhoneNumber(phoneNumber);

  String get formattedUpdatedAtDate => Formatters.formatDate(updatedAt);
  String get formattedDate => Formatters.formatDate(createdAt);

  static List<String> nameParts(String fullName) => fullName.split(" ");

  static String generateUsername(String fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername = firstName.substring(0, 3) + lastName.substring(0, 3);
    String userNameWithPrefix = "ert_$camelCaseUsername";
    return userNameWithPrefix;
  }

  // Generic method to update a field by name
  void setFieldValue(String fieldName, String newValue) {
    switch (fieldName) {
      case 'FirstName':
        firstName = newValue;
        break;
      case 'LastName':
        lastName = newValue;
        break;
      case 'Username':
        username = newValue;
        break;
      case 'Email':
        email = newValue;
        break;
      case 'PhoneNumber':
        phoneNumber = newValue;
        break;

      default:
        throw 'Invalid field name: $fieldName';
    }
  }

  static UserModel empty() => UserModel(email: "");

  Map<String, dynamic> toJson() {
    return {
      "FirstName": firstName,
      "LastName": lastName,
      "Username": username,
      "Email": email,
      "PhoneNumber": phoneNumber,
      "ProfilePicture": profilePicture,
      "Role": role.name.toString(),
      "CreatedAt": createdAt,
      "UpdatedAt": updatedAt = DateTime.now(),
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    if (data != null) {
      return UserModel(
        id: document.id,
        firstName: data.containsKey("FirstName") ? data["FirstName"] ?? "" : "",
        lastName: data.containsKey("LastName") ? data["LastName"] ?? "" : "",
        username: data.containsKey("Username") ? data["Username"] ?? "" : "",
        email: data.containsKey("Email") ? data["Email"] ?? "" : "",
        phoneNumber:
            data.containsKey("PhoneNumber") ? data["PhoneNumber"] ?? "" : "",
        profilePicture: data.containsKey("ProfilePicture")
            ? data["ProfilePicture"] ?? ""
            : "",
        role: data.containsKey("Role")
            ? (data["Role"] ?? AppRole.user) == AppRole.admin.name.toString()
                ? AppRole.admin
                : AppRole.user
            : AppRole.user,
        createdAt: data.containsKey("CreatedAt")
            ? data["CreatedAt"]?.toDate() ?? DateTime.now()
            : DateTime.now(),
        updatedAt: data.containsKey("UpdatedAt")
            ? data["UpdatedAt"]?.toDate() ?? DateTime.now()
            : DateTime.now(),
      );
    }
    return UserModel.empty();
  }
}
