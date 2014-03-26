note
	description: "[
					An Android message popup widget.
					Eiffel representation of a Java android.widget.Toast Object
							]"
	author: "Louis Marchand"
	date: "$Date$"
	revision: "$Revision$"

class
	ANDROID_TOAST

inherit
	ANDROID_ANY

create
	make

feature {NONE} -- Initialization

	make(a_jni:JNI_ENVIRONMENT; a_activity:ANDROID_ACTIVITY; a_text:READABLE_STRING_GENERAL; a_last_long:BOOLEAN)
			-- Initialization for `Current'.
		local
			l_toast_class: detachable JAVA_CLASS
            l_instance_of_toast: detachable JAVA_OBJECT
            l_make_text_function:POINTER
            l_make_text_arguments:JAVA_ARGS
		do
			jni:=a_jni
			has_error := False
			l_toast_class := a_jni.find_class ("Toast")
			if attached l_toast_class as la_toast_class then
				l_make_text_function := l_toast_class.field_id ("makeText", "(Landroid.content.Context;Ljava.lang.CharSequence;I)Landroid.widget.Toast")
				create l_make_text_arguments.make (3)
				l_make_text_arguments.put_object (a_activity.application_context.item, 1)
				l_make_text_arguments.put_string (a_text.as_string_8, 2)
				if a_last_long then
					l_make_text_arguments.put_int (1, 3)	-- ToDo: Use the LENGTH_LONG Java Constants instead of 1
				else
					l_make_text_arguments.put_int (0, 3)	-- ToDo: Use the LENGTH_SHORT Java Constants instead of 0
				end

				l_instance_of_toast :=l_toast_class.object_method (l_make_text_function, l_make_text_arguments)
				if attached l_instance_of_toast as la_instance then
					item := la_instance
				else
					create item.make_from_pointer (create {POINTER})
					has_error := True
				end
			else
				create item.make_from_pointer (create {POINTER})
				has_error := True
			end
			is_valid:=not has_error
		ensure
			Toast_Make_Succeeded: is_valid
		end

feature -- Access

	show
			-- put `Current' visible on screen.
		local
			fid:POINTER
		do
			fid := item.method_id ("show", "()V")
			item.void_method (fid, Void)
		end

end
