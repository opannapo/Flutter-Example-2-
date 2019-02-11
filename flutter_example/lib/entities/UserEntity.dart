class UserEntity {
  String name;
  String bio;
  int followers;
  int following;
  String photo;
  Address address;

  UserEntity(
      {this.name,
      this.bio,
      this.followers,
      this.following,
      this.photo,
      this.address});

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    print('JSONNNNNNN PARSING ${json}');
    Address address = Address.fromJson(json['address']);

    return new UserEntity(
        name: json['name'] as String,
        bio: json['bio'] as String,
        followers: json['followers'] as int,
        following: json['following'] as int,
        photo: json['photo'] as String,
        address: address);
  }
}

class Address {
  String address;
  String city;
  String region;
  String area;

  Address({this.address, this.city, this.region, this.area});

  factory Address.fromJson(Map<String, dynamic> json) {
    return new Address(
        address: json['address'] as String,
        city: json['city'] as String,
        region: json['region'] as String,
        area: json['area'] as String);
  }
}
