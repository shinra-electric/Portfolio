//Standard javafx imports.

import java.util.Optional;
//import java.util.Scanner;


import javafx.application.Application;
import javafx.stage.Stage;
import javafx.scene.Scene;

// Imports for layout
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;

//Imports for menus
import javafx.scene.control.Menu;
import javafx.scene.control.MenuBar;
import javafx.scene.control.MenuItem;
import javafx.scene.control.ProgressBar;
import javafx.scene.control.ProgressIndicator;
import javafx.scene.control.RadioButton;
import javafx.scene.control.SeparatorMenuItem;
import javafx.scene.control.Label;
import javafx.scene.control.Button;
import javafx.scene.control.ButtonType;
import javafx.scene.control.DialogPane;

//Import for Alerts
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;

//imports for sound
import java.io.File;
import java.io.IOException;
import javax.sound.sampled.AudioInputStream;
import javax.sound.sampled.AudioSystem;
import javax.sound.sampled.Clip;
import javax.sound.sampled.LineUnavailableException;
import javax.sound.sampled.UnsupportedAudioFileException;

//Imports for components in this application.
import javafx.scene.control.ToggleGroup;

//Support for quitting the application
import javafx.application.Platform;
import javafx.geometry.Insets;
import javafx.geometry.Pos;

public class CardsHiLoGUI extends Application {
	// Menus, menu bar
	MenuBar mBar;

	//labels & Buttons
	Label lblFirstCard, lblSecondCard, lblNextCard, lblDeckIsEmpty, lblReshuffle, lblResult, lblToGo, lblWins;
	Button btnDealFirstCard, btnDealSecondCard;
	ButtonType btnNewGame, btnQuit;

	//Radio buttons for choosing higher or lower.
	RadioButton rbHigher, rbLower;
	ToggleGroup tgChoice;

	//Progress bar
	ProgressBar progBar;
	ProgressIndicator progIndicator;

	//The card objects
	Card leftCard;
	Card rightCard;

	// The image.
	Image imgL;
	Image imgR;

	// The image views.
	ImageView imViewL;
	ImageView imViewR;

	//AudioInputStream and Clip for sound (Playing the card shuffle effect)
	AudioInputStream audioInputStream;
	Clip clip;

	//Win counter
	int wins = 0;

	//Set a boolean to check for to see if we should deal the left or right card.
	//True means next card dealt should be the left one, false means the right one.
	boolean dealLeftNext = true;

	public CardsHiLoGUI() {

	}//Constructor


	@Override
	public void init() {
		//Create deck
		DeckOfCards.getDeck();

		//Menu
		mBar = new MenuBar();

		// Create File menu
		Menu mnuFile = new Menu("File");

		// Create menu items for the File menu
		MenuItem fileNewGame = new MenuItem("New Game");
		mnuFile.getItems().add(fileNewGame);
		fileNewGame.setOnAction(ae -> newGame());

		MenuItem fileShuffle = new MenuItem("Shuffle Deck");
		mnuFile.getItems().add(fileShuffle);
		fileShuffle.setOnAction(ae ->  {
			shuffle();

		});


		// Add separator line
		SeparatorMenuItem sep1 = new SeparatorMenuItem();
		mnuFile.getItems().add(sep1);

		MenuItem fileExitItem = new MenuItem("Exit");
		mnuFile.getItems().add(fileExitItem);
		fileExitItem.setOnAction(ae -> Platform.exit());

		// Create Help menu
		Menu mnuHelp = new Menu("Help");

		// Create menu items for Help menu
		// About
		MenuItem helpAboutItem = new MenuItem("About This Fantastic Game");
		mnuHelp.getItems().add(helpAboutItem);
		helpAboutItem.setOnAction(ae -> showAboutDialog());

		// Add menus to the menu bar.
		mBar.getMenus().add(mnuFile);
		mBar.getMenus().add(mnuHelp);

		//instantiate components
		//Labels
		lblFirstCard = new Label("First Card Dealt:");
		lblSecondCard = new Label("Second Card Dealt:");
		lblNextCard = new Label("Next card will be:");
		lblDeckIsEmpty = new Label();
		lblReshuffle = new Label();
		lblResult = new Label("");
		lblWins = new Label("You currently have " + wins + " correct guesses.");

		//Toggle & Radio buttons
		tgChoice = new ToggleGroup();
		rbHigher = new RadioButton("Higher");
		rbLower = new RadioButton("Lower");
		rbHigher.setSelected(true);
		rbHigher.setToggleGroup(tgChoice);
		rbLower.setToggleGroup(tgChoice);

		//Instantiate buttons
		btnDealFirstCard = new Button("<- Deal First Card");
		btnDealSecondCard = new Button("Deal Second Card ->");
		btnDealSecondCard.setDisable(true);
		btnDealFirstCard.setMinWidth(160);
		btnDealSecondCard.setMinWidth(160);



		//Instantiate the imageviews
		imViewL = new ImageView();
		imViewR = new ImageView();
		imgL = new Image("cards/back.png");//set the card back
		imViewL.setImage(imgL);
		imgR = new Image("cards/back.png");//set the card back
		imViewR.setImage(imgR);

		//Set button functions
		btnDealFirstCard.setOnAction(ae -> {
			//Check whether we can deal left or not
			if (dealLeftNext == true) {
				//Try catch, because will return null if deck is empty
				try {
					leftCard = DeckOfCards.dealTopCard();
					imgL = new Image("cards/" + leftCard.toString() + ".png");
					imViewL.setImage(imgL);
					imgR = new Image("cards/back.png");//Remove the right card. No point in having an old one there.
					imViewR.setImage(imgR);
					dealLeftNext = false;//Toggle dealLeftNext so the right hand card can be dealt
					toggleButtons(); //Change the focus to help guide the user.
					lblResult.setText(""); //Reset the result text
				} catch (NullPointerException e) {
					lblDeckIsEmpty.setText("Deck is empty.");
					lblReshuffle.setText("You need to reshuffle!");
				}//Try catch
			}//Check dealLeftNext
		});//Deal first card

		btnDealSecondCard.setOnAction(ae -> {
			if (dealLeftNext == false) {
				//Try catch, because will return null if deck is empty
				try {
					rightCard = DeckOfCards.dealTopCard();
					imgR = new Image("cards/" + rightCard.toString() + ".png");
					imViewR.setImage(imgR);
					dealLeftNext = true; //Toggle dealLeftNext so the left hand card can be dealt
					toggleButtons(); //Change the focus to help guide the user.
					checkWin();
				} catch (NullPointerException e) {
					lblDeckIsEmpty.setText("Deck is empty.");
					lblReshuffle.setText("You need to reshuffle!");
				} //Try Catch
			} //Check dealLeftNext
		});//deal second card


		//Progress bar
		progBar = new ProgressBar(0);
		progIndicator = new ProgressIndicator(0);
		progBar.setMinWidth(300);
		//Note I've changed the progress indicator in the CSS file.

	}//init()

