# rvm homepage :http://beginrescueend.com/
# rubyonrails homepage :http://rubyonrails.org/
# using gemset : http://beginrescueend.com/gemsets/using/
# js env : https://github.com/sstephenson/execjs
# heroku hosting : http://www.heroku.com/
# github repo : https://github.comlow
# gmate for gedit : https://github.com/gmate/gmate

# ruby dependencies
sudo apt-get install build-essential openssl libssl-dev libreadline6 libreadline6-dev curl
git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-0 libsqlite3-dev
sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev
automake libtool bison nodejs

# mysql-server if you need in your project
sudo apt-get install mysql-server
# for (mysql = mysql2 driver) support you need to install libmysqlclient-dev
sudo apt-get install libmysqlclient-dev 

bash < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer )
# rvm homepage http://beginrescueend.com/
# rails homepage
# append rvm to the env - in my case to .bashrc (ubuntu 11.+)
echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function' >> ~/.bashrc

#update env with source or close and reopen a new terminal
source .bashrc
#check rvm
type rvm | head -1

# overview
rvm list known
# install ruby 1.9.3
rvm install 1.9.3
 # use 1.9.3
 rvm use 1.9.3
# check aktiv ruby version
ruby -v
# set your version as default ruby env
rvm use 1.9.3 --default
# make a new gemset - more info about gemset -just use rvm gemset --help
# gemset for ror 3.2 with mysql2 support - the name ist ruby-1-8-7-ror31-mysql in my case
rvm gemset create ruby-1-9-3-ror32-mysql
# list gemset
rvm gemset list
# use the new gemset
rvm 1.9.3@ruby-1-9-3-ror32-mysql
# or use the use option
rvm gemset use ruby-1-9-3-ror32-mysql
# set the current gemset as default if you like
rvm use 1.9.3@ruby-1-9-3-ror32-mysql --default

# check the gemset list for the aktiv gemset
rvm gemset list
# install js,heroku, rails and mysql2..and more
# if you use 1.8.7 or 1.9.1 ruby - you need to run this first: 
# gem install rdoc-data; rdoc-data --install
# gem install execjs therubyracer mysql2 rails heroku
# goto home dir
cd ~
# create workspace folder
mkdir workspace
# go in
cd workspace
# create test RubyonRail 3.2 Project with mysql support
rails new TaskManager -d mysql
cd TaskManager
# update in the config folder the database.yml file (mysql connection string)
nano -w config/database.yml
# create the database
rake db:create
# run the new project
rails s
#open firefox and happy hacking
http://0.0.0.0:3000/

