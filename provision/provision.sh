#! /bin/bash


function myecho()
{
    echo =========================================================  
}

sudo echo -e "[user]\n\tname = EasyEngine\n\temail = root@easyengine.com" > ~/.gitconfig 

myecho

wget -qO ee rt.cx/ee && sudo bash ee  || exit 1

myecho

sudo ee stack install || exit 1

myecho
# Rubygems update

if [ $(gem -v|grep '^2.') ]; then
    echo "gem installed"
else
    apt-get install -y ruby-dev
    echo "ruby-dev installed"
    echo "gem not installed"
    gem install rubygems-update
    update_rubygems
fi

# wordmove install
wordmove_install="$(gem list wordmove -i)"
if [ "$wordmove_install" = true ]; then
  echo "wordmove installed"
else
  echo "wordmove not installed"
  gem install wordmove

  wordmove_path="$(gem which wordmove | sed -s 's/.rb/\/deployer\/base.rb/')"
  if [  "$(grep yaml $wordmove_path)" ]; then


    echo "can require yaml"
  else
    echo "can't require yaml"
    echo "set require yaml"

    sed -i "7i require\ \'yaml\'" $wordmove_path

    echo "can require yaml"

  fi
fi


myecho