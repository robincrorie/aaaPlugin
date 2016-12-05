/**
 */
package com.example;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaWebView;
import org.apache.cordova.PluginResult;
import org.apache.cordova.PluginResult.Status;
import org.json.JSONObject;
import org.json.JSONArray;
import org.json.JSONException;

import android.util.Log;

import java.util.Date;
import java.util.ArrayList;

import android.app.Activity;
import android.content.Intent;
import android.util.Log;

public class MyCordovaPlugin extends CordovaPlugin {
  private static final String TAG = "MyCordovaPlugin";

  private CallbackContext callbackContextVar;

  // public void initialize(CordovaInterface cordova, CordovaWebView webView) {
  //   super.initialize(cordova, webView);
  //
  //   Log.d(TAG, "Initializing MyCordovaPlugin");
  // }

  public boolean execute(String action, final JSONArray args, final CallbackContext callbackContext) throws JSONException {
    Log.e(TAG, action);
    callbackContextVar = callbackContext;

    if(action.equals("echo")) {
      String phrase = args.getString(0);
      // Echo back the first argument
      Log.d(TAG, phrase);

      return true;
    } else if(action.equals("getDate")) {
      // An example of returning data back to the web layer
      final PluginResult result = new PluginResult(PluginResult.Status.OK, (new Date()).toString());
      callbackContext.sendPluginResult(result);

      return true;
    } else if(action.equals("displayView")) {
      Intent intent = new Intent(cordova.getActivity(), TestView.class);

      Log.i(TAG, "starting view");
      if (cordova != null) {
        Log.d(TAG, "cordova not null");
				cordova.startActivityForResult((CordovaPlugin) this, intent, 0);
			}

      return true;
    }

    return false;
  }

  public void onActivityResult(int requestCode, int resultCode, Intent data) {
    if (resultCode == Activity.RESULT_OK && data != null) {
      ArrayList<String> fileNames = data.getStringArrayListExtra("MULTIPLEFILENAMES");
      JSONArray res = new JSONArray(fileNames);
      callbackContextVar.success(res);
    } else if (resultCode == Activity.RESULT_CANCELED && data != null) {
      String error = data.getStringExtra("ERRORMESSAGE");
      callbackContextVar.error(error);
    } else if (resultCode == Activity.RESULT_CANCELED) {
      JSONArray res = new JSONArray();
      callbackContextVar.success(res);
    } else {
      callbackContextVar.error("No images selected");
    }
  }
}
