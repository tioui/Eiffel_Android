note
	description: "[
					The controller of the Eiffel/Android wrapper
					This class has the responsibility of the Android Virtual Machine (Dalvik)
					management (the {JNI_ENVIRONMENT}) and of every active activities.
						]"
	author: "Louis Marchand"
	date: "$Date$"
	revision: "$Revision$"

deferred class
	ANDROID_CONTROLLER

feature {NONE} -- Initialization

	make
			-- Initialization of `Current'.
		do
			jni_environment_pointer:=create {POINTER}
			create activities.make (1)
		end

feature {NONE} -- Events

	initialize_jvm(a_env_ptr:POINTER)
			-- Assign the current jvm with `a_env_ptr'.
		do
			jni_environment_pointer:=a_env_ptr
		end

	receive_create_activity(a_activity_ptr, a_activity_name, a_bundle:POINTER)
			-- Called when a new Android Activity is created.
		local
			l_activity_name:READABLE_STRING_GENERAL
			l_activity:ANDROID_ACTIVITY
		do
			l_activity_name:=jni.get_string (a_activity_name)
			l_activity:=map_activities(l_activity_name,a_activity_ptr)
			activities.put (l_activity, l_activity_name)
			l_activity.on_create (create {ANDROID_BUNDLE}.make_from_pointer (jni, a_bundle))
		end

	receive_destroy_activity(a_activity_ptr, a_activity_name:POINTER)
			-- Called when an Android Activity is destroyed.
		local
			l_activity_name:READABLE_STRING_GENERAL
		do
			l_activity_name:=jni.get_string (a_activity_name)
			if attached activities.item (l_activity_name) as la_activity then
				la_activity.on_destroy
				activities.remove (l_activity_name)
			end
		end

feature {NONE} -- Implementation

	map_activities(a_activity_name:READABLE_STRING_GENERAL;a_activity_pointer:POINTER):ANDROID_ACTIVITY
			-- Map a Java "EiffelActivity" pointed by `a_activity_pointer' that has the java class name `a_activity_name'
			-- to the associate Eiffel {ACTIVITY}
		deferred
		end

	activities:HASH_TABLE[ANDROID_ACTIVITY,READABLE_STRING_GENERAL]
			-- All Android Activities currently active in the system (not destroyed)

	jni:JNI_ENVIRONMENT
			-- The current internal jni environment.
		local
			l_vm:ANDROID_VM
		once
			create l_vm.make_from_env (jni_environment_pointer)
			create {ANDROID_JNI_ENVIRONMENT} Result.make (l_vm)
		end


	jni_environment_pointer:POINTER
			-- A {POINTER} to the current internal `jni' environment.


	activities_is_empty:BOOLEAN
			-- True if there is no active `activities'.
		do
			Result := activities.is_empty
		end


end
