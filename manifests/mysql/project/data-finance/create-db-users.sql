CREATE DATABASE approval DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;
CREATE DATABASE beatwallet_fundmental_service CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE DATABASE charge CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE DATABASE config_base CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE DATABASE sctx_data_product CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE DATABASE ssycm CHARACTER SET utf8 COLLATE utf8_general_ci;



GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP on approval.* to 'we-data-approve'@'%' IDENTIFIED BY 'PIcVrJgtEq4lrBUW96';
GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP on beatwallet_fundmental_service.* to 'we-data-approve'@'%';
GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP on charge.* to 'we-data-approve'@'%';
GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP on config_base.* to 'we-data-approve'@'%';
GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP on sctx_data_product.* to 'we-data-approve'@'%';
GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP on ssycm.* to 'we-data-approve'@'%';
