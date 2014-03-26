package com.eiffel;

import android.app.Activity;
import android.os.Bundle;

public class EiffelActivity extends Activity {

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		sendCreateActivity(this,this.getLocalClassName(),savedInstanceState);
	}
	
	@Override
	protected void onDestroy() {
		super.onDestroy();
		sendDestroyActivity(this,this.getLocalClassName());
	}
	
	/*
	 * Used to send the `onCreate' event to the Eiffel Activity
	 */
	public native void  sendCreateActivity(EiffelActivity act, String name, Bundle savedInstanceState);
	
	/*
	 * Used to send the `onDestroy' event to the Eiffel Activity
	 */
	public native void  sendDestroyActivity(EiffelActivity act, String name);
	
	static {
        System.loadLibrary("libapp");
    }
}