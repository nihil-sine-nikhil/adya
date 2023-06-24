# assignment

Assignment for Adya Health.  A non-linear video session system

## Getting Started





**lib/src/presentation/home/home_screen**

* late VideoPlayerController _controller;: I declare a VideoPlayerController variable to control the video playback.

* late Future<void>? _initializeVideoPlayerFuture;: I declare a future variable to handle the initialization of the video player.

* late int _playBackTime;: I declare an integer variable to keep track of the current playback time of the video.

* bool isVideoEnded = false;: I declare a boolean variable to track whether the video has ended or not.

* String choice = "Let's Rumble";: I declare a string variable to hold the current choice made by the user.

* List<String> previousChoices = [];: I declare a list to store the previous choices made by the user.

* _loadCaptions(String caption): This function loads the closed captions for the video by reading the contents of a caption file.

* void initState(): This method is called when the widget is first created. Here, I initialize the video playback by calling _initializePlay() with the first video from the playAgainVideoList.

* void dispose(): This method is called when the widget is removed from the tree. I clean up the video player resources by disposing of the controller.

* _initializePlay(Video vid): This method initializes the video player with the provided video. It sets up the controller, sets listeners for video events, and starts playing the video.

* _startPlay(Video vid): This method is called when the user selects a new choice. It stops the previous video, clears the previous playback state, and starts playing the new video.

* Widget build(BuildContext context): This method builds the widget hierarchy for the HomeScreen widget. It returns a Scaffold containing the video player and the choices container.

* _buildChoicesContainer(): This method builds the UI for the choices container. It displays the available choices based on the current selection and allows the user to make a new choice.

* _buildRedoChoiceOnTap(): This method shows a dialog that allows the user to redo a previous choice. It displays the previous choices and lets the user select a choice to replay the corresponding video.

* In summary, the HomeScreen widget represents the main screen of the application, which includes a video player, a choices container, and functionality to control video playback, make new choices, and redo previous choices.





**lib/src/presentation/home/widgets/control_view**

* The provided code defines a ControlsView widget responsible for displaying video controls. Here's an explanation of the key parts:

* final VideoPlayerController controller: This is a required parameter representing the video player controller. It is used to control the video playback.

* final VoidCallback onTap: This is a required parameter representing a callback function to be executed when the controls are tapped.

* _playbackRates: This is a list of playback rates available for the video. It defines different speeds at which the video can be played.

* build(BuildContext context): This method builds the widget hierarchy for the ControlsView widget. It returns a Stack widget containing the video controls.

* AnimatedSwitcher: This widget provides a smooth transition between the video player and a "play" icon. It shows the "play" icon when the video is not playing and shrinks it when the video starts playing.

* GestureDetector: This widget detects tap gestures on the video player area. When tapped, it toggles the video playback by pausing or playing the video based on the current state.

* Positioned: These widgets position the "redo" and "speed" buttons at the top-left and top-right corners, respectively.

* IconButton: This widget displays the "redo" button, which allows the user to go back to the previous decision. When pressed, it calls the onTap callback provided in the constructor.

* PopupMenuButton: This widget displays the "speed" button, which opens a popup menu when pressed. The popup menu contains different playback speed options. When a speed option is selected, it calls the onSelected callback, and the controller updates the playback speed accordingly.

* The purpose of the ControlsView widget is to provide a user interface for controlling the video playback, including play/pause functionality, redoing previous decisions, and adjusting the playback speed.




**lib/src/data/model/video_model**

* The code provided defines a Video class and lists several sets of videos with different choices. Here's an explanation of the key parts:

* class Video: This class represents a video and has three properties: choice (the video choice), url (the URL of the video), and caption (the caption file associated with the video).

* List<Video> getNextVideoList(String choice): This function takes a choice parameter and returns a list of Video objects based on the provided choice. It uses a switch statement to determine the appropriate video set based on the choice.

* const pickedSurpiseVideoList, const playAgainVideoList, const getStartedVideosSet, const pickedLoremVideosSet, const pickedIpsumVideosSet: These are lists of Video objects representing different sets of videos. Each video has a choice, URL, and caption associated with it.

* The purpose of these definitions is to provide different sets of videos based on the selected choices in the main code. This allows the code to dynamically load and play different videos based on user interactions.
*

**CHARACTER LIST and THEIR LORE**

**Mr. Lorem:**
Mr. Lorem, a young guy, is a regular at the local bowling club. Despite his best efforts, his bowling skills leave much to be desired. Clad in an outdated bowling shirt that barely fits, he approaches the game with unwavering determination, even though his frequent gutter balls make it hard to take him seriously. Mr. Lorem is known for his intense rivalry with Miss Ipsum, their fierce competition often turning their encounters into a battle of egos. Nevertheless, beneath his competitive exterior, Mr. Lorem hides a good-natured spirit and a persistent belief that one day he will finally strike it big.

**Miss Ipsum:**
Miss Ipsum, an elegant woman in her late twenties, exudes an air of confidence and sophistication. Her perfectly manicured nails and stylish bowling attire reflect her meticulous nature, but unfortunately, her skills on the bowling alley don't quite match her glamorous appearance. Though she may lack natural talent, Miss Ipsum compensates with an unwavering commitment to practice, always seeking to improve her game. She takes her rivalry with Mr. Lorem to heart, often engaging in playful banter that masks her genuine desire to outshine him. While her bowling prowess may be lacking, her resilience and determination make her a force to be reckoned with.

**Mr. Frog:**
Mr. Frog, an enigmatic figure with a mischievous twinkle in his eyes, is an unexpected presence at the local bowling club's aquarium. Despite his unconventional appearance, there is a captivating aura of confidence that surrounds him. Rumor has it that he possesses an uncanny ability to predict the outcome of bowling matches, making him a mysterious figure at the club. While his skills on the lanes remain largely unknown, many are willing to place their bets on Mr. Frog's predictions rather than on the lackluster performances of Mr. Lorem and Miss Ipsum.
