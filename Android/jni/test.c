// Glue code to pass from Java to Eiffel
// Created by: Louis Marchand
// Date: 2014, november 8

#include "com_example_eiffel_example_MainActivity.h"
#include "libexample.h"
#include "eif_setup.h"

extern char **environ;


// Initialize the Eiffel Run-time (Should be use one in the program)
JNIEXPORT void JNICALL Java_com_example_eiffel_1example_MainActivity_initialize_1eiffel_1runtime(JNIEnv * env, jobject obj){
	// Needed to Initialize the Eiffel Run-time
	int argc = 0;
    char program_name[] = "Java Application";
	char* argv[1];
	argv[0] = program_name;
	char **envp = environ;

	// Initialize the Eiffel run-time
	EIF_INITIALIZE(failure) } // Don't care about the ending }. it is suppose to be there.
}

// Collect everything (Eiffel side) and close the Run-Time
JNIEXPORT void JNICALL Java_com_example_eiffel_1example_MainActivity_close_1eiffel_1runtime(JNIEnv * env, jobject obj){
	{ EIF_DISPOSE_ALL // Don't care about the beginning {. It is suppose to be there.
}

// Return a simple Hello World String from Eiffel
JNIEXPORT jstring JNICALL Java_com_example_eiffel_1example_MainActivity_get_1hello_1from_1eiffel(JNIEnv * env, jobject obj){
	return (*env)->NewStringUTF(env, hello_from_eiffel());
}

// Return an integer array containing `a_number' elements of the Fibonacci sequence.
JNIEXPORT jintArray JNICALL Java_com_example_eiffel_1example_MainActivity_get_1fibonacci_1sequence_1from_1eiffel(JNIEnv * env, jobject obj, jint a_number){
	jintArray l_result;
	int * l_fib;

	l_fib = fibonacci_sequence_from_eiffel(a_number);
	l_result = (*env)->NewIntArray(env, a_number);
	(*env)->SetIntArrayRegion(env, l_result, 0, a_number, l_fib);

	return l_result;	
}
