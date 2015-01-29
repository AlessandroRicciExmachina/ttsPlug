var pluginTTS = {
    ttsSpeak: function(successCallback, errorCallback, result) {

        cordova.exec(
                successCallback, // success callback function
                errorCallback, // error callback function
                'ttsPLUGIN', // mapped to our native Java class 
                'start', // with this action name
                [{"result": result}] // with this action name

                );

    }


}