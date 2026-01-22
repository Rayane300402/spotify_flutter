String formatDuration(Duration duration) {
  final minutes = duration.inMinutes.remainder(60);
  final seconds = duration.inSeconds.remainder(60);
  return '${minutes.toString().padLeft(2,'0')}:${seconds.toString().padLeft(2,'0')}';
}

String formatSongLength(num length) {
  final format = length.toString().replaceAll('.', ":");
  if(format.split('').length == 3){
    return '${format}0';
  } else {
    return format;
  }
}