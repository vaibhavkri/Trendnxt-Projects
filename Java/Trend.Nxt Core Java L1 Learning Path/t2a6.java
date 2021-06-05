package music;
public interface Playable {
	public void play();
}

package music.wind;
import music.Playable;
public class Saxophone implements Playable {
	public void play() {
        System.out.println("Saxophone is being played");
    }
}

package music.string;
import music.Playable;
public class Veena implements Playable {
	public void play() {
        System.out.println("Violin is being played");
    }
}

import music.Playable;
import music.string.Veena;
import music.wind.Saxophone;
public class MusicMain {
    public static void main(String args[]) {
        Veena v = new Veena();
        Saxophone s = new Saxophone();
        Playable pv, ps; // Place the above instances in a variable of type Playable and then call play().
        pv = new Veena();
        ps = new Saxophone();
        
        v.play(); // Create an instance of Veena and call play() method
        s.play(); // Create an instance of Saxophone and call play() method
        
        pv.play(); //Place the above instances in a variable of type Playable and then call play().
        ps.play();
        
    }
}