all: install_os_dependencies install_npm_dependencies install_sbt setup_other_things

install_vagrant_plugins:
	@echo "Installing vagrant plugins"
	vagrant plugin install vagrant-berkshelf
	vagrant plugin install vagrant-omnibus
	vagrant plugin install vagrant-vbguest

install_os_dependencies:
	sudo apt-get install -y fontconfig libfontconfig1-dev libfreetype6 libfreetype6-dev

install_npm_dependencies:
	@echo "Installing npm global dependencies"
	sudo npm install -g phantomjs karma yo grunt-cli bower
	@echo "Fixing permissions"
	sudo chown -R vagrant ~/ && sudo chgrp -R vagrant ~/

install_sbt:
	@echo "Installing sbt"
	@wget http://scalasbt.artifactoryonline.com/scalasbt/sbt-native-packages/org/scala-sbt/sbt/0.12.4/sbt.tgz
	@tar xvzf sbt.tgz && mv sbt ~/ && mkdir ~/bin && ln -s ~/sbt/bin/sbt ~/bin/sbt && source ~/.profile
	@rm sbt.tgz

setup_other_things:
	cp global_gitconfig ~/.gitconfig

# npm install && bower install && grunt