
help:
	# install

install: css/cssreset-min.css

css/cssreset-min.css:
	curl http://yui.yahooapis.com/3.18.1/build/cssreset/cssreset-min.css -o css/cssreset-min.css

clean:
	rm css/cssreset-min.css
