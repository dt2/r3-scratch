rebol[]
foreach [cmd] [
	(words-of system)
	system/product
	system/version
	system/build
	system/platform
	( comment {versioncheck; if this returns true its the new one}
	  parse "abcd" [thru 2 (comment {Should position to "cd".}) "cd"])
][
	print [mold :cmd ":" mold do reduce[cmd]]
]


