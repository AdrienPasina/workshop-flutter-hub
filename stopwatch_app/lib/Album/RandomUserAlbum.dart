class RandomUserAlbum {
  final String email;

  RandomUserAlbum({this.email});

  /// Selectionné les data
  /// name
  /// surname
  /// pciture : medium
  /// gender
  /// email
  /// genere son adresse
  factory RandomUserAlbum.fromJson(Map<String, dynamic> json) {
    var data = json["results"][0];
    /// afficher les data vous permettra de mieux voir ou trouve les bons champs voir de les organiser
    return RandomUserAlbum(
        email: data["email"] as String,
    );
  }
}
