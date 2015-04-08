package it.exmachina.tts;

import java.util.Locale;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import android.content.Context;
import android.content.Intent;
import android.speech.tts.TextToSpeech;
import android.widget.ListView;

public class CustomTTS extends CordovaPlugin {
	
	public TextToSpeech tts;
	public Intent intent;
	private ListView resultList;
	private Context contesto;

	
	@Override
	public boolean execute(String action, final JSONArray args1,final CallbackContext callbackContext) throws JSONException {

	//	System.out.println("azione:" + action);

		if (action.equals("start")) {

			tts = new TextToSpeech(getApplicationContext(),
					new TextToSpeech.OnInitListener() {
						@Override
						public void onInit(int status) {

							try {
							
							//	System.out.println(args1);
								JSONObject testo = args1.getJSONObject(0);
							//	System.out.println(testo);
								JSONObject testoToSpeak = args1.getJSONObject(1);
								//System.out.println(testoToSpeak);
								String a = testoToSpeak.getString("result");
								String b = testo.getString("language");
								
								if(b.equals("italiano")) {	tts.setLanguage(Locale.ITALIAN); }
								if(b.equals("inglese"))  { 	tts.setLanguage(Locale.ENGLISH); }
								if(b.equals("francese")) { 	tts.setLanguage(Locale.FRENCH);  }
								if(b.equals("tedesco"))  {  tts.setLanguage(Locale.GERMAN);  }
								if(b.equals("spagnolo")) {  tts.setLanguage(Locale.ITALIAN); }
								
//								System.out.println(Locale.getDefault());
								
								tts.speak( a , TextToSpeech.QUEUE_FLUSH, null);
								PluginResult result = new PluginResult(PluginResult.Status.OK, "YOUR_MESSAGE");
// PluginResult result = new PluginResult(PluginResult.Status.ERROR, "YOUR_ERROR_MESSAGE");
result.setKeepCallback(true);
callbackContext.sendPluginResult(result);
								
								
									return true;
							
							} catch (JSONException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
								return false;
								
							}
							
						
						}
					});

		}

	

	

	}

	private Context getApplicationContext() {
		return this.cordova.getActivity().getApplicationContext();
	}


	
	
	
}
