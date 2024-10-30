-- ----------------------------
-- Table structure for SGNC_DISPONIBILITY_ZONE
-- ----------------------------
CREATE TABLE IF NOT EXISTS "sigesin"."SGNC_DISPONIBILITY_ZONE" (
                                                                   "id" int4 NOT NULL,
                                                                   "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
                                                                   "type" char(1) COLLATE "pg_catalog"."default" NOT NULL,
                                                                   "created_at" timestamp(6),
                                                                   "deleted_at" timestamp(6)
);
ALTER TABLE "sigesin"."SGNC_DISPONIBILITY_ZONE" OWNER TO <OWNER>;

-- ----------------------------
-- Table structure for SGNC_LAYER
-- ----------------------------
CREATE TABLE IF NOT EXISTS "sigesin"."SGNC_LAYER" (
                                                      "id" int4 NOT NULL,
                                                      "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
                                                      "key" char(1) COLLATE "pg_catalog"."default" NOT NULL,
                                                      "created_at" timestamp(6),
                                                      "deleted_at" timestamp(6)
);
ALTER TABLE "sigesin"."SGNC_LAYER" OWNER TO <OWNER>;

-- ----------------------------
-- Table structure for SGNC_MEMORY
-- ----------------------------
CREATE TABLE IF NOT EXISTS "sigesin"."SGNC_MEMORY" (
                                                       "id" int4 NOT NULL,
                                                       "memory" int2,
                                                       "type" char(3) COLLATE "pg_catalog"."default",
                                                       "created_at" timestamp(6),
                                                       "deleted_at" timestamp(6)
);
ALTER TABLE "sigesin"."SGNC_MEMORY" OWNER TO <OWNER>;

-- ----------------------------
-- Table structure for SGNC_OPERATING_SYSTEM
-- ----------------------------
CREATE TABLE IF NOT EXISTS "sigesin"."SGNC_OPERATING_SYSTEM" (
                                                                 "id" int4 NOT NULL,
                                                                 "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
                                                                 "active" bool,
                                                                 "created_at" timestamp(6),
                                                                 "deleted_at" timestamp(6)
);
ALTER TABLE "sigesin"."SGNC_OPERATING_SYSTEM" OWNER TO <OWNER>;

-- ----------------------------
-- Table structure for SGNC_PROTECTION
-- ----------------------------
CREATE TABLE IF NOT EXISTS "sigesin"."SGNC_PROTECTION" (
                                                           "id" int4 NOT NULL,
                                                           "name" varchar(100) COLLATE "pg_catalog"."default",
                                                           "key" char(1) COLLATE "pg_catalog"."default" NOT NULL,
                                                           "created_at" timestamp(6),
                                                           "deleted_at" timestamp(6)
);
ALTER TABLE "sigesin"."SGNC_PROTECTION" OWNER TO <OWNER>;

-- ----------------------------
-- Table structure for SGNC_TECNOLOGY
-- ----------------------------
CREATE TABLE IF NOT EXISTS "sigesin"."SGNC_TECNOLOGY" (
                                                          "id" int4 NOT NULL,
                                                          "idOperateSystem" int4 NOT NULL,
                                                          "name" char(4) COLLATE "pg_catalog"."default",
                                                          "created_at" timestamp(6),
                                                          "deleted_at" timestamp(6)
);
ALTER TABLE "sigesin"."SGNC_TECNOLOGY" OWNER TO <OWNER>;

-- ----------------------------
-- Table structure for SGNC_VCPU
-- ----------------------------
CREATE TABLE IF NOT EXISTS "sigesin"."SGNC_VCPU" (
                                                     "id" int4 NOT NULL,
                                                     "capacity" int4 NOT NULL,
                                                     "type" char(3) COLLATE "pg_catalog"."default" NOT NULL,
                                                     "created_at" timestamp(6),
                                                     "deleted_at" timestamp(6)
);
ALTER TABLE "sigesin"."SGNC_VCPU" OWNER TO <OWNER>;

-- ----------------------------
-- Table structure for SGNC_COMPONENT
-- ----------------------------
CREATE TABLE IF NOT EXISTS "sigesin"."SGNC_COMPONENT" (
                                                          "id" int4 NOT NULL,
                                                          "name" varchar(100),
                                                          "key" char(5),
                                                          "created_at" timestamp,
                                                          "deleted_at" timestamp
);
ALTER TABLE "sigesin"."SGNC_COMPONENT" OWNER TO <OWNER>;

-- ----------------------------
-- Table structure for SGNC_DATABASE_ENGINE
-- ----------------------------
CREATE TABLE IF NOT EXISTS "sigesin"."SGNC_DATABASE_ENGINE" (
                                                                "id" int4 NOT NULL,
                                                                "name" varchar(100),
                                                                "key" char(4),
                                                                "created_at" timestamp,
                                                                "deleted_at" timestamp
);
ALTER TABLE "sigesin"."SGNC_DATABASE_ENGINE" OWNER TO <OWNER>;

