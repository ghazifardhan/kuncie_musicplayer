class MusicPlayerModel {
  int? duration;
  bool? isPlaying;
  int? currentPosition;
  bool? isLooping;

  MusicPlayerModel({
    this.duration, 
    this.isPlaying, 
    this.currentPosition, 
    this.isLooping
  });

  MusicPlayerModel copyWith({
    int? duration,
    bool? isPlaying,
    int? currentPosition,
    bool? isLooping,
  }) => MusicPlayerModel(
    duration: duration ?? this.duration, 
    isPlaying: isPlaying ?? this.isPlaying,
    currentPosition: currentPosition ?? this.currentPosition, 
    isLooping: isLooping ?? this.isLooping
  );
}