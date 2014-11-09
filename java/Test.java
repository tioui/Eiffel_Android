/**
 * Class to test accessing Eiffel feature from Java.
 * @author Louis Marchand
 * @since 2014-11-08
 */

public class Test{

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
		System.loadLibrary("test");
	}

	/**
	 * The Main function
	 */
	public static void main(String argc[]){
		Test test = new Test();
		
		test.initialize_eiffel_runtime();

		// Simple Hello World
		String l_hello = test.get_hello_from_eiffel();
		System.out.println(l_hello + "\n");

		// Fibonacci number (passing Integer to Eiffel and receiving array of INTEGER from Eiffel)
		int[] l_fib = test.get_fibonacci_sequence_from_eiffel(10);
		System.out.print("Fibonacci Sequence: " + l_fib[0]);
		for(int i=1;i<10;i++){
			System.out.print(", " + l_fib[i]);
		}
		System.out.println("\nThe End!");

		test.close_eiffel_runtime();
	}
}
