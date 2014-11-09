note
	description: "Summary description for {JAVA_ACCESS}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	JAVA_ACCESS

feature -- Access

	hello:POINTER
			-- A C text to get when you want a {STRING} from Eiffel
		local
			l_c_result:C_STRING
		do
			create l_c_result.make ("Hello from Eiffel")
			Result := l_c_result.item
		end

	fibonacci_sequence(a_number:INTEGER):POINTER
			-- The `a_number' first element of the fibonnacie sequence
		local
			l_list:ARRAYED_LIST[INTEGER]
			l_last1, l_last2, l_temp, l_count:INTEGER
			l_result:ANY
		do
			create l_list.make (a_number)
			l_last1 := 0
			l_last2 := 1
			if a_number >0 then
				l_list.extend (l_last1)
				if a_number > 1 then
					l_list.extend (l_last2)
					from
						l_count := 3
					until
						l_count > a_number
					loop
						l_temp := l_last2
						l_last2 := l_last2 + l_last1
						l_last1 := l_temp
						l_list.extend (l_last2)
						l_count := l_count + 1
					end
				end
			end
			l_result := l_list.to_array.to_c
			Result := $l_result
		end


end
