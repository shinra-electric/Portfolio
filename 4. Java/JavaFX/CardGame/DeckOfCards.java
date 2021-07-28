//Array created in constructor
//Shuffle is random sort
//Should probably make the deck a singleton


public class DeckOfCards {
	private static DeckOfCards deck = null;
	private static Card[] deckArray = new Card[52];
	private static int topCard = 0;
	
	
	//Constructor is private.
	private DeckOfCards() {
		//Populate the array with the cards
		int counter = 0;
		for (int suit = 0; suit < 4; suit++) {
			for (int rank = 1; rank < 14; rank++) {
				deckArray[counter] = new Card(suit, rank);
				counter++;
			}//value
 		}//Suit	
		shuffleDeck();
	}//Constructor 
	
	//This is called instead of the constructor, making sure it is a singleton. 
	public static DeckOfCards getDeck() {
		if (deck == null) {
			deck = new DeckOfCards();
		}
		return deck;
		
	}//getDeck()
	
	public static void shuffleDeck() {
		for (int i = 0; i < 52; i++) {
			Card temp = deckArray[i]; 
			int random = (int) (Math.random() * 52 );
			deckArray[i] = deckArray[random];
			deckArray[random] = temp;
			topCard = 0;
		}
	}//shuffle()
	
	public static Card dealTopCard() {
		//Only return the next card if the topCard variable is less than 52. Check the isEmpty() method. 
		if (!isEmpty()) {
			//Should do it this way otherwise the topCard will increment before returning. 
			Card temp = deckArray[topCard]; 
			topCard++;
			return temp;
		}
		else 
			return null;	
		//Return nothing if the deck is empty. 
		//Need a try/catch block when calling this to handle the null pointer exception. 
	}//dealTopCard()

	
	public static boolean isEmpty() {
		if (topCard == 52) 
			return true;
		else return false;
	}//isEmpty
	
	
}//Class
