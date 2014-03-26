note
	description: "Summary description for {STARTING_ACTIVITY}."
	author		: "Louis Marchand"
	date: "$Date$"
	revision: "$Revision$"

class
	STARTING_ACTIVITY

inherit
	ANDROID_ACTIVITY

create
	make

feature {NONE} -- Events

	on_create(saved_instance_state:ANDROID_BUNDLE)
			-- <precursor>
		local
			l_toast:ANDROID_TOAST
		do
			create l_toast.make (jni, Current, "Hello from Eiffel!", True)
			l_toast.show
		end

	on_destroy
			-- <precursor>
		do
		end

end