-- ----------------------------
-- Table structure for SGNC_DATA_CENTER
-- ----------------------------
CREATE TABLE IF NOT EXISTS "sigesin"."SGNC_DATA_CENTER" (
                                                            "id" int4 NOT NULL,
                                                            "name" varchar(100),
                                                            "key" char(2),
                                                            "created_at" timestamp,
                                                            "deleted_at" timestamp
);
ALTER TABLE "sigesin"."SGNC_DATA_CENTER" OWNER TO <OWNER>;

-- ----------------------------
-- Table structure for SGNC_DEPLOYMENT
-- ----------------------------
CREATE TABLE IF NOT EXISTS "sigesin"."SGNC_DEPLOYMENT" (
                                                           "id" int4 NOT NULL,
                                                           "name" varchar(100),
                                                           "key" char(3),
                                                           "created_at" timestamp,
                                                           "deleted_at" timestamp
);
ALTER TABLE "sigesin"."SGNC_DEPLOYMENT" OWNER TO <OWNER>;

-- ----------------------------
-- Table structure for SGNC_AUDIENCE
-- ----------------------------
CREATE TABLE IF NOT EXISTS "sigesin"."SGNC_AUDIENCE" (
                                                         "id" int4 NOT NULL,
                                                         "name" varchar(50),
                                                         "key" char(1),
                                                         "created_at" timestamp,
                                                         "deleted_at" timestamp
);
ALTER TABLE "sigesin"."SGNC_AUDIENCE" OWNER TO <OWNER>;

-- ----------------------------
-- Table structure for SGNC_SERVER_TYPE
-- ----------------------------
CREATE TABLE IF NOT EXISTS "sigesin"."SGNC_SERVER_TYPE" (
                                                            "id" int4 NOT NULL,
                                                            "name" varchar(100),
                                                            "key" char(1),
                                                            "created_at" timestamp,
                                                            "deleted_at" timestamp
);
ALTER TABLE "sigesin"."SGNC_SERVER_TYPE" OWNER TO <OWNER>;

-- ----------------------------
-- Table structure for SGNC_KUBERNET
-- ----------------------------
CREATE TABLE IF NOT EXISTS "sigesin"."SGNC_KUBERNET" (
                                                         "id" int4 NOT NULL,
                                                         "name" varchar(50),
                                                         "created_at" timestamp,
                                                         "deleted_at" timestamp
);
ALTER TABLE "sigesin"."SGNC_KUBERNET" OWNER TO <OWNER>;

-- ----------------------------
-- Table structure for SGNC_APPLICATION_NAME
-- ----------------------------
CREATE TABLE IF NOT EXISTS "sigesin"."SGNC_APPLICATION_NAME" (
                                                                 "id" int4 NOT NULL,
                                                                 "name" varchar(300),
                                                                 "key" char(3),
                                                                 "created_at" timestamp,
                                                                 "deleted_at" timestamp
);
ALTER TABLE "sigesin"."SGNC_APPLICATION_NAME" OWNER TO <OWNER>;

-- ----------------------------
-- Table structure for SGNT_INSTANCE
-- ----------------------------
CREATE TABLE IF NOT EXISTS "sigesin"."SGNT_INSTANCE" (
                                                         "id" int4 NOT NULL,
                                                         "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
                                                         "instance_no" int2 NOT NULL,
                                                         "idLayer" int4 NOT NULL,
                                                         "created_at" timestamp(6),
                                                         "updated_at" timestamp(6),
                                                         "deleted_at" timestamp(6),
                                                         "idVcpu" int4,
                                                         "idTecnology" int4,
                                                         "idDisponibility_zone" int4,
                                                         "idMemory" int4,
                                                         "application" varchar(255) COLLATE "pg_catalog"."default",
                                                         "spreadsheet" varchar(255) COLLATE "pg_catalog"."default",
                                                         "productive_ip" varchar(15) COLLATE "pg_catalog"."default",
                                                         "management_ip" varchar(15) COLLATE "pg_catalog"."default",
                                                         "public_ip" varchar(15) COLLATE "pg_catalog"."default"
);
ALTER TABLE "sigesin"."SGNT_INSTANCE" OWNER TO <OWNER>;

-- ----------------------------
-- Primary Key and Foreign Key constraints
-- ----------------------------
-- Borrar y crear claves primarias
ALTER TABLE "sigesin"."SGNC_DISPONIBILITY_ZONE" DROP CONSTRAINT IF EXISTS "SGNC_DISPONIBILITY_ZONE_pkey";
ALTER TABLE "sigesin"."SGNC_DISPONIBILITY_ZONE" ADD CONSTRAINT "SGNC_DISPONIBILITY_ZONE_pkey" PRIMARY KEY ("id");

