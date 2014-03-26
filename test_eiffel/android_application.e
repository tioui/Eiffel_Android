note
	description : "android_eiffel application root class"
	author		: "Louis Marchand"
	date        : "$Date$"
	revision    : "$Revision$"

class
	ANDROID_APPLICATION

inherit
	ANDROID_CONTROLLER

create {NONE}
	make

feature {NONE} -- Initialization


	map_activities(a_activity_name:READABLE_STRING_GENERAL;a_activity_pointer:POINTER):ANDROID_ACTIVITY
			-- Map a Java "EiffelActivity" pointed by `a_activity_pointer' that has the java class name `a_activity_name'
			-- to the associate Eiffel {ANDROID_ACTIVITY}
		do
			if a_activity_name.is_equal ("StartingActivity") then
				create {STARTING_ACTIVITY} Result.make (jni, a_activity_pointer)
			else
				create {FINAL_ACTIVITY} Result.make (jni, a_activity_pointer)
			end
		end

end
