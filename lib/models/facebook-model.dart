// {
// "name": "Open Graph Test User",
// "email": "open_jygexjs_user@tfbnw.net",
// "picture": {
// "data": {
// "height": 126,
// "url": "https://scontent.fuio21-1.fna.fbcdn.net/v/t1.30497-1/s200x200/8462.jpg",
// "width": 200
// }
// },
// "id": "136742241592917"
// }

class FacebookModel {
  final String? name;
  final String? email;
  final String? id;
  final FacebookPhotoModel facebookPhotoModel;

  FacebookModel(
      {this.name, this.email, this.id, required this.facebookPhotoModel});

  factory FacebookModel.fromJson(Map<String, dynamic> json) => FacebookModel(
        facebookPhotoModel: FacebookPhotoModel.fromJson(json['picture']['data']),
        name: json['name'],
        id: json['id'],
        email: json['email'],
      );
}
//because it's an object
class FacebookPhotoModel {
  final String? url;
  final int? height, width;

  FacebookPhotoModel({this.url, this.height, this.width});

  factory FacebookPhotoModel.fromJson(Map<String, dynamic> json) =>
      FacebookPhotoModel(
        url: json['url'],
        height: json['height'],
        width: json['width'],
      );
}
