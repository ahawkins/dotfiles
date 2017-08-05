function ledger --wraps ledger
	switch "$argv[1]"
		case e
			eval $EDITOR $LIFE_DIR/finance/ledger.dat
		case bal
			command ledger \
				--collapse \
				bal
		case net
			command ledger \
				--collapse \
				-X USD \
				balance '^assets' '^liabilities'
		case usd
			command ledger \
				--collapse \
				-X USD \
				balance '^assets'
		case '*'
			command ledger $argv
	end
end
