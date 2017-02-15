package ipro;

import java.text.SimpleDateFormat;
import java.util.Date;

import io.goeasy.GoEasy;

public class GoEasyMain {

	public static void main(String[] args) {
		GoEasy goEasy = new GoEasy("bce4e6c6-9573-4020-ab5a-40aec1321839");
		while(true){
			try {
				goEasy.publish("channel", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss SSS").format(new Date()));
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}

}
