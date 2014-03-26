note
	description: "The Java environment linked to the Dalvik Virtual Machine ({ANDROID_VM})."
	author: "Louis Marchand"
	date: "$Date$"
	revision: "$Revision$"

class
	ANDROID_JNI_ENVIRONMENT

inherit
	JNI_ENVIRONMENT
		rename
			make as make_java_vm
		end

create
	make

feature {NONE} -- Initialization

	make (vm: JAVA_VM)
			-- Create new JNI environment
		require
			vm_not_void: vm /= Void
		do
			jvm := vm
			create java_class_table.make (200)
			create java_object_table.make (200)
		end

end