ALTER TABLE "sigesin"."SGNC_LAYER" DROP CONSTRAINT IF EXISTS "SGNC_LAYER_pkey";
ALTER TABLE "sigesin"."SGNC_LAYER" ADD CONSTRAINT "SGNC_LAYER_pkey" PRIMARY KEY ("id");

ALTER TABLE "sigesin"."SGNC_MEMORY" DROP CONSTRAINT IF EXISTS "SGNC_MEMORY_pkey";
ALTER TABLE "sigesin"."SGNC_MEMORY" ADD CONSTRAINT "SGNC_MEMORY_pkey" PRIMARY KEY ("id");

ALTER TABLE "sigesin"."SGNC_OPERATING_SYSTEM" DROP CONSTRAINT IF EXISTS "SGNC_OPERATING_SYSTEM_pkey";
ALTER TABLE "sigesin"."SGNC_OPERATING_SYSTEM" ADD CONSTRAINT "SGNC_OPERATING_SYSTEM_pkey" PRIMARY KEY ("id");

ALTER TABLE "sigesin"."SGNC_PROTECTION" DROP CONSTRAINT IF EXISTS "pk_sgncprotection";
ALTER TABLE "sigesin"."SGNC_PROTECTION" ADD CONSTRAINT "pk_sgncprotection" PRIMARY KEY ("key");

ALTER TABLE "sigesin"."SGNC_TECNOLOGY" DROP CONSTRAINT IF EXISTS "SGNC_TECNOLOGY_pkey";
ALTER TABLE "sigesin"."SGNC_TECNOLOGY" ADD CONSTRAINT "SGNC_TECNOLOGY_pkey" PRIMARY KEY ("id");

ALTER TABLE "sigesin"."SGNC_VCPU" DROP CONSTRAINT IF EXISTS "SGNC_VCPU_pkey";
ALTER TABLE "sigesin"."SGNC_VCPU" ADD CONSTRAINT "SGNC_VCPU_pkey" PRIMARY KEY ("id");

ALTER TABLE "sigesin"."SGNT_INSTANCE" DROP CONSTRAINT IF EXISTS "SGNT_INSTANCE_pkey";
ALTER TABLE "sigesin"."SGNT_INSTANCE" ADD CONSTRAINT "SGNT_INSTANCE_pkey" PRIMARY KEY ("id");

-- Borrar y crear claves foráneas
ALTER TABLE "sigesin"."SGNC_TECNOLOGY" DROP CONSTRAINT IF EXISTS "fk_sgnc_operating_system_sgnt_tecnology";
ALTER TABLE "sigesin"."SGNC_TECNOLOGY" ADD CONSTRAINT "fk_sgnc_operating_system_sgnt_tecnology" FOREIGN KEY ("idOperateSystem") REFERENCES "sigesin"."SGNC_OPERATING_SYSTEM" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "sigesin"."SGNT_INSTANCE" DROP CONSTRAINT IF EXISTS "fk_sgnc_disponibility_zone_sgnt_instance";
ALTER TABLE "sigesin"."SGNT_INSTANCE" ADD CONSTRAINT "fk_sgnc_disponibility_zone_sgnt_instance" FOREIGN KEY ("idDisponibility_zone") REFERENCES "sigesin"."SGNC_DISPONIBILITY_ZONE" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "sigesin"."SGNT_INSTANCE" DROP CONSTRAINT IF EXISTS "fk_sgnc_layer_sgnt_instance";
ALTER TABLE "sigesin"."SGNT_INSTANCE" ADD CONSTRAINT "fk_sgnc_layer_sgnt_instance" FOREIGN KEY ("idLayer") REFERENCES "sigesin"."SGNC_LAYER" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "sigesin"."SGNT_INSTANCE" DROP CONSTRAINT IF EXISTS "fk_sgnc_memory_sgnt_instance";
ALTER TABLE "sigesin"."SGNT_INSTANCE" ADD CONSTRAINT "fk_sgnc_memory_sgnt_instance" FOREIGN KEY ("idMemory") REFERENCES "sigesin"."SGNC_MEMORY" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "sigesin"."SGNT_INSTANCE" DROP CONSTRAINT IF EXISTS "fk_sgnc_tecnology_sgnt_instance";
ALTER TABLE "sigesin"."SGNT_INSTANCE" ADD CONSTRAINT "fk_sgnc_tecnology_sgnt_instance" FOREIGN KEY ("idTecnology") REFERENCES "sigesin"."SGNC_TECNOLOGY" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "sigesin"."SGNT_INSTANCE" DROP CONSTRAINT IF EXISTS "fk_sgnc_vcpu_sgnt_instance";
ALTER TABLE "sigesin"."SGNT_INSTANCE" ADD CONSTRAINT "fk_sgnc_vcpu_sgnt_instance" FOREIGN KEY ("idVcpu") REFERENCES "sigesin"."SGNC_VCPU" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