	@Override
	public void start(Stage pStage) throws Exception {
		// Set the width and height.
		pStage.setWidth(630);
		pStage.setHeight(530);

		//set title
		pStage.setTitle("High-Low Card Game");

		// Create a layout.
		BorderPane bp = new BorderPane();

		//TOP
		bp.setTop(mBar);

		//LEFT HAND SIDE
		VBox lVbox = new VBox();
		lVbox.getChildren().addAll(lblFirstCard, imViewL);
		bp.setLeft(lVbox);
		//Scale the image in the view to fit
		imViewL.setFitHeight(275);
		imViewL.setFitWidth(200);

		//CENTRE
		VBox centreVbox = new VBox();
		centreVbox.getChildren().addAll(lblNextCard, rbHigher, rbLower,
				btnDealFirstCard, btnDealSecondCard, lblDeckIsEmpty, lblReshuffle);
		bp.setCenter(centreVbox);

		//RIGHT HAND SIDE
		VBox rVbox = new VBox();
		rVbox.getChildren().addAll(lblSecondCard, imViewR, lblResult);
		bp.setRight(rVbox);

		//Scale the image in the view to fit
		imViewR.setFitHeight(275);
		imViewR.setFitWidth(200);

		//BOTTOM
		VBox bVbox = new VBox();
		HBox bHbox = new HBox();
		bHbox.getChildren().addAll(progBar, progIndicator);
		bVbox.getChildren().addAll(lblWins, bHbox);

		bp.setBottom(bVbox);

		//Set Margins and Padding
		bp.setMargin(lVbox, new Insets(15));
		bp.setMargin(rVbox, new Insets(15));

		centreVbox.setPadding(new Insets(55, 5,5,5));
		centreVbox.setSpacing(10);

		lVbox.setSpacing(15);

		rVbox.setSpacing(15);


		bHbox.setAlignment(Pos.CENTER);
		bHbox.setPadding(new Insets(20));
		bHbox.setSpacing(15);
		bVbox.setAlignment(Pos.CENTER);

		// Create a scene.
		Scene s = new Scene(bp);

		// Add a style sheet
		s.getStylesheets().add("./style.css");

		// Set the scene.
		pStage.setScene(s);

		// Show the stage.
		pStage.show();

	}

	public static void main(String[] args) {
		launch();

	}

	private void newGame() {
		wins = 0;
		shuffle();
		resetProgress();
		dealLeftNext = true;
		toggleButtons();
		lblResult.setText("");
		lblWins.setText("You currently have " + wins + " correct guesses.");
	}//newGame()

	private void toggleButtons() {
		//disable whichever deal buttons is not active
		if (dealLeftNext) {
			btnDealFirstCard.setDisable(false);
			btnDealSecondCard.setDisable(true);
			btnDealFirstCard.requestFocus();
		}

		else {
			btnDealFirstCard.setDisable(true);
			btnDealSecondCard.setDisable(false);
			btnDealSecondCard.requestFocus();
		}

	}//toggleButtons


