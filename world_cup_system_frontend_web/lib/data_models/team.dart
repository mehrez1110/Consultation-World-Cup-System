class Team {
  int id;
  String name;
  int winsCount;
  int drawsCount;
  int lossCount;
  int rating;

  Team({
    this.id = 0,
    this.name = '',
    this.winsCount = 0,
    this.drawsCount = 0,
    this.lossCount = 0,
    this.rating = 0,
  });

  static fromJson(jsonResponse) {
    return Team(
      id: jsonResponse['id'],
      name: jsonResponse['name'],
      winsCount: jsonResponse['winsCount'],
      drawsCount: jsonResponse['drawsCount'],
      lossCount: jsonResponse['lossCount'],
      rating: jsonResponse['rating'],
    );
  }

  // convert to json
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'winsCount': winsCount,
        'drawsCount': drawsCount,
        'lossCount': lossCount,
        'rating': rating,
      };
}
