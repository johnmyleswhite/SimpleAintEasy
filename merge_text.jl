#!/usr/bin/env julia

sections = [
	joinpath("text", "supporting", "front.md"),
	joinpath("text", "median", "001.md"),
	joinpath("text", "median", "002.md"),
]

io = open("book.md", "w")

i = 0
n = length(sections)

for section in sections
	i += 1
	text = readall(section)
	print(io, text)
	if i != n
		print(io, "\n\n")
		print(io, "---")
		print(io, "\n\n")
	end
end

close(io)
