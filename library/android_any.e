note
	description: "[
					An Android objct
					Eiffel representation of a Java Android Object
							]"
	author: "Louis Marchand"
	date: "$Date$"
	revision: "$Revision$"

deferred class
	ANDROID_ANY

inherit
	ANY

feature {NONE} -- Implementation

	make_from_pointer(a_jni:JNI_ENVIRONMENT; a_pointer:POINTER)
			-- Initialize `Current' from `a_jni' environment and a java Object `a_pointer'.
		require
			Android_Any_Make_Pointer_Not_Null: not a_pointer.is_default_pointer
		do
			jni:=a_jni
			create item.make_from_pointer(a_pointer)
			is_valid:=True
			has_error:=False
		end

	make_from_java_object(a_jni:JNI_ENVIRONMENT;a_java_object:JAVA_OBJECT)
			-- Initialize `Current' from `a_jni' environment and `a_java_object'.
		do
			jni:=a_jni
			item := a_java_object
			is_valid:=True
			has_error:=False
		end

feature -- Access

	has_error:BOOLEAN
		-- An error occured on the last feature call.

	is_valid:BOOLEAN
		-- The object has been correctly created

feature {ANDROID_ANY} -- Implementation

	item:JAVA_OBJECT
		-- The internal java object

feature {NONE} -- Implementation

	jni:JNI_ENVIRONMENT
		-- The internal jni environment.
end
