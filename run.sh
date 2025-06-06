set -eou pipefail
set -x

rm -rf KTBD-DZ || true
git clone https://github.com/glukhovsa/KTBD-DZ
cd KTBD-DZ

mkdir data && chmod a+rwx data

docker rm ais_sql_server.g ais.g || true
docker compose up --build --force-recreate
