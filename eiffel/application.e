note
	description : "java-example application root class"
	date        : "$Date$"
	revision    : "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
		local
			l_access:JAVA_ACCESS
			l_test:POINTER
		do
			-- Every class and feature to export in the .so file must be accessible from
			-- the application root class. If not, it will be discarted by the compiler.
			create l_access
			l_test := l_access.fibonacci_sequence (4)
			l_test := l_access.hello
		end

end
