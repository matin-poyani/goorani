class MusicTrack {
  final int musicId;
  final String title;
  final String onvanMusic;
  final String description;
  final String musicPoster;
  final int categoryId;
  final String timeErsal;
  final int bazdid;
  final List<DownloadMusic> downloadMusics;
// Added image property

  MusicTrack({
    required this.musicId,
    required this.title,
    required this.onvanMusic,
    required this.description,
    //TODO... change format image .with not suport flutter
    required this.musicPoster,
    required this.categoryId,
    required this.timeErsal,
    required this.bazdid,
    required this.downloadMusics,
  });

  factory MusicTrack.fromJson(Map<String, dynamic> json) {
    return MusicTrack(
      musicId: json['MusicId'] ??
          0, // Provide a default value (0 in this case) for non-nullable fields
      title: json['Title'] ?? '',
      onvanMusic: json['OnvanMusic'] ?? '',
      description: json['Description'] ?? '',
      categoryId: json['CategoryId'] ?? 0,
      timeErsal: json['TimeErsal'] ?? '',
      bazdid: json['Bazdid'] ?? 0,
      downloadMusics: (json['DownloadMusics'] as List<dynamic>?)
              ?.map((downloadJson) => DownloadMusic.fromJson(downloadJson))
              .toList() ??
          [],
      musicPoster: json['musicPoster'] ??
          '', // Provide a default value ('' in this case) for 'musicPoster'
    );
  }
}

class DownloadMusic {
  final int downloadId;
  final String musicUrlLink;
  final String onvanMusicDl;
  final int musicId;

  DownloadMusic({
    required this.downloadId,
    required this.musicUrlLink,
    required this.onvanMusicDl,
    required this.musicId,
  });

  factory DownloadMusic.fromJson(Map<String, dynamic> json) {
    return DownloadMusic(
      downloadId: json['DownloadId'],
      musicUrlLink: json['MusicUrlLink'],
      onvanMusicDl: json['OnvanMusicDl'],
      musicId: json['MusicId'],
    );
  }
}
