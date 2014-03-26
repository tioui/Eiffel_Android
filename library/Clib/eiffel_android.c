/*
indexing
	description: "C functions to contact Android from Eiffel."
	copyright:	"Copyright (c) 1984-2006, Louis Marchand"
	license:	"MIT (see http://opensource.org/licenses/mit-license.php)"
	Date:		"january 25, 2014
	Version:	"0.1"
*/

#include "eiffel_android.h"
#include "eif_setup.h"

void initialize_eiffel_for_android(EIF_POINTER);

EIF_OBJECT eiffel_android_controller = NULL;

void c_quit_eiffel(){
	eif_wean (eiffel_android_controller);
	eiffel_android_controller = NULL;
	EIF_RT_BASIC_CLEANUP
}

void failure_function () {
}
JNIEXPORT void JNICALL Java_com_eiffel_EiffelActivity_sendCreateActivity(JNIEnv *env, jobject obj, jobject activity, jstring name, jobject bundle){
    	EIF_PROCEDURE ep;
	EIF_TYPE_ID controller_id;
	if (eiffel_android_controller==NULL){
		int argc = 0;
		char **argv = NULL;
		char **envp = NULL;
		EIF_INITIALIZE(failure_function) }
		EIF_TYPE_ID application_id;
		EIF_PROCEDURE emake, einit;
		application_id = eif_type_id ("ANDROID_APPLICATION");
		if (application_id == EIF_NO_TYPE){
			eif_panic ("No ANDROID_APPLICATION class!");
		}
		eiffel_android_controller = eif_create(application_id);
		emake = eif_procedure ("make", application_id);
		(emake) (eif_access (eiffel_android_controller));
		einit = eif_procedure ("initialize_jvm", application_id);
		(einit) (eif_access (eiffel_android_controller), env);
	}
	controller_id = eif_type_id ("ANDROID_CONTROLLER");
	ep = eif_procedure ("receive_create_activity", controller_id);
	(ep) (eif_access (eiffel_android_controller), env, activity, name, bundle);
}
JNIEXPORT void JNICALL Java_com_eiffel_EiffelActivity_sendDestroyActivity(JNIEnv *env, jobject object, jobject activity, jstring name){
	EIF_PROCEDURE receive_destroy_activity;
	EIF_BOOLEAN_FUNCTION activities_is_empty_funct;
	EIF_TYPE_ID controller_id;
	EIF_BOOLEAN activities_is_empty;
	controller_id = eif_type_id ("ANDROID_CONTROLLER");
	receive_destroy_activity = eif_procedure ("receive_destroy_activity", controller_id);
	(receive_destroy_activity) (eif_access (eiffel_android_controller), env, activity, name);
	activities_is_empty_funct = eif_boolean_function("activities_is_empty", controller_id);
	activities_is_empty = ((activities_is_empty_funct) (eif_access (eiffel_android_controller)));
	if (activities_is_empty){
	    c_quit_eiffel();
	}
}


