note
	description: "[
					An Android application activity.
					Eiffel representation of a Java android.app.Activity Object
							]"
	author		: "Louis Marchand"
	date: "$Date$"
	revision: "$Revision$"

deferred class
	ANDROID_ACTIVITY

inherit
	ANDROID_ANY
		rename
			make_from_pointer as make
		end
	HASHABLE

feature -- Access

	application_context:ANDROID_CONTEXT
			-- Internal context of the Android application.
		require
			Activity_Is_Valid: is_valid
		local
			fid:POINTER
			l_context_item:detachable JAVA_OBJECT
		do
			fid := item.method_id ("getApplicationContext", "()Landroid.content.Context")
			l_context_item := item.object_method (fid, Void)
			if attached l_context_item as la_context_item then
				create Result.make_from_java_object (jni, l_context_item)
				has_error:=False
			else
				create Result.make_from_pointer (jni, create {POINTER})
				has_error:=True
			end
		ensure
			Activity_Application_Context_Valid: not has_error
		end

feature {ANDROID_CONTROLLER} -- Events

	on_create(saved_instance_state:ANDROID_BUNDLE)
			-- Called when an Android activity is created.
		deferred
		end

	on_destroy
			-- Called when an Android activity is destroyed.
		deferred
		end

feature {NONE} -- implementation

	hash_code: INTEGER_32
			-- <Precursor>
		do
			Result := item.java_object_id.hash_code
		end


end
