
public class Card {
	private final int suit;
	private final int rank;


	public Card(int suit, int rank) {
		this.suit = suit;
		this.rank = rank;
	}// Constructor
	

	public int getSuit() {
		return suit;
	}

	public int getRank() {
		return rank;
	}

	
	public boolean isEqual(Card a) {
		boolean equalTo = false;
		
		if (rank == a.getRank()) {
			equalTo = true;
		}
		
		return equalTo;
	}
	
	
	public boolean isHigher(Card a) {
		if (rank < a.getRank()) {
			return true;
		}
		else return false;	
	}//isHigher()
	
	
	//Didn't actually need to use the isLower() method....
//	public boolean isLower(Card a) {
//		if (rank > a.getRank()) {
//			return true;
//		}
//		else return false;
//	}//isLower()


	@Override
	public String toString() {
		String txtRank = "";
		String txtSuit = "";
		
		switch (suit) {
		
		case 0: 
			txtSuit = "spades";
			break;
			
		case 1: 
			txtSuit = "hearts";
			break;
			
		case 2: 
			txtSuit = "diamonds";
			break;
			
		case 3:
			txtSuit = "clubs";
			break;
			
		}//Switch for suit
		
		switch (rank) {
		
		case 1: 
			txtRank = "ace";
			break;
			
		case 2: 
			txtRank = "2";
			break;
			
		case 3: 
			txtRank = "3";
			break;
			
		case 4: 
			txtRank = "4";
			break;
			
		case 5: 
			txtRank = "5";
			break;
		
		case 6: 
			txtRank = "6";
			break;
			
		case 7: 
			txtRank = "7";
			break;
			
		case 8: 
			txtRank = "8";
			break;
			
		case 9: 
			txtRank = "9";
			break;
		
		case 10: 
			txtRank = "10";
			break;
			
		case 11: 
			txtRank = "jack";
			break;
			
		case 12: 
			txtRank = "queen";
			break;
			
		case 13: 
			txtRank = "king";
			break;
			
		}//Switch for rank
		
		return txtRank + "_of_" + txtSuit;
		//Specifically set the toString to this format to match the image files. 
		//Will add .png extension when calling.
	}//toString()


}//Class 
