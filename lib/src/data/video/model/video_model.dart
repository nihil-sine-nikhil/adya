class Video {
  final String choice;
  final String url;
  final String caption;
  const Video({
    required this.choice,
    required this.url,
    required this.caption,
  });
}

List<Video> getNextVideoList(String choice) {
  switch (choice) {
    case "Let's Rumble":
      return getStartedVideosSet;
    case "Pick Mr. Lorem":
      return pickedLoremVideosSet;
    case "Pick Miss Ipsum":
      return pickedIpsumVideosSet;
    case "Surprise me":
      return pickedSurpiseVideoList;
    case "Bet on Mr Lorem" ||
          "Stick with Mr Lorem" ||
          "Stick with Miss Ipsum" ||
          "Bet on Miss Ipsum":
      return playAgainVideoList;

    default:
      return getStartedVideosSet;
  }
}

const pickedSurpiseVideoList = [
  Video(
      choice: "Start Again",
      url:
          "https://drive.google.com/uc?export=download&id=1HjFJUu1dI13bJgPilsxSB8u4KdB7lV5w",
      caption: 'assets/captions/bowling_captions.vtt')
];
const playAgainVideoList = [
  Video(
      choice: "Play Again",
      url:
          "https://drive.google.com/uc?export=download&id=1HjFJUu1dI13bJgPilsxSB8u4KdB7lV5w",
      caption: 'assets/captions/bowling_captions.vtt')
];
const getStartedVideosSet = [
  Video(
      choice: "Pick Mr. Lorem",
      url:
          "https://drive.google.com/uc?export=download&id=1wQ2fWso7n-pc8SRbEebyKxeTXi0MIgrQ",
      caption: 'assets/captions/man_captions.vtt'),
  Video(
      choice: "Pick Miss Ipsum",
      url:
          "https://drive.google.com/uc?export=download&id=1ohU5AzLxyKAgch115b3XA2-93YUwOZll",
      caption: 'assets/captions/female_captions.vtt'),
  Video(
      choice: "Surprise me",
      url:
          "https://drive.google.com/uc?export=download&id=1HtZlzRya5D8X6PqthD9SAbM1rqX5H6ya",
      caption: 'assets/captions/surprise_caption.vtt'),
];
const pickedLoremVideosSet = [
  Video(
      choice: "Stick with Mr Lorem",
      url:
          "https://drive.google.com/uc?export=download&id=1jDcbAJon6pJ1-DBrSy28jrWuexU_AOHh",
      caption: 'assets/captions/end_captions.vtt'),
  Video(
      choice: "Bet on Miss Ipsum",
      url:
          "https://drive.google.com/uc?export=download&id=1Vo7BGLb096uXFtz0imtqBPqaALCZE7pY",
      caption: 'assets/captions/end_captions.vtt'),
];
const pickedIpsumVideosSet = [
  Video(
      choice: "Stick with Miss Ipsum",
      url:
          "https://drive.google.com/uc?export=download&id=1Vo7BGLb096uXFtz0imtqBPqaALCZE7pY",
      caption: 'assets/captions/end_captions.vtt'),
  Video(
      choice: "Bet on Mr Lorem",
      url:
          "https://drive.google.com/uc?export=download&id=1jDcbAJon6pJ1-DBrSy28jrWuexU_AOHh",
      caption: 'assets/captions/end_captions.vtt'),
];
