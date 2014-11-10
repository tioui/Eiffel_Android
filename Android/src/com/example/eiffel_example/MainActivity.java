package com.example.eiffel_example;

import java.util.ArrayList;
import java.util.List;

import android.support.v7.app.ActionBarActivity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.TextView;

public class MainActivity extends ActionBarActivity {


	/**
	 * Initialize the Eiffel Run-time. Must be used one in an application life.
	 */
	public native void initialize_eiffel_runtime();

	/**
	 * Clear every Eiffel object and close the Eiffel Run-time
	 */
	public native void close_eiffel_runtime();

	/**
	 * Return a simple Hello World string generate Eiffel side
	 * @return The Hello World string.
	 */
	public native String get_hello_from_eiffel();

	/**
	 * Return element of the fibonacci sequence
	 * @param a_number The number of element to generate
	 * @return The generated elements of the Fibonacci sequence
	 */
	public native int[] get_fibonacci_sequence_from_eiffel(int a_number);

	static {
		System.loadLibrary("c");
		System.loadLibrary("m");
		System.loadLibrary("example");
		System.loadLibrary("test");
	}
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		initialize_eiffel_runtime();
		setContentView(R.layout.activity_main);
		TextView l_text = (TextView) findViewById(R.id.hello_text);
		l_text.setText(get_hello_from_eiffel());
		int l_fib[] = get_fibonacci_sequence_from_eiffel(10);
		List<String> l_fib_str = get_strings_from_numbers(l_fib);
		ArrayAdapter<String> adapter = new ArrayAdapter<String>(this,
		        android.R.layout.simple_list_item_1, l_fib_str);
		ListView l_list_fib = (ListView) findViewById(R.id.Fib_list);
		l_list_fib.setAdapter(adapter);
		close_eiffel_runtime();
	}
	
	protected List<String> get_strings_from_numbers(int[] a_numbers){
		List<String> l_result = new ArrayList<String>();
		for(int i=0; i<a_numbers.length;i++){
			l_result.add(String.valueOf(a_numbers[i]));
		}
		return l_result;
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		// Handle action bar item clicks here. The action bar will
		// automatically handle clicks on the Home/Up button, so long
		// as you specify a parent activity in AndroidManifest.xml.
		int id = item.getItemId();
		if (id == R.id.action_settings) {
			return true;
		}
		return super.onOptionsItemSelected(item);
	}
}
