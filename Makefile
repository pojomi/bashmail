BIN_DIR=/usr/bin
BIN=bashmail

install: bashmail
	sudo cp $(BIN) $(BIN_DIR)/$(BIN)
