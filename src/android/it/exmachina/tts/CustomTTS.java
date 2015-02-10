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
	public boolean execute(String action, final JSONArray args1,CallbackContext callbackContext) throws JSONException {

		System.out.println("azione:" + action);

		if (action.equals("start")) {

			tts = new TextToSpeech(getApplicationContext(),
					new TextToSpeech.OnInitListener() {
						@Override
						public void onInit(int status) {

							try {
							
								JSONObject test = args1.getJSONObject(0);
								String a = test.getString("result");
								System.out.println(Locale.getDefault());
								tts.setLanguage(Locale.ITALY);
								tts.speak( a , TextToSpeech.QUEUE_FLUSH, null);
								
							} catch (JSONException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
							
						
						}
					});

		}

	

		return true;

	}

	private Context getApplicationContext() {
		return this.cordova.getActivity().getApplicationContext();
	}


	
	
	
}