	private void checkWin() {
		//Check whether the player wins or loses
		if (tgChoice.getSelectedToggle() == rbHigher) {
			//Choice is higher
			if (leftCard.isHigher(rightCard)) {
				lblResult.setText("Higher. You Win!");
				scoreAction();
			}//if left is higher than right

			else if (leftCard.isEqual(rightCard)) {
				lblResult.setText("Equal. You Lose!");
				loseAction();
			}// if cards are equal

			else  {
			lblResult.setText("Lower. You Lose!");
			loseAction();
			}// if left is lower than right

		} else {//Choice is lower

			if (leftCard.isHigher(rightCard)) {
				lblResult.setText("Higher. You Lose!");
				loseAction();
			}//if left is higher than right

			else if (leftCard.isEqual(rightCard)) {
				lblResult.setText("Equal. You Lose!");
				loseAction();
			}// if cards are equal
			else  {
				lblResult.setText("Lower. You Win!");
				scoreAction();
				//if left is lower than right
			}
		}

	}// Check Win

	private void scoreAction() {
		wins++;
		progress();
		lblWins.setText("You currently have " + wins + " correct guesses.");
		if (wins == 5) {
			showWinDialog();
		}
	}//scoreAction

	private void loseAction() {
		wins = 0;
		resetProgress();
		lblWins.setText("You currently have " + wins + " correct guesses.");
	}//loseAction()


	private void shuffle() {
		DeckOfCards.shuffleDeck();

		lblDeckIsEmpty.setText("");	 //Clear the shuffle instruction text
		lblReshuffle.setText("");
		lblResult.setText(""); //Reset the result text
		dealLeftNext = true;
		toggleButtons();
		imgL = new Image("cards/back.png");//set the card back
		imViewL.setImage(imgL);
		imgR = new Image("cards/back.png");//set the card back
		imViewR.setImage(imgR);


		//This is to play a shuffle sound. I was going to add more sounds, but it was frustrating to get working...
		try {
		audioInputStream = AudioSystem.getAudioInputStream(new File("cards/shuffle.wav").getAbsoluteFile());
		 clip = AudioSystem.getClip();
		 clip.open(audioInputStream);
		} catch (IOException  e ){

		} catch (UnsupportedAudioFileException e) {

		} catch (LineUnavailableException e) {

		}//End of try catch
		clip.start();

	}

	private void showAboutDialog() {

		Alert alert = new Alert(AlertType.INFORMATION);
		alert.setWidth(0);
		alert.setTitle("About This Astounding App");
		alert.setHeaderText("Fantastic Card Game");
		alert.setContentText("This brilliant game that deserves full marks"
				+ "\n was produced by: \n\nName:\t\t\t\tSéamus Ó Connor\nStudent Number:\t\t*********");


		//Stylesheets for the dialog
		DialogPane dialogPane = alert.getDialogPane();
		dialogPane.getStylesheets().add(getClass().getResource("dialog.css").toExternalForm());
		dialogPane.getStyleClass().add("myDialog"); //tag it so can target in CSS

		Image winImg = new Image("/cards/wonka.png"); //I didn't like the default image, so found something more interesting
		ImageView imageView = new ImageView(winImg);
		imageView.setFitHeight(200);
		imageView.setFitWidth(200);
		alert.setGraphic(imageView);

		alert.showAndWait();

	}// showAboutDialogue()

	private void showWinDialog() {

		Alert alert = new Alert(AlertType.CONFIRMATION);

		alert.setTitle("Game Over");
		alert.setHeaderText("You Win!");
		alert.setContentText("You got five correct guesses in a row.\n\n");

		btnNewGame = new ButtonType("New Game");
		btnQuit = new ButtonType("Quit");

		alert.getButtonTypes().setAll(btnNewGame, btnQuit);

		Image winImg = new Image("/cards/bmo.gif"); //Reward for winning is a dancing BMO gif.
		ImageView imageView = new ImageView(winImg);
		imageView.setFitWidth(200);
		imageView.setFitHeight(124);
		alert.setGraphic(imageView);


		//Stylesheets for the alert
		DialogPane dialogPane = alert.getDialogPane();
		dialogPane.getStylesheets().add(getClass().getResource("dialog.css").toExternalForm());
		dialogPane.getStyleClass().add("myDialog");//tag it so can target in the CSS

		//Buttons for dialog. Not sure why they are done differently, but setOnAction didn't work.
		Optional<ButtonType> result = alert.showAndWait();
		if (result.get() == btnNewGame){
			newGame();
		} else if (result.get() == btnQuit) {
			Platform.exit();
		}
	}// showAboutDialogue()

	private void progress() {

		//get the current progress
		double progValue = progBar.getProgress();

		progValue += 0.2; //Increase by 20% for each win

		//set the new increased progress
		progBar.setProgress(progValue);

		//Also set the progress indicator
		progIndicator.setProgress(progValue);

	}//progress()



	private void resetProgress() {
		//Reset the progress
		progBar.setProgress(0);

		//Also reset the progress indicator
		progIndicator.setProgress(0);
	}//resetProgress



}//Class
