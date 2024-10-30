-- ----------------------------
-- Records of SGNC_DISPONIBILITY_ZONE
-- ----------------------------
BEGIN;
DO $$
    BEGIN
        IF NOT EXISTS (SELECT 1 FROM "sigesin"."SGNC_DISPONIBILITY_ZONE" WHERE "id" = 1) THEN
            INSERT INTO "sigesin"."SGNC_DISPONIBILITY_ZONE" ("id", "name", "type", "created_at", "deleted_at") VALUES (1, 'A', 'A', '2024-10-09 12:26:01', NULL);
        END IF;
        IF NOT EXISTS (SELECT 1 FROM "sigesin"."SGNC_DISPONIBILITY_ZONE" WHERE "id" = 2) THEN
            INSERT INTO "sigesin"."SGNC_DISPONIBILITY_ZONE" ("id", "name", "type", "created_at", "deleted_at") VALUES (2, 'B', 'B', '2024-10-09 12:27:33', NULL);
        END IF;
    END $$;
COMMIT;

-- ----------------------------
-- Records of SGNC_LAYER
-- ----------------------------
BEGIN;
DO $$
    BEGIN
        INSERT INTO "sigesin"."SGNC_LAYER" ("id", "name", "key", "created_at", "deleted_at")
        VALUES
            (2, 'Presentación', 'P', '2024-09-29 20:19:30.951706', NULL),
            (3, 'Procesamiento', 'R', '2024-09-29 20:19:30.951706', NULL),
            (4, 'Datos', 'D', '2024-10-02 15:43:20', NULL),
            (1, 'Acceso', 'A', '2024-09-29 20:19:30.951706', NULL),
            (5, 'Front Office', 'O', '2024-09-29 20:19:30.951706', NULL),
            (6, 'Seguridad Externa', 'E', '2024-10-02 16:03:44', NULL),
            (7, 'Seguridad Interna', 'I', '2024-10-02 16:04:23', NULL)
        ON CONFLICT ("id") DO NOTHING; -- Para evitar duplicados
    END $$;
COMMIT;

-- ----------------------------
-- Records of SGNC_MEMORY
-- ----------------------------
BEGIN;
DO $$
    BEGIN
        INSERT INTO "sigesin"."SGNC_MEMORY" ("id", "memory", "type", "created_at", "deleted_at")
        VALUES
            (1, 2, 'GB ', '2024-09-29 20:19:30.955384', NULL),
            (2, 4, 'GB ', '2024-09-29 20:19:30.955384', NULL),
            (3, 8, 'GB ', '2024-09-29 20:19:30.955384', NULL),
            (4, 16, 'GB ', '2024-09-29 20:19:30.955384', NULL),
            (5, 32, 'GB ', '2024-09-29 20:19:30.955384', NULL)
        ON CONFLICT ("id") DO NOTHING;
    END $$;
COMMIT;

-- ----------------------------
-- Records of SGNC_OPERATING_SYSTEM
-- ----------------------------
BEGIN;
DO $$
    BEGIN
        INSERT INTO "sigesin"."SGNC_OPERATING_SYSTEM" ("id", "name", "active", "created_at", "deleted_at")
        VALUES
            (2, 'REDHAT', 't', '2024-09-29 20:19:30.958561', NULL),
            (1, 'Ubuntu', 't', '2024-09-29 20:19:30.958561', NULL),
            (3, 'Microsoft', 't', '2024-09-29 20:19:30.958561', NULL)
        ON CONFLICT ("id") DO NOTHING;
    END $$;
COMMIT;

-- ----------------------------
-- Records of SGNC_PROTECTION
-- ----------------------------
-- (No data to insert for SGNC_PROTECTION as per the original script)
BEGIN;
COMMIT;

-- ----------------------------
-- Records of SGNC_TECNOLOGY
-- ----------------------------
BEGIN;
DO $$
    BEGIN
        INSERT INTO "sigesin"."SGNC_TECNOLOGY" ("id", "idOperateSystem", "name", "created_at", "deleted_at")
        VALUES
            (1, 1, 'UBUN', '2024-09-29 20:19:30.961637', NULL),
            (2, 2, 'OHSE', '2024-09-29 20:19:30.961637', NULL),
            (3, 2, 'OHSC', '2024-09-29 20:19:30.961637', NULL),
            (4, 2, 'OHSG', '2024-09-29 20:19:30.961637', NULL),
            (5, 3, 'WEBE', '2024-09-29 20:19:30.961637', NULL),
            (6, 3, 'WEBC', '2024-09-29 20:19:30.961637', NULL),
            (7, 3, 'WEBG', '2024-09-29 20:19:30.961637', NULL)
        ON CONFLICT ("id") DO NOTHING;
    END $$;
COMMIT;

-- ----------------------------
-- Records of SGNC_VCPU
-- ----------------------------
BEGIN;
DO $$
    BEGIN
        INSERT INTO "sigesin"."SGNC_VCPU" ("id", "capacity", "type", "created_at", "deleted_at")
        VALUES
            (1, 1, 'vCP', '2024-09-29 20:19:30.965675', NULL),
            (2, 2, 'vCP', '2024-09-29 20:19:30.965675', NULL),
            (3, 4, 'vCP', '2024-09-29 20:19:30.965675', NULL),
            (4, 6, 'vCP', '2024-09-29 20:19:30.965675', NULL),
            (5, 8, 'vCP', '2024-09-29 20:19:30.965675', NULL)
        ON CONFLICT ("id") DO NOTHING;
    END $$;
COMMIT;

-- ----------------------------
-- Records of SGNT_INSTANCE
-- ----------------------------
-- (No data to insert for SGNT_INSTANCE as per the original script)
BEGIN;
COMMIT;
