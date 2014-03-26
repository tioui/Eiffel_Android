note
	description: "[
					An Android Application context.
					Eiffel representation of a Java android.content.Context Object.
							]"
	author: "Louis Marchand"
	date: "$Date$"
	revision: "$Revision$"

class
	ANDROID_CONTEXT

inherit
	ANDROID_ANY

create {ANDROID_ACTIVITY}
	make_from_java_object,
	make_from_pointer

end
