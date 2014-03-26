note
	description: "Summary description for {AND_JNI_ENVIRONMENT}."
	author: "Louis Marchand"
	date: "$Date$"
	revision: "$Revision$"

class
	ANDROID_VM

inherit
	JAVA_VM

create
	make_from_env

feature {NONE} -- Initialization

	make_from_env(a_env:POINTER)
			-- Get a JVM execution environment from an JNIenv pointer.
		local
			err: INTEGER
			l_jvmp: POINTER
			l_options: ARRAY [JAVA_VM_OPTION]
			l_ex: EXCEPTIONS
		do
			envp:=a_env
			create default_vm_args.make
			default_vm_args.set_version ({JAVA_VM_INIT_ARGS}.Jni_version_1_4)

			create l_options.make_empty

			default_vm_args.set_options (l_options)

				-- Store attribute into local variable as `$' operator is safer on
				-- local variables and not on attributes.
			l_jvmp := jvmp
			err := c_jni_get_java_vm (envp, $l_jvmp)
			jvmp := l_jvmp

			if err < 0 then
				debug ("java_vm")
					io.error.putstring ("*** Failed to load JVM=")
					io.error.putint (err)
					io.error.new_line
				end

				create l_ex
				l_ex.raise ("Failed to load java VM")
			end
		end

feature {NONE} -- externals

	c_jni_get_java_vm (env: POINTER; java_vm: POINTER): INTEGER
		external
			"C++ JNIEnv signature (JavaVM **): int use %"jni.h%""
		alias
			"GetJavaVM"
		end

end
