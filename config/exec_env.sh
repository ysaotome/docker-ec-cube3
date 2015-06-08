echo "---------------------------------"
echo "START:Docker ec-cube3 exec_env.sh"
echo "---------------------------------"

a2enmod rewrite

alias sudo='sudo -E '

export PGUSER=${POSTGRES_ENV_POSTGRES_USER}
export PGPASSWORD=${POSTGRES_ENV_POSTGRES_PASSWORD}
export PGDATABASE=${POSTGRES_ENV_POSTGRES_DB}
export PGHOST=${POSTGRES_PORT_5432_TCP_ADDR}
export PGHOSTADDR=${POSTGRES_PORT_5432_TCP_ADDR}
export PGPORT=${POSTGRES_PORT_5432_TCP_PORT}


echo "---------------------------------"
env
echo "---------------------------------"
echo "---------------------------------"
alias
echo "---------------------------------"

echo "---------------------------------"
echo "END:Docker ec-cube3 exec_env.sh"
echo "---------------------------------"
