TIMESTAMP=$(date +"%F-%H-%M-%S")
BACKUP_DIR="./backups"
CONTAINER_NAME="mysqlDB2"
DB_NAME="mysqlD2"  
DB_USER="root"   
DB_PASSWORD="1234"         


mkdir -p $BACKUP_DIR


docker exec $CONTAINER_NAME sh -c "mysqldump -u$DB_USER -p$DB_PASSWORD $DB_NAME" > "$BACKUP_DIR/vehiculos_backup_$TIMESTAMP.sql"


if [ $? -eq 0 ]; then
  echo "Backup completado: vehiculos_backup_$TIMESTAMP.sql"
else
  echo "Error al crear el backup"
  exit 1
fi