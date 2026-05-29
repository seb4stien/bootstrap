@default:
	just --list

install-npm:
	#!/usr/bin/env bash
	if test ! -e /home/ubuntu/.nvm/versions/node/v26.1.0/bin/npm; then
		curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash
		nvm install node
	fi

install-chrome:
	test -e /usr/bin/google-chrome || sudo dpkg -i ~/work/_artifacts/google-chrome-stable_current_amd64.deb

install-uv:
	sudo snap install astral-uv --classic
	uv tool install tox --with tox-uv # use uv to install

install-concierge profile:
	sudo snap install concierge --classic
	concierge prepare -p {{profile}}

install-copilot: install-npm install-chrome
	sudo apt --fix-broken install -y
	npm install -g @github/copilot

install-claude:
	curl -fsSL https://claude.ai/install.sh | bash

install-gh:
	sudo snap install gh --classic

config-copilot:
	copilot mcp add langchain-doc https://docs.langchain.com/mcp

config-langchain:
	npx skills add langchain-ai/langchain-skills --skill '*' --yes --global

