CREATE USER 'svc_vault'@'%' IDENTIFIED BY 'vault';
GRANT ALL PRIVILEGES ON *.* TO 'svc_vault'@'%';
SHOW GRANTS FOR 'svc_vault'@'%';
