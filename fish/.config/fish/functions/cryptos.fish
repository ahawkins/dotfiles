function cryptos --description 'cryptocurrency helpers'
	switch "$argv[1]"
		case "e"
			eval $EDITOR ~/life/crypt/crypto_ledger.dat
		case portfolio
			command ledger \
				--file ~/life/crypt/crypto_ledger.dat \
				--strict \
				--collapse \
				bal '^assets' \
				| sed 's/Assets//g' \
				| sed 's/,//g' \
				| awk '{printf "%3s %14.8f\n",$1,$2}' \
				| crypto.rb portfolio
		case distribute
			command ledger \
				--file ~/life/crypt/crypto_ledger.dat \
				--strict \
				--collapse \
				bal '^assets' \
				| sed 's/Assets//g' \
				| sed 's/,//g' \
				| awk '{printf "%3s %14.8f\n",$1,$2}' \
				| crypto.rb distribute $argv[2..-1]
		case '*'
			echo "Unknown command $argv[1]" ^&1
			return 1
	end
end
