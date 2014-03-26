/*
indexing
	description: "C functions to contact Android from Eiffel."
	copyright:	"Copyright (c) 1984-2006, Louis Marchand"
	license:	"MIT (see http://opensource.org/licenses/mit-license.php)"
	Date:		"january 25, 2014
	Version:	"0.1"
*/

#ifndef _eiffel_android_h_
#define _eiffel_android_h_

#include <jni.h>
#include "eif_eiffel.h"

#ifdef __cplusplus
extern "C" {
#endif

JNIEXPORT void JNICALL Java_com_eiffel_EiffelActivity_sendCreateActivity(JNIEnv *, jobject, jobject, jstring, jobject);
JNIEXPORT void JNICALL Java_com_eiffel_EiffelActivity_sendDestroyActivity(JNIEnv *, jobject, jobject, jstring);

void c_quit_eiffel();

#ifdef __cplusplus
}
#endif

#endif	
