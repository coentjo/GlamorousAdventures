Extension { #name : #Color }

{ #category : #'*PortfolioInsight' }
Color >> colorAdjustedForAge: anAge [
	| r g b factor |
	r := self red.
	g := self green.
	b := self blue.
	factor := 7 / 8.
	(anAge // 7) truncated timesRepeat: [
		r := r * factor.
		g := g * factor.
		b := b * factor ].
	^ Color r: r g: g b: b.
]
