/*
File name: Z:\home\epha\Downloads\gc_project_post.sql
Creation date: 12/28/2020
Created by MySQL to PostgreSQL 5.3 [Demo]
--------------------------------------------------
More conversion tools at http://www.convert-in.com
*/
set client_encoding to 'UTF8';

/*
Table structure for table 'public.Addresses'
*/

DROP TABLE IF EXISTS "public"."Addresses" CASCADE;
CREATE UNLOGGED TABLE "public"."Addresses" ("id" SERIAL NOT NULL, "kebele" VARCHAR(255)  NOT NULL, "subcity" VARCHAR(255)  NOT NULL, "city" VARCHAR(255)  NOT NULL, "wereda" VARCHAR(255)  NOT NULL, "zone" VARCHAR(255)  NOT NULL, "state" VARCHAR(255)  NOT NULL, "createdAt" TIMESTAMP, "updatedAt" TIMESTAMP, "UserId" INTEGER) ;
ALTER SEQUENCE "public"."Addresses_id_seq" RESTART WITH 1 INCREMENT BY 1;
DROP INDEX IF EXISTS "PRIMARY";
ALTER TABLE "public"."Addresses" ADD CONSTRAINT "PRIMARY" PRIMARY KEY ("id");
DROP INDEX IF EXISTS "UserId";
CREATE INDEX "UserId00000" ON "public"."Addresses" ("UserId");

/*
Dumping data for table 'public.Addresses'
*/


/*
Table structure for table 'public.Categories'
*/

DROP TABLE IF EXISTS "public"."Categories" CASCADE;
CREATE UNLOGGED TABLE "public"."Categories" ("id" SERIAL NOT NULL, "category" VARCHAR(255)  NOT NULL, "parent" INTEGER, "createdAt" TIMESTAMP, "updatedAt" TIMESTAMP) ;
ALTER SEQUENCE "public"."Categories_id_seq" RESTART WITH 10 INCREMENT BY 1;
DROP INDEX IF EXISTS "PRIMARY00000";
ALTER TABLE "public"."Categories" ADD CONSTRAINT "PRIMARY00000" PRIMARY KEY ("id");
DROP INDEX IF EXISTS "parent";
CREATE INDEX "parent00000" ON "public"."Categories" ("parent");

/*
Dumping data for table 'public.Categories'
*/

INSERT INTO "public"."Categories"("id", "category", "parent", "createdAt", "updatedAt") VALUES (1, 'Electronics', NULL, '2020-12-05 14:38:52', '2020-12-05 14:38:52');
INSERT INTO "public"."Categories"("id", "category", "parent", "createdAt", "updatedAt") VALUES (2, 'Mobile', 1, '2020-12-05 14:39:04', '2020-12-05 14:39:04');
INSERT INTO "public"."Categories"("id", "category", "parent", "createdAt", "updatedAt") VALUES (3, 'Furniture', NULL, '2020-12-08 09:52:01', '2020-12-08 09:52:01');
INSERT INTO "public"."Categories"("id", "category", "parent", "createdAt", "updatedAt") VALUES (4, 'Clothing', NULL, '2020-12-08 09:53:11', '2020-12-08 09:53:11');
INSERT INTO "public"."Categories"("id", "category", "parent", "createdAt", "updatedAt") VALUES (5, 'shoe', 4, '2020-12-08 09:54:32', '2020-12-08 09:54:32');
INSERT INTO "public"."Categories"("id", "category", "parent", "createdAt", "updatedAt") VALUES (6, 'shirt', 4, '2020-12-08 09:54:47', '2020-12-08 09:54:47');
INSERT INTO "public"."Categories"("id", "category", "parent", "createdAt", "updatedAt") VALUES (7, 'chair', 3, '2020-12-08 09:55:58', '2020-12-08 09:55:58');
INSERT INTO "public"."Categories"("id", "category", "parent", "createdAt", "updatedAt") VALUES (8, 'jacket', 4, '2020-12-08 09:57:17', '2020-12-08 09:57:17');
INSERT INTO "public"."Categories"("id", "category", "parent", "createdAt", "updatedAt") VALUES (9, 'accessories', 1, '2020-12-08 09:58:54', '2020-12-08 09:58:54');

/*
Table structure for table 'public.Comments'
*/

DROP TABLE IF EXISTS "public"."Comments" CASCADE;
CREATE UNLOGGED TABLE "public"."Comments" ("id" SERIAL NOT NULL, "comment" VARCHAR(255)  NOT NULL, "createdAt" TIMESTAMP, "updatedAt" TIMESTAMP, "UserId" INTEGER, "ProductId" INTEGER) ;
ALTER SEQUENCE "public"."Comments_id_seq" RESTART WITH 46 INCREMENT BY 1;
DROP INDEX IF EXISTS "PRIMARY00001";
ALTER TABLE "public"."Comments" ADD CONSTRAINT "PRIMARY00001" PRIMARY KEY ("id");
DROP INDEX IF EXISTS "UserId00000";
CREATE INDEX "UserId0000000000" ON "public"."Comments" ("UserId");
DROP INDEX IF EXISTS "ProductId";
CREATE INDEX "ProductId00000" ON "public"."Comments" ("ProductId");

/*
Dumping data for table 'public.Comments'
*/

INSERT INTO "public"."Comments"("id", "comment", "createdAt", "updatedAt", "UserId", "ProductId") VALUES (1, 'Test 7', '2020-12-07 16:17:31', '2020-12-07 16:17:31', 3, 5);
INSERT INTO "public"."Comments"("id", "comment", "createdAt", "updatedAt", "UserId", "ProductId") VALUES (2, 'Test 1', '2020-12-07 16:21:23', '2020-12-07 16:21:23', 21, 12);
INSERT INTO "public"."Comments"("id", "comment", "createdAt", "updatedAt", "UserId", "ProductId") VALUES (3, 'Test 2', '2020-12-07 16:21:35', '2020-12-07 16:21:35', 21, 12);
INSERT INTO "public"."Comments"("id", "comment", "createdAt", "updatedAt", "UserId", "ProductId") VALUES (4, 'Test 3', '2020-12-07 16:21:55', '2020-12-07 16:21:55', 21, 12);
INSERT INTO "public"."Comments"("id", "comment", "createdAt", "updatedAt", "UserId", "ProductId") VALUES (5, 'Hello 4', '2020-12-07 16:23:25', '2020-12-07 16:23:25', 21, 12);
INSERT INTO "public"."Comments"("id", "comment", "createdAt", "updatedAt", "UserId", "ProductId") VALUES (6, 'Hello 1', '2020-12-07 16:26:37', '2020-12-07 16:26:37', 21, 6);
INSERT INTO "public"."Comments"("id", "comment", "createdAt", "updatedAt", "UserId", "ProductId") VALUES (7, 'Hello Again', '2020-12-07 16:28:11', '2020-12-07 16:28:11', 21, 5);
INSERT INTO "public"."Comments"("id", "comment", "createdAt", "updatedAt", "UserId", "ProductId") VALUES (8, 'Hello 1', '2020-12-07 16:58:24', '2020-12-07 16:58:24', 21, 7);
INSERT INTO "public"."Comments"("id", "comment", "createdAt", "updatedAt", "UserId", "ProductId") VALUES (9, 'Hello Comment', '2020-12-07 17:27:06', '2020-12-07 17:27:06', 21, 6);
INSERT INTO "public"."Comments"("id", "comment", "createdAt", "updatedAt", "UserId", "ProductId") VALUES (10, 'Hello 1', '2020-12-07 17:27:34', '2020-12-07 17:27:34', 21, 6);
INSERT INTO "public"."Comments"("id", "comment", "createdAt", "updatedAt", "UserId", "ProductId") VALUES (15, 'Update Comment1 ', '2020-12-07 17:33:30', '2020-12-28 09:31:43', 20, 15);
INSERT INTO "public"."Comments"("id", "comment", "createdAt", "updatedAt", "UserId", "ProductId") VALUES (16, 'this is comments', '2020-12-07 21:12:53', '2020-12-07 21:12:53', 21, 5);
INSERT INTO "public"."Comments"("id", "comment", "createdAt", "updatedAt", "UserId", "ProductId") VALUES (17, 'hdhgsijr', '2020-12-07 22:29:32', '2020-12-07 22:29:32', 21, 6);
INSERT INTO "public"."Comments"("id", "comment", "createdAt", "updatedAt", "UserId", "ProductId") VALUES (18, 'hsugeef', '2020-12-07 22:29:56', '2020-12-07 22:29:56', 21, 6);
INSERT INTO "public"."Comments"("id", "comment", "createdAt", "updatedAt", "UserId", "ProductId") VALUES (19, 'hdkhed', '2020-12-07 22:33:00', '2020-12-07 22:33:00', 21, 6);
INSERT INTO "public"."Comments"("id", "comment", "createdAt", "updatedAt", "UserId", "ProductId") VALUES (20, 'tehhsihdgysijf', '2020-12-07 22:33:39', '2020-12-07 22:33:39', 21, 6);
INSERT INTO "public"."Comments"("id", "comment", "createdAt", "updatedAt", "UserId", "ProductId") VALUES (21, 'hello world', '2020-12-07 22:34:22', '2020-12-07 22:34:22', 21, 6);
INSERT INTO "public"."Comments"("id", "comment", "createdAt", "updatedAt", "UserId", "ProductId") VALUES (22, 'hello', '2020-12-07 22:35:01', '2020-12-07 22:35:01', 21, 5);
INSERT INTO "public"."Comments"("id", "comment", "createdAt", "updatedAt", "UserId", "ProductId") VALUES (23, 'stop', '2020-12-07 22:35:08', '2020-12-07 22:35:08', 21, 5);
INSERT INTO "public"."Comments"("id", "comment", "createdAt", "updatedAt", "UserId", "ProductId") VALUES (24, 'there there', '2020-12-07 22:35:31', '2020-12-07 22:35:31', 21, 5);
INSERT INTO "public"."Comments"("id", "comment", "createdAt", "updatedAt", "UserId", "ProductId") VALUES (25, 'Test 6', '2020-12-07 22:53:23', '2020-12-07 22:53:23', 21, 5);
INSERT INTO "public"."Comments"("id", "comment", "createdAt", "updatedAt", "UserId", "ProductId") VALUES (26, 'this is last one', '2020-12-07 23:02:57', '2020-12-07 23:02:57', 21, 5);
INSERT INTO "public"."Comments"("id", "comment", "createdAt", "updatedAt", "UserId", "ProductId") VALUES (27, 'stop', '2020-12-07 23:03:26', '2020-12-07 23:03:26', 21, 5);
INSERT INTO "public"."Comments"("id", "comment", "createdAt", "updatedAt", "UserId", "ProductId") VALUES (28, 'one more', '2020-12-07 23:04:24', '2020-12-07 23:04:24', 21, 10);
INSERT INTO "public"."Comments"("id", "comment", "createdAt", "updatedAt", "UserId", "ProductId") VALUES (29, 'one more', '2020-12-07 23:04:44', '2020-12-07 23:04:44', 21, 6);
INSERT INTO "public"."Comments"("id", "comment", "createdAt", "updatedAt", "UserId", "ProductId") VALUES (30, 'heloo', '2020-12-07 23:05:13', '2020-12-07 23:05:13', 21, 5);
INSERT INTO "public"."Comments"("id", "comment", "createdAt", "updatedAt", "UserId", "ProductId") VALUES (31, 'heeeeeey', '2020-12-07 23:05:29', '2020-12-07 23:05:29', 21, 5);
INSERT INTO "public"."Comments"("id", "comment", "createdAt", "updatedAt", "UserId", "ProductId") VALUES (32, 'erjdjsd', '2020-12-07 23:07:31', '2020-12-07 23:07:31', 21, 6);
INSERT INTO "public"."Comments"("id", "comment", "createdAt", "updatedAt", "UserId", "ProductId") VALUES (33, 'rerererrr', '2020-12-07 23:08:47', '2020-12-07 23:08:47', 21, 5);
INSERT INTO "public"."Comments"("id", "comment", "createdAt", "updatedAt", "UserId", "ProductId") VALUES (34, 'tejbbshkkd', '2020-12-07 23:11:04', '2020-12-07 23:11:04', 21, 6);
INSERT INTO "public"."Comments"("id", "comment", "createdAt", "updatedAt", "UserId", "ProductId") VALUES (35, 'from category section', '2020-12-07 23:12:56', '2020-12-07 23:12:56', 21, 5);
INSERT INTO "public"."Comments"("id", "comment", "createdAt", "updatedAt", "UserId", "ProductId") VALUES (36, 'hriiehhosrt', '2020-12-07 23:15:14', '2020-12-07 23:15:14', 21, 5);
INSERT INTO "public"."Comments"("id", "comment", "createdAt", "updatedAt", "UserId", "ProductId") VALUES (37, 'rjdhhe825684', '2020-12-07 23:16:56', '2020-12-07 23:16:56', 21, 5);
INSERT INTO "public"."Comments"("id", "comment", "createdAt", "updatedAt", "UserId", "ProductId") VALUES (38, 'Test 6', '2020-12-08 04:07:11', '2020-12-08 04:07:11', 21, 5);
INSERT INTO "public"."Comments"("id", "comment", "createdAt", "updatedAt", "UserId", "ProductId") VALUES (39, 'Test 6', '2020-12-08 04:07:14', '2020-12-08 04:07:14', 21, 5);
INSERT INTO "public"."Comments"("id", "comment", "createdAt", "updatedAt", "UserId", "ProductId") VALUES (40, 'Test 6', '2020-12-08 04:15:07', '2020-12-08 04:15:07', 21, 5);
INSERT INTO "public"."Comments"("id", "comment", "createdAt", "updatedAt", "UserId", "ProductId") VALUES (41, 'Test 6', '2020-12-08 04:36:21', '2020-12-08 04:36:21', 21, 5);
INSERT INTO "public"."Comments"("id", "comment", "createdAt", "updatedAt", "UserId", "ProductId") VALUES (42, 'Test 6', '2020-12-08 04:36:39', '2020-12-08 04:36:39', 21, 5);
INSERT INTO "public"."Comments"("id", "comment", "createdAt", "updatedAt", "UserId", "ProductId") VALUES (43, 'geuhejehhr', '2020-12-08 05:06:58', '2020-12-08 05:06:58', 21, 6);
INSERT INTO "public"."Comments"("id", "comment", "createdAt", "updatedAt", "UserId", "ProductId") VALUES (44, 'hdhjs', '2020-12-09 06:32:25', '2020-12-09 06:32:25', 21, 23);
INSERT INTO "public"."Comments"("id", "comment", "createdAt", "updatedAt", "UserId", "ProductId") VALUES (45, 'hdhhd', '2020-12-09 06:32:34', '2020-12-09 06:32:34', 21, 23);

/*
Table structure for table 'public.Images'
*/

DROP TABLE IF EXISTS "public"."Images" CASCADE;
CREATE UNLOGGED TABLE "public"."Images" ("id" SERIAL NOT NULL, "filename" VARCHAR(255)  NOT NULL, "createdAt" TIMESTAMP, "updatedAt" TIMESTAMP, "ProductId" INTEGER, "ProfileId" INTEGER) ;
ALTER SEQUENCE "public"."Images_id_seq" RESTART WITH 70 INCREMENT BY 1;
DROP INDEX IF EXISTS "PRIMARY00002";
ALTER TABLE "public"."Images" ADD CONSTRAINT "PRIMARY00002" PRIMARY KEY ("id");
DROP INDEX IF EXISTS "ProductId00000";
CREATE INDEX "ProductId0000000000" ON "public"."Images" ("ProductId");
DROP INDEX IF EXISTS "ProfileId";
CREATE INDEX "ProfileId00000" ON "public"."Images" ("ProfileId");

/*
Dumping data for table 'public.Images'
*/

INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (1, '1607179894211pixel 4a 4.webp', '2020-12-05 14:51:34', '2020-12-05 14:51:34', 5, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (2, '1607179894211pixel 4a 4.webp', '2020-12-05 14:51:34', '2020-12-05 14:51:34', 5, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (3, '1607179894211pixel 4a 3.webp', '2020-12-05 14:51:34', '2020-12-05 14:51:34', 5, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (4, '1607179894211pixel 4a 2.webp', '2020-12-05 14:51:34', '2020-12-05 14:51:34', 5, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (5, '1607179894211pixel 4a 1.webp', '2020-12-05 14:51:34', '2020-12-05 14:51:34', 5, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (6, '1607191279585iphone mini 12 4.webp', '2020-12-05 18:01:19', '2020-12-05 18:01:19', 6, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (7, '1607191279585iphone mini 12 3.webp', '2020-12-05 18:01:19', '2020-12-05 18:01:19', 6, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (8, '1607191279585iphone mini 12 12webp', '2020-12-05 18:01:19', '2020-12-05 18:01:19', 6, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (9, '1607191279586iphone mini 12 1.webp', '2020-12-05 18:01:19', '2020-12-05 18:01:19', 6, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (10, '1607192139546iphone 11 5.webp', '2020-12-05 18:15:39', '2020-12-05 18:15:39', 7, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (11, '1607192139546iphone 11 4.webp', '2020-12-05 18:15:39', '2020-12-05 18:15:39', 7, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (12, '1607192139547iphone 11 3.webp', '2020-12-05 18:15:39', '2020-12-05 18:15:39', 7, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (13, '1607192139548iphone 11 2.webp', '2020-12-05 18:15:39', '2020-12-05 18:15:39', 7, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (14, '1607192139548iphone 11 1.webp', '2020-12-05 18:15:39', '2020-12-05 18:15:39', 7, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (15, '1607192330516pixel 4a 4.webp', '2020-12-05 18:18:50', '2020-12-05 18:18:50', NULL, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (16, '1607192330516pixel 4a 4.webp', '2020-12-05 18:18:50', '2020-12-05 18:18:50', NULL, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (17, '1607192330516pixel 4a 3.webp', '2020-12-05 18:18:50', '2020-12-05 18:18:50', NULL, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (18, '1607192330517pixel 4a 2.webp', '2020-12-05 18:18:50', '2020-12-05 18:18:50', NULL, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (19, '1607192330518pixel 4a 1.webp', '2020-12-05 18:18:50', '2020-12-05 18:18:50', NULL, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (20, '1607192471430samsung s20 3.webp', '2020-12-05 18:21:11', '2020-12-05 18:21:11', 9, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (21, '1607192471433samsung s20 2.webp', '2020-12-05 18:21:11', '2020-12-05 18:21:11', 9, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (22, '1607193003959one plus 8 2.webp', '2020-12-05 18:30:03', '2020-12-05 18:30:03', 10, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (23, '1607193003959one plus 8.webp', '2020-12-05 18:30:03', '2020-12-05 18:30:03', 10, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (24, '1607194670301one plus 8 2.webp', '2020-12-05 18:57:50', '2020-12-05 18:57:50', NULL, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (25, '1607194670302one plus 8.webp', '2020-12-05 18:57:50', '2020-12-05 18:57:50', NULL, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (26, '1607196057221iphone 11 2.webp', '2020-12-05 19:20:57', '2020-12-05 19:20:57', 12, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (27, '1607196057223iphone 11 3.webp', '2020-12-05 19:20:57', '2020-12-05 19:20:57', 12, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (28, '1607196057223iphone 11 4.webp', '2020-12-05 19:20:57', '2020-12-05 19:20:57', 12, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (29, '1607196057224iphone 11.webp', '2020-12-05 19:20:57', '2020-12-05 19:20:57', 12, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (30, '1607197454593iphone 12 mini 3.webp', '2020-12-05 19:44:14', '2020-12-05 19:44:14', 13, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (31, '1607197933050iphone 11 5.webp', '2020-12-05 19:52:13', '2020-12-05 19:52:13', NULL, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (32, '1607197933050iphone 11 4.webp', '2020-12-05 19:52:13', '2020-12-05 19:52:13', NULL, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (33, '1607197933050iphone 11 3.webp', '2020-12-05 19:52:13', '2020-12-05 19:52:13', NULL, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (34, '1607197933051iphone 11 2.webp', '2020-12-05 19:52:13', '2020-12-05 19:52:13', NULL, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (35, '1607197933051iphone 11 1.webp', '2020-12-05 19:52:13', '2020-12-05 19:52:13', NULL, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (36, '1607200159585iphone mini 12 4.webp', '2020-12-05 20:29:19', '2020-12-05 20:29:19', 15, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (37, '1607200159587iphone mini 12 3.webp', '2020-12-05 20:29:19', '2020-12-05 20:29:19', 15, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (38, '1607200159587iphone mini 12 12webp', '2020-12-05 20:29:19', '2020-12-05 20:29:19', 15, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (39, '1607200349381pixel 4a 4webp', '2020-12-05 20:32:29', '2020-12-05 20:32:29', NULL, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (40, '1607200349381pixel 4a 4.webp', '2020-12-05 20:32:29', '2020-12-05 20:32:29', NULL, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (41, '1607200349381pixel 4a 3.webp', '2020-12-05 20:32:29', '2020-12-05 20:32:29', NULL, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (42, '1607200349382pixel 4a 2.webp', '2020-12-05 20:32:29', '2020-12-05 20:32:29', NULL, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (43, '1607200349382pixel 4a 1.webp', '2020-12-05 20:32:29', '2020-12-05 20:32:29', NULL, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (44, '1607200440636pixel 4a 4webp', '2020-12-05 20:34:00', '2020-12-05 20:34:00', 17, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (45, '1607200440636pixel 4a 4.webp', '2020-12-05 20:34:00', '2020-12-05 20:34:00', 17, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (46, '1607200440639pixel 4a 3.webp', '2020-12-05 20:34:00', '2020-12-05 20:34:00', 17, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (47, '1607200440640pixel 4a 2.webp', '2020-12-05 20:34:00', '2020-12-05 20:34:00', 17, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (48, '1607200440640pixel 4a 1.webp', '2020-12-05 20:34:00', '2020-12-05 20:34:00', 17, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (49, '1607274004427iphone 12 max 5.webp', '2020-12-06 17:00:04', '2020-12-06 17:00:04', NULL, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (50, '1607274004428iphone 12 max 4.webp', '2020-12-06 17:00:04', '2020-12-06 17:00:04', NULL, NULL);

/*
Table structure for table 'public.Orders'
*/

DROP TABLE IF EXISTS "public"."Orders" CASCADE;
CREATE UNLOGGED TABLE "public"."Orders" ("id" SERIAL NOT NULL, "status" SMALLINT, "confirmation_num" BIGINT, "subTotalPrice" REAL, "totalPrice" REAL, "createdAt" TIMESTAMP, "updatedAt" TIMESTAMP, "UserId" INTEGER) ;
ALTER SEQUENCE "public"."Orders_id_seq" RESTART WITH 31 INCREMENT BY 1;
DROP INDEX IF EXISTS "PRIMARY00003";
ALTER TABLE "public"."Orders" ADD CONSTRAINT "PRIMARY00003" PRIMARY KEY ("id");
DROP INDEX IF EXISTS "UserId00001";
CREATE INDEX "UserId0000100000" ON "public"."Orders" ("UserId");

/*
Dumping data for table 'public.Orders'
*/

INSERT INTO "public"."Orders"("id", "status", "confirmation_num", "subTotalPrice", "totalPrice", "createdAt", "updatedAt", "UserId") VALUES (5,true, 395864, 2.409990e+05, 2.771490e+05, '2020-12-08 06:02:27', '2020-12-08 06:02:27', NULL);
INSERT INTO "public"."Orders"("id", "status", "confirmation_num", "subTotalPrice", "totalPrice", "createdAt", "updatedAt", "UserId") VALUES (6,true, 770953, 2.409990e+05, 2.771490e+05, '2020-12-08 06:02:28', '2020-12-08 06:02:28', NULL);
INSERT INTO "public"."Orders"("id", "status", "confirmation_num", "subTotalPrice", "totalPrice", "createdAt", "updatedAt", "UserId") VALUES (7,true, 115742, 2.409990e+05, 2.771490e+05, '2020-12-08 06:04:32', '2020-12-08 06:04:32', NULL);
INSERT INTO "public"."Orders"("id", "status", "confirmation_num", "subTotalPrice", "totalPrice", "createdAt", "updatedAt", "UserId") VALUES (8,true, 791002, 2.409990e+05, 2.771490e+05, '2020-12-08 06:05:25', '2020-12-08 06:05:25', NULL);
INSERT INTO "public"."Orders"("id", "status", "confirmation_num", "subTotalPrice", "totalPrice", "createdAt", "updatedAt", "UserId") VALUES (9,true, 875310, 1.666500e+04, 1.916480e+04, '2020-12-08 08:42:35', '2020-12-08 08:42:35', NULL);
INSERT INTO "public"."Orders"("id", "status", "confirmation_num", "subTotalPrice", "totalPrice", "createdAt", "updatedAt", "UserId") VALUES (10,true, 184316, 8.033300e+04, 9.238300e+04, '2020-12-08 08:46:32', '2020-12-08 08:46:32', NULL);
INSERT INTO "public"."Orders"("id", "status", "confirmation_num", "subTotalPrice", "totalPrice", "createdAt", "updatedAt", "UserId") VALUES (11,true, 741904, 8.033300e+04, 9.238300e+04, '2020-12-08 08:47:50', '2020-12-08 08:47:50', NULL);
INSERT INTO "public"."Orders"("id", "status", "confirmation_num", "subTotalPrice", "totalPrice", "createdAt", "updatedAt", "UserId") VALUES (12,true, 442924, 1.436600e+04, 1.652090e+04, '2020-12-08 08:50:23', '2020-12-08 08:50:23', NULL);
INSERT INTO "public"."Orders"("id", "status", "confirmation_num", "subTotalPrice", "totalPrice", "createdAt", "updatedAt", "UserId") VALUES (13,true, 406200, 1.436600e+04, 1.652090e+04, '2020-12-08 08:54:24', '2020-12-08 08:54:24', NULL);
INSERT INTO "public"."Orders"("id", "status", "confirmation_num", "subTotalPrice", "totalPrice", "createdAt", "updatedAt", "UserId") VALUES (14,true, 908477, 1.436600e+04, 1.652090e+04, '2020-12-08 08:59:46', '2020-12-08 08:59:46', NULL);
INSERT INTO "public"."Orders"("id", "status", "confirmation_num", "subTotalPrice", "totalPrice", "createdAt", "updatedAt", "UserId") VALUES (15,true, 116146, 1.436600e+04, 1.652090e+04, '2020-12-08 09:02:23', '2020-12-08 09:02:23', NULL);
INSERT INTO "public"."Orders"("id", "status", "confirmation_num", "subTotalPrice", "totalPrice", "createdAt", "updatedAt", "UserId") VALUES (16,true, 685640, 1.436600e+04, 1.652090e+04, '2020-12-08 09:03:06', '2020-12-08 09:03:06', NULL);
INSERT INTO "public"."Orders"("id", "status", "confirmation_num", "subTotalPrice", "totalPrice", "createdAt", "updatedAt", "UserId") VALUES (17,true, 984205, 1.436600e+04, 1.652090e+04, '2020-12-08 09:07:26', '2020-12-08 09:07:26', NULL);
INSERT INTO "public"."Orders"("id", "status", "confirmation_num", "subTotalPrice", "totalPrice", "createdAt", "updatedAt", "UserId") VALUES (18,true, 367730, 1.436600e+04, 1.652090e+04, '2020-12-08 09:09:28', '2020-12-08 09:09:28', NULL);
INSERT INTO "public"."Orders"("id", "status", "confirmation_num", "subTotalPrice", "totalPrice", "createdAt", "updatedAt", "UserId") VALUES (19,true, 330396, 1.436600e+04, 1.652090e+04, '2020-12-08 09:09:52', '2020-12-08 09:09:52', NULL);
INSERT INTO "public"."Orders"("id", "status", "confirmation_num", "subTotalPrice", "totalPrice", "createdAt", "updatedAt", "UserId") VALUES (20,true, 811171, 1.436600e+04, 1.652090e+04, '2020-12-08 09:35:05', '2020-12-08 09:35:05', NULL);
INSERT INTO "public"."Orders"("id", "status", "confirmation_num", "subTotalPrice", "totalPrice", "createdAt", "updatedAt", "UserId") VALUES (21,true, 779167, 1.436600e+04, 1.652090e+04, '2020-12-08 09:35:33', '2020-12-08 09:35:33', NULL);
INSERT INTO "public"."Orders"("id", "status", "confirmation_num", "subTotalPrice", "totalPrice", "createdAt", "updatedAt", "UserId") VALUES (22,true, 50685, 1.436600e+04, 1.652090e+04, '2020-12-08 09:36:36', '2020-12-08 09:36:36', NULL);
INSERT INTO "public"."Orders"("id", "status", "confirmation_num", "subTotalPrice", "totalPrice", "createdAt", "updatedAt", "UserId") VALUES (23,true, 164000, 1.436600e+04, 1.652090e+04, '2020-12-08 09:37:34', '2020-12-08 09:37:34', NULL);
INSERT INTO "public"."Orders"("id", "status", "confirmation_num", "subTotalPrice", "totalPrice", "createdAt", "updatedAt", "UserId") VALUES (24,true, 121302, 1.436600e+04, 1.652090e+04, '2020-12-08 09:39:33', '2020-12-08 09:39:33', NULL);
INSERT INTO "public"."Orders"("id", "status", "confirmation_num", "subTotalPrice", "totalPrice", "createdAt", "updatedAt", "UserId") VALUES (25,true, 646266, 1.436600e+04, 1.652090e+04, '2020-12-08 09:39:53', '2020-12-08 09:39:53', NULL);
INSERT INTO "public"."Orders"("id", "status", "confirmation_num", "subTotalPrice", "totalPrice", "createdAt", "updatedAt", "UserId") VALUES (26,true, 750755, 1.436600e+04, 1.652090e+04, '2020-12-08 09:41:31', '2020-12-08 09:41:31', NULL);
INSERT INTO "public"."Orders"("id", "status", "confirmation_num", "subTotalPrice", "totalPrice", "createdAt", "updatedAt", "UserId") VALUES (27,true, 552322, 1.436600e+04, 1.652090e+04, '2020-12-08 09:42:13', '2020-12-08 09:42:13', NULL);
INSERT INTO "public"."Orders"("id", "status", "confirmation_num", "subTotalPrice", "totalPrice", "createdAt", "updatedAt", "UserId") VALUES (28,true, 95985, 1.436600e+04, 1.652090e+04, '2020-12-08 09:42:43', '2020-12-08 09:42:43', NULL);
INSERT INTO "public"."Orders"("id", "status", "confirmation_num", "subTotalPrice", "totalPrice", "createdAt", "updatedAt", "UserId") VALUES (29,true, 589997, 1.103300e+04, 1.268800e+04, '2020-12-08 11:52:54', '2020-12-08 11:52:54', 3);
INSERT INTO "public"."Orders"("id", "status", "confirmation_num", "subTotalPrice", "totalPrice", "createdAt", "updatedAt", "UserId") VALUES (30,true, 801503, 1.103300e+04, 1.268800e+04, '2020-12-08 11:54:54', '2020-12-08 11:54:54', 3);

/*
Table structure for table 'public.ProductOrders'
*/

DROP TABLE IF EXISTS "public"."ProductOrders" CASCADE;
CREATE UNLOGGED TABLE "public"."ProductOrders" ("createdAt" TIMESTAMP, "updatedAt" TIMESTAMP, "OrderId" INTEGER NOT NULL, "ProductId" INTEGER NOT NULL) ;
DROP INDEX IF EXISTS "PRIMARY00004";
ALTER TABLE "public"."ProductOrders" ADD CONSTRAINT "PRIMARY00004" PRIMARY KEY ("OrderId", "ProductId");
DROP INDEX IF EXISTS "ProductId00001";
CREATE INDEX "ProductId0000100000" ON "public"."ProductOrders" ("ProductId");

/*
Dumping data for table 'public.ProductOrders'
*/

INSERT INTO "public"."ProductOrders"("createdAt", "updatedAt", "OrderId", "ProductId") VALUES ('2020-12-08 06:02:27', '2020-12-08 06:02:27', 5, 5);
INSERT INTO "public"."ProductOrders"("createdAt", "updatedAt", "OrderId", "ProductId") VALUES ('2020-12-08 06:02:27', '2020-12-08 06:02:27', 5, 6);
INSERT INTO "public"."ProductOrders"("createdAt", "updatedAt", "OrderId", "ProductId") VALUES ('2020-12-08 06:02:27', '2020-12-08 06:02:27', 5, 7);
INSERT INTO "public"."ProductOrders"("createdAt", "updatedAt", "OrderId", "ProductId") VALUES ('2020-12-08 06:02:28', '2020-12-08 06:02:28', 6, 5);
INSERT INTO "public"."ProductOrders"("createdAt", "updatedAt", "OrderId", "ProductId") VALUES ('2020-12-08 06:02:28', '2020-12-08 06:02:28', 6, 6);
INSERT INTO "public"."ProductOrders"("createdAt", "updatedAt", "OrderId", "ProductId") VALUES ('2020-12-08 06:02:28', '2020-12-08 06:02:28', 6, 7);
INSERT INTO "public"."ProductOrders"("createdAt", "updatedAt", "OrderId", "ProductId") VALUES ('2020-12-08 06:04:32', '2020-12-08 06:04:32', 7, 5);
INSERT INTO "public"."ProductOrders"("createdAt", "updatedAt", "OrderId", "ProductId") VALUES ('2020-12-08 06:04:32', '2020-12-08 06:04:32', 7, 6);
INSERT INTO "public"."ProductOrders"("createdAt", "updatedAt", "OrderId", "ProductId") VALUES ('2020-12-08 06:04:32', '2020-12-08 06:04:32', 7, 7);
INSERT INTO "public"."ProductOrders"("createdAt", "updatedAt", "OrderId", "ProductId") VALUES ('2020-12-08 06:05:25', '2020-12-08 06:05:25', 8, 5);
INSERT INTO "public"."ProductOrders"("createdAt", "updatedAt", "OrderId", "ProductId") VALUES ('2020-12-08 06:05:25', '2020-12-08 06:05:25', 8, 6);
INSERT INTO "public"."ProductOrders"("createdAt", "updatedAt", "OrderId", "ProductId") VALUES ('2020-12-08 06:05:25', '2020-12-08 06:05:25', 8, 7);
INSERT INTO "public"."ProductOrders"("createdAt", "updatedAt", "OrderId", "ProductId") VALUES ('2020-12-08 08:42:36', '2020-12-08 08:42:36', 9, 5);
INSERT INTO "public"."ProductOrders"("createdAt", "updatedAt", "OrderId", "ProductId") VALUES ('2020-12-08 08:46:32', '2020-12-08 08:46:32', 10, 5);
INSERT INTO "public"."ProductOrders"("createdAt", "updatedAt", "OrderId", "ProductId") VALUES ('2020-12-08 08:46:32', '2020-12-08 08:46:32', 10, 6);
INSERT INTO "public"."ProductOrders"("createdAt", "updatedAt", "OrderId", "ProductId") VALUES ('2020-12-08 08:46:32', '2020-12-08 08:46:32', 10, 7);
INSERT INTO "public"."ProductOrders"("createdAt", "updatedAt", "OrderId", "ProductId") VALUES ('2020-12-08 08:47:50', '2020-12-08 08:47:50', 11, 5);
INSERT INTO "public"."ProductOrders"("createdAt", "updatedAt", "OrderId", "ProductId") VALUES ('2020-12-08 08:47:50', '2020-12-08 08:47:50', 11, 6);
INSERT INTO "public"."ProductOrders"("createdAt", "updatedAt", "OrderId", "ProductId") VALUES ('2020-12-08 08:47:50', '2020-12-08 08:47:50', 11, 7);
INSERT INTO "public"."ProductOrders"("createdAt", "updatedAt", "OrderId", "ProductId") VALUES ('2020-12-08 08:50:23', '2020-12-08 08:50:23', 12, 6);
INSERT INTO "public"."ProductOrders"("createdAt", "updatedAt", "OrderId", "ProductId") VALUES ('2020-12-08 08:50:23', '2020-12-08 08:50:23', 12, 7);
INSERT INTO "public"."ProductOrders"("createdAt", "updatedAt", "OrderId", "ProductId") VALUES ('2020-12-08 08:50:23', '2020-12-08 08:50:23', 12, 10);
INSERT INTO "public"."ProductOrders"("createdAt", "updatedAt", "OrderId", "ProductId") VALUES ('2020-12-08 08:54:24', '2020-12-08 08:54:24', 13, 6);
INSERT INTO "public"."ProductOrders"("createdAt", "updatedAt", "OrderId", "ProductId") VALUES ('2020-12-08 08:54:24', '2020-12-08 08:54:24', 13, 7);
INSERT INTO "public"."ProductOrders"("createdAt", "updatedAt", "OrderId", "ProductId") VALUES ('2020-12-08 08:54:24', '2020-12-08 08:54:24', 13, 10);
INSERT INTO "public"."ProductOrders"("createdAt", "updatedAt", "OrderId", "ProductId") VALUES ('2020-12-08 08:59:46', '2020-12-08 08:59:46', 14, 6);
INSERT INTO "public"."ProductOrders"("createdAt", "updatedAt", "OrderId", "ProductId") VALUES ('2020-12-08 08:59:46', '2020-12-08 08:59:46', 14, 7);
INSERT INTO "public"."ProductOrders"("createdAt", "updatedAt", "OrderId", "ProductId") VALUES ('2020-12-08 08:59:46', '2020-12-08 08:59:46', 14, 10);
INSERT INTO "public"."ProductOrders"("createdAt", "updatedAt", "OrderId", "ProductId") VALUES ('2020-12-08 09:02:23', '2020-12-08 09:02:23', 15, 6);
INSERT INTO "public"."ProductOrders"("createdAt", "updatedAt", "OrderId", "ProductId") VALUES ('2020-12-08 09:02:23', '2020-12-08 09:02:23', 15, 7);
INSERT INTO "public"."ProductOrders"("createdAt", "updatedAt", "OrderId", "ProductId") VALUES ('2020-12-08 09:02:23', '2020-12-08 09:02:23', 15, 10);
INSERT INTO "public"."ProductOrders"("createdAt", "updatedAt", "OrderId", "ProductId") VALUES ('2020-12-08 09:03:06', '2020-12-08 09:03:06', 16, 6);
INSERT INTO "public"."ProductOrders"("createdAt", "updatedAt", "OrderId", "ProductId") VALUES ('2020-12-08 09:03:06', '2020-12-08 09:03:06', 16, 7);
INSERT INTO "public"."ProductOrders"("createdAt", "updatedAt", "OrderId", "ProductId") VALUES ('2020-12-08 09:03:06', '2020-12-08 09:03:06', 16, 10);
INSERT INTO "public"."ProductOrders"("createdAt", "updatedAt", "OrderId", "ProductId") VALUES ('2020-12-08 09:07:26', '2020-12-08 09:07:26', 17, 6);
INSERT INTO "public"."ProductOrders"("createdAt", "updatedAt", "OrderId", "ProductId") VALUES ('2020-12-08 09:07:26', '2020-12-08 09:07:26', 17, 7);
INSERT INTO "public"."ProductOrders"("createdAt", "updatedAt", "OrderId", "ProductId") VALUES ('2020-12-08 09:07:26', '2020-12-08 09:07:26', 17, 10);
INSERT INTO "public"."ProductOrders"("createdAt", "updatedAt", "OrderId", "ProductId") VALUES ('2020-12-08 09:09:28', '2020-12-08 09:09:28', 18, 6);
INSERT INTO "public"."ProductOrders"("createdAt", "updatedAt", "OrderId", "ProductId") VALUES ('2020-12-08 09:09:28', '2020-12-08 09:09:28', 18, 7);
INSERT INTO "public"."ProductOrders"("createdAt", "updatedAt", "OrderId", "ProductId") VALUES ('2020-12-08 09:09:28', '2020-12-08 09:09:28', 18, 10);
INSERT INTO "public"."ProductOrders"("createdAt", "updatedAt", "OrderId", "ProductId") VALUES ('2020-12-08 09:09:52', '2020-12-08 09:09:52', 19, 6);
INSERT INTO "public"."ProductOrders"("createdAt", "updatedAt", "OrderId", "ProductId") VALUES ('2020-12-08 09:09:52', '2020-12-08 09:09:52', 19, 7);
INSERT INTO "public"."ProductOrders"("createdAt", "updatedAt", "OrderId", "ProductId") VALUES ('2020-12-08 09:09:52', '2020-12-08 09:09:52', 19, 10);
INSERT INTO "public"."ProductOrders"("createdAt", "updatedAt", "OrderId", "ProductId") VALUES ('2020-12-08 09:35:05', '2020-12-08 09:35:05', 20, 6);
INSERT INTO "public"."ProductOrders"("createdAt", "updatedAt", "OrderId", "ProductId") VALUES ('2020-12-08 09:35:05', '2020-12-08 09:35:05', 20, 7);
INSERT INTO "public"."ProductOrders"("createdAt", "updatedAt", "OrderId", "ProductId") VALUES ('2020-12-08 09:35:05', '2020-12-08 09:35:05', 20, 10);
INSERT INTO "public"."ProductOrders"("createdAt", "updatedAt", "OrderId", "ProductId") VALUES ('2020-12-08 09:35:33', '2020-12-08 09:35:33', 21, 6);
INSERT INTO "public"."ProductOrders"("createdAt", "updatedAt", "OrderId", "ProductId") VALUES ('2020-12-08 09:35:33', '2020-12-08 09:35:33', 21, 7);
INSERT INTO "public"."ProductOrders"("createdAt", "updatedAt", "OrderId", "ProductId") VALUES ('2020-12-08 09:35:33', '2020-12-08 09:35:33', 21, 10);
INSERT INTO "public"."ProductOrders"("createdAt", "updatedAt", "OrderId", "ProductId") VALUES ('2020-12-08 09:36:36', '2020-12-08 09:36:36', 22, 6);

/*
Table structure for table 'public.Products'
*/

DROP TABLE IF EXISTS "public"."Products" CASCADE;
CREATE UNLOGGED TABLE "public"."Products" ("id" SERIAL NOT NULL, "name" VARCHAR(255)  NOT NULL, "model" VARCHAR(255)  NOT NULL, "price" DOUBLE PRECISION, "quantity" INTEGER NOT NULL, "views" INTEGER DEFAULT 0, "createdAt" TIMESTAMP, "updatedAt" TIMESTAMP, "CategoryId" INTEGER, "SubCategoryId" INTEGER, "UserId" INTEGER, "shortDescription" VARCHAR(200)  NOT NULL, "fullDescription" TEXT NOT NULL, "sold" INTEGER DEFAULT 0) ;
ALTER SEQUENCE "public"."Products_id_seq" RESTART WITH 26 INCREMENT BY 1;
DROP INDEX IF EXISTS "PRIMARY00005";
ALTER TABLE "public"."Products" ADD CONSTRAINT "PRIMARY00005" PRIMARY KEY ("id");
DROP INDEX IF EXISTS "CategoryId";
CREATE INDEX "CategoryId00000" ON "public"."Products" ("CategoryId");
DROP INDEX IF EXISTS "SubCategoryId";
CREATE INDEX "SubCategoryId00000" ON "public"."Products" ("SubCategoryId");
DROP INDEX IF EXISTS "UserId00002";
CREATE INDEX "UserId0000200000" ON "public"."Products" ("UserId");

/*
Dumping data for table 'public.Products'
*/

INSERT INTO "public"."Products"("id", "name", "model", "price", "quantity", "views", "createdAt", "updatedAt", "CategoryId", "SubCategoryId", "UserId", "shortDescription", "fullDescription", "sold") VALUES (5, 'Pixel 4', '1607179894171pixel 4a 4webp', 3.3330000000000000e+03, 12, 506, '2020-12-05 14:51:34', '2020-12-09 10:18:58', 1, 2, 3, '', '', 1);
INSERT INTO "public"."Products"("id", "name", "model", "price", "quantity", "views", "createdAt", "updatedAt", "CategoryId", "SubCategoryId", "UserId", "shortDescription", "fullDescription", "sold") VALUES (6, 'Iphone 11 mini', '1607191279553iphone mini 12 4.webp', 3.2000000000000000e+03, 12, 466, '2020-12-05 18:01:19', '2020-12-28 13:38:14', 1, 2, 3, '', '', 10);
INSERT INTO "public"."Products"("id", "name", "model", "price", "quantity", "views", "createdAt", "updatedAt", "CategoryId", "SubCategoryId", "UserId", "shortDescription", "fullDescription", "sold") VALUES (7, 'Iphone 11', '1607192139523iphone 11 3.webp', 4.5000000000000000e+03, 12, 126, '2020-12-05 18:15:39', '2020-12-08 10:45:46', 1, 2, 3, '', '', 2);
INSERT INTO "public"."Products"("id", "name", "model", "price", "quantity", "views", "createdAt", "updatedAt", "CategoryId", "SubCategoryId", "UserId", "shortDescription", "fullDescription", "sold") VALUES (9, 'Samsung s20', '1607192471401samsung s20 3.webp', 5.0000000000000000e+03, 12, 48, '2020-12-05 18:21:11', '2020-12-11 09:58:20', 1, 2, 3, '', '', 0);
INSERT INTO "public"."Products"("id", "name", "model", "price", "quantity", "views", "createdAt", "updatedAt", "CategoryId", "SubCategoryId", "UserId", "shortDescription", "fullDescription", "sold") VALUES (10, 'One Plus', '1607193003946one plus 8.webp', 4.0000000000000000e+03, 12, 6, '2020-12-05 18:30:03', '2020-12-07 23:04:14', 1, 2, 3, '', '', 0);
INSERT INTO "public"."Products"("id", "name", "model", "price", "quantity", "views", "createdAt", "updatedAt", "CategoryId", "SubCategoryId", "UserId", "shortDescription", "fullDescription", "sold") VALUES (12, 'iphone 11', '1607196057194iphone 11.webp', 7.0000000000000000e+03, 12, 16, '2020-12-05 19:20:57', '2020-12-07 16:23:10', 1, 2, 3, '', '', 0);
INSERT INTO "public"."Products"("id", "name", "model", "price", "quantity", "views", "createdAt", "updatedAt", "CategoryId", "SubCategoryId", "UserId", "shortDescription", "fullDescription", "sold") VALUES (13, 'Pixel 4', '1607197454565iphone 12 mini 4.webp', 3.3330000000000000e+03, 0, 1, '2020-12-05 19:44:14', '2020-12-07 16:38:55', 1, 2, 3, '', '', 0);
INSERT INTO "public"."Products"("id", "name", "model", "price", "quantity", "views", "createdAt", "updatedAt", "CategoryId", "SubCategoryId", "UserId", "shortDescription", "fullDescription", "sold") VALUES (15, 'Pixel 4', '1607200159566iphone mini 12 4.webp', 3.3330000000000000e+03, 12, 7, '2020-12-05 20:29:19', '2020-12-07 17:33:23', 1, 2, 3, '', '', 0);
INSERT INTO "public"."Products"("id", "name", "model", "price", "quantity", "views", "createdAt", "updatedAt", "CategoryId", "SubCategoryId", "UserId", "shortDescription", "fullDescription", "sold") VALUES (17, 'Pixel 4', '1607200440614pixel 4a 3.webp', 3.3330000000000000e+03, 12, 1, '2020-12-05 20:34:00', '2020-12-06 08:35:31', 1, 2, 3, '', '      fullDescription,       fullDescription,       fullDescription', 0);
INSERT INTO "public"."Products"("id", "name", "model", "price", "quantity", "views", "createdAt", "updatedAt", "CategoryId", "SubCategoryId", "UserId", "shortDescription", "fullDescription", "sold") VALUES (19, 'Pixel 6', '1607410000166pixel 4a 3.webp', 4.0000000000000000e+03, 12, 2, '2020-12-08 06:46:40', '2020-12-19 06:11:38', 1, 2, 3, 'shortDescription
', '      fullDescription', 0);
INSERT INTO "public"."Products"("id", "name", "model", "price", "quantity", "views", "createdAt", "updatedAt", "CategoryId", "SubCategoryId", "UserId", "shortDescription", "fullDescription", "sold") VALUES (20, 'Model', 'chair.glb', 3.0000000000000000e+03, 12, 738, '2020-12-08 06:49:57', '2020-12-09 06:54:35', 3, 7, 3, '     shortDescription', '      fullDescription', 0);
INSERT INTO "public"."Products"("id", "name", "model", "price", "quantity", "views", "createdAt", "updatedAt", "CategoryId", "SubCategoryId", "UserId", "shortDescription", "fullDescription", "sold") VALUES (21, 'chair', '1607424190956chair.glb', 2.0000000000000000e+03, 12, 1413, '2020-12-08 10:43:10', '2020-12-09 06:29:40', 3, 7, 3, 'Short Description', 'Full description', 0);
INSERT INTO "public"."Products"("id", "name", "model", "price", "quantity", "views", "createdAt", "updatedAt", "CategoryId", "SubCategoryId", "UserId", "shortDescription", "fullDescription", "sold") VALUES (22, 'Computer Monitor', '1607491849299computer21.glb', 6.0000000000000000e+03, 8, 346, '2020-12-09 05:30:49', '2020-12-28 13:10:41', 1, 9, 3, 'Computer Monitor', 'Computer Monitor Computer Monitor Computer Monitor Computer Monitor Computer Monitor Computer Monitor', 0);
INSERT INTO "public"."Products"("id", "name", "model", "price", "quantity", "views", "createdAt", "updatedAt", "CategoryId", "SubCategoryId", "UserId", "shortDescription", "fullDescription", "sold") VALUES (23, 'Jacket', '1607492301923clothing2glb.glb', 1.0000000000000000e+03, 1, 990, '2020-12-09 05:38:21', '2020-12-09 06:49:25', 4, 8, 3, '      fullDescription', '      fullDescription      fullDescription      fullDescription      fullDescription      fullDescription      fullDescription      fullDescription      fullDescription      fullDescription      fullDescription', 0);
INSERT INTO "public"."Products"("id", "name", "model", "price", "quantity", "views", "createdAt", "updatedAt", "CategoryId", "SubCategoryId", "UserId", "shortDescription", "fullDescription", "sold") VALUES (25, 'chair', '1607493049599AnyConv.com__Chair.glb', 2.0000000000000000e+03, 12, 29, '2020-12-09 05:50:49', '2020-12-09 05:57:38', 3, 7, 3, 'table', 'table table it: 15it: 15it: 15it: 15it: 15it: 15it: 15 ', 0);

/*
Table structure for table 'public.Profiles'
*/

DROP TABLE IF EXISTS "public"."Profiles" CASCADE;
CREATE UNLOGGED TABLE "public"."Profiles" ("id" SERIAL NOT NULL, "first_name" VARCHAR(255)  NOT NULL, "last_name" VARCHAR(255)  NOT NULL, "email" VARCHAR(255) , "createdAt" TIMESTAMP, "updatedAt" TIMESTAMP, "UserId" INTEGER) ;
ALTER SEQUENCE "public"."Profiles_id_seq" RESTART WITH 17 INCREMENT BY 1;
DROP INDEX IF EXISTS "PRIMARY00006";
ALTER TABLE "public"."Profiles" ADD CONSTRAINT "PRIMARY00006" PRIMARY KEY ("id");
DROP INDEX IF EXISTS "UserId00003";
CREATE INDEX "UserId0000300000" ON "public"."Profiles" ("UserId");

/*
Dumping data for table 'public.Profiles'
*/

INSERT INTO "public"."Profiles"("id", "first_name", "last_name", "email", "createdAt", "updatedAt", "UserId") VALUES (1, 'Engu', 'Best', 'engu@gmail.com', '2020-12-05 14:09:16', '2020-12-05 14:09:16', NULL);
INSERT INTO "public"."Profiles"("id", "first_name", "last_name", "email", "createdAt", "updatedAt", "UserId") VALUES (2, 'engu', 'lishan', 'engu@astu.com', '2020-12-05 14:10:43', '2020-12-05 14:10:43', NULL);
INSERT INTO "public"."Profiles"("id", "first_name", "last_name", "email", "createdAt", "updatedAt", "UserId") VALUES (3, 'Test', 'Test Last', 'test@gmail.com', '2020-12-07 16:52:22', '2020-12-07 16:52:22', 8);
INSERT INTO "public"."Profiles"("id", "first_name", "last_name", "email", "createdAt", "updatedAt", "UserId") VALUES (4, 'ermi', 'kasa', 'test@gmail.com', '2020-12-07 16:53:54', '2020-12-07 16:53:54', 11);
INSERT INTO "public"."Profiles"("id", "first_name", "last_name", "email", "createdAt", "updatedAt", "UserId") VALUES (5, 'ermi', 'kasa', '', '2020-12-07 16:55:03', '2020-12-07 16:55:03', 12);
INSERT INTO "public"."Profiles"("id", "first_name", "last_name", "email", "createdAt", "updatedAt", "UserId") VALUES (6, 'ermi', 'kasa', '', '2020-12-07 17:24:47', '2020-12-07 17:24:47', NULL);
INSERT INTO "public"."Profiles"("id", "first_name", "last_name", "email", "createdAt", "updatedAt", "UserId") VALUES (7, 'ermi', 'kasa', '', '2020-12-07 17:35:09', '2020-12-07 17:35:09', 14);
INSERT INTO "public"."Profiles"("id", "first_name", "last_name", "email", "createdAt", "updatedAt", "UserId") VALUES (8, 'ermi', 'kasa', '', '2020-12-07 18:10:51', '2020-12-07 18:10:51', 15);
INSERT INTO "public"."Profiles"("id", "first_name", "last_name", "email", "createdAt", "updatedAt", "UserId") VALUES (9, 'ermi', 'kasa', '', '2020-12-07 18:13:14', '2020-12-07 18:13:14', 16);
INSERT INTO "public"."Profiles"("id", "first_name", "last_name", "email", "createdAt", "updatedAt", "UserId") VALUES (10, 'engu', 'lishan', 'engu@astu.com', '2020-12-07 21:09:13', '2020-12-07 21:09:13', NULL);
INSERT INTO "public"."Profiles"("id", "first_name", "last_name", "email", "createdAt", "updatedAt", "UserId") VALUES (11, 'Ephrem', 'Demelash', '', '2020-12-08 10:48:16', '2020-12-08 10:48:16', 3);
INSERT INTO "public"."Profiles"("id", "first_name", "last_name", "email", "createdAt", "updatedAt", "UserId") VALUES (12, 'Engu', 'Best', 'engu@gmail.com', '2020-12-08 11:54:24', '2020-12-08 11:54:24', 20);
INSERT INTO "public"."Profiles"("id", "first_name", "last_name", "email", "createdAt", "updatedAt", "UserId") VALUES (13, 'ermi', 'kasa', '', '2020-12-08 12:05:57', '2020-12-08 12:05:57', 21);
INSERT INTO "public"."Profiles"("id", "first_name", "last_name", "email", "createdAt", "updatedAt", "UserId") VALUES (14, 'Engu', 'Best', 'engu@gmail.com', '2020-12-24 16:42:10', '2020-12-24 16:42:10', NULL);
INSERT INTO "public"."Profiles"("id", "first_name", "last_name", "email", "createdAt", "updatedAt", "UserId") VALUES (15, 'Engu', 'Best', 'engu@gmail.com', '2020-12-24 16:44:03', '2020-12-24 16:44:03', 23);
INSERT INTO "public"."Profiles"("id", "first_name", "last_name", "email", "createdAt", "updatedAt", "UserId") VALUES (16, 'Engu', 'Best', 'engu@gmail.com', '2020-12-25 19:55:33', '2020-12-25 19:55:33', 24);

/*
Table structure for table 'public.Rates'
*/

DROP TABLE IF EXISTS "public"."Rates" CASCADE;
CREATE UNLOGGED TABLE "public"."Rates" ("id" SERIAL NOT NULL, "rating" INTEGER NOT NULL, "createdAt" TIMESTAMP, "updatedAt" TIMESTAMP, "CommentId" INTEGER, "ProductId" INTEGER, "UserId" INTEGER) ;
ALTER SEQUENCE "public"."Rates_id_seq" RESTART WITH 46 INCREMENT BY 1;
DROP INDEX IF EXISTS "PRIMARY00007";
ALTER TABLE "public"."Rates" ADD CONSTRAINT "PRIMARY00007" PRIMARY KEY ("id");
DROP INDEX IF EXISTS "CommentId";
CREATE INDEX "CommentId00000" ON "public"."Rates" ("CommentId");
DROP INDEX IF EXISTS "ProductId00002";
CREATE INDEX "ProductId0000200000" ON "public"."Rates" ("ProductId");
DROP INDEX IF EXISTS "UserId00004";
CREATE INDEX "UserId0000400000" ON "public"."Rates" ("UserId");



/*
Dumping data for table 'public.Rates'
*/

INSERT INTO "public"."Rates"("id", "rating", "createdAt", "updatedAt", "CommentId", "ProductId", "UserId") VALUES (1, 5, '2020-12-07 16:17:31', '2020-12-07 16:17:31', 1, 5, NULL);
INSERT INTO "public"."Rates"("id", "rating", "createdAt", "updatedAt", "CommentId", "ProductId", "UserId") VALUES (2, 4, '2020-12-07 16:21:23', '2020-12-07 16:21:23', 2, 12, NULL);
INSERT INTO "public"."Rates"("id", "rating", "createdAt", "updatedAt", "CommentId", "ProductId", "UserId") VALUES (3, 5, '2020-12-07 16:21:35', '2020-12-07 16:21:35', 3, 12, NULL);
INSERT INTO "public"."Rates"("id", "rating", "createdAt", "updatedAt", "CommentId", "ProductId", "UserId") VALUES (4, 3, '2020-12-07 16:21:55', '2020-12-07 16:21:55', 4, 12, NULL);
INSERT INTO "public"."Rates"("id", "rating", "createdAt", "updatedAt", "CommentId", "ProductId", "UserId") VALUES (5, 4, '2020-12-07 16:23:25', '2020-12-07 16:23:25', 5, 12, NULL);
INSERT INTO "public"."Rates"("id", "rating", "createdAt", "updatedAt", "CommentId", "ProductId", "UserId") VALUES (6, 5, '2020-12-07 16:26:37', '2020-12-07 16:26:37', 6, 6, NULL);
INSERT INTO "public"."Rates"("id", "rating", "createdAt", "updatedAt", "CommentId", "ProductId", "UserId") VALUES (7, 5, '2020-12-07 16:28:11', '2020-12-07 16:28:11', 7, 5, NULL);
INSERT INTO "public"."Rates"("id", "rating", "createdAt", "updatedAt", "CommentId", "ProductId", "UserId") VALUES (8, 4, '2020-12-07 16:58:24', '2020-12-07 16:58:24', 8, 7, NULL);
INSERT INTO "public"."Rates"("id", "rating", "createdAt", "updatedAt", "CommentId", "ProductId", "UserId") VALUES (9, 4, '2020-12-07 17:27:06', '2020-12-07 17:27:06', 9, 6, NULL);
INSERT INTO "public"."Rates"("id", "rating", "createdAt", "updatedAt", "CommentId", "ProductId", "UserId") VALUES (10, 0, '2020-12-07 17:27:34', '2020-12-07 17:27:34', 10, 6, NULL);
INSERT INTO "public"."Rates"("id", "rating", "createdAt", "updatedAt", "CommentId", "ProductId", "UserId") VALUES (11, 0, '2020-12-07 17:31:12', '2020-12-07 17:31:12', NULL, 5, NULL);
INSERT INTO "public"."Rates"("id", "rating", "createdAt", "updatedAt", "CommentId", "ProductId", "UserId") VALUES (12, 0, '2020-12-07 17:31:29', '2020-12-07 17:31:29', NULL, 10, NULL);
INSERT INTO "public"."Rates"("id", "rating", "createdAt", "updatedAt", "CommentId", "ProductId", "UserId") VALUES (13, 5, '2020-12-07 17:32:17', '2020-12-07 17:32:17', NULL, NULL, NULL);
INSERT INTO "public"."Rates"("id", "rating", "createdAt", "updatedAt", "CommentId", "ProductId", "UserId") VALUES (14, 4, '2020-12-07 17:33:16', '2020-12-07 17:33:16', NULL, NULL, NULL);
INSERT INTO "public"."Rates"("id", "rating", "createdAt", "updatedAt", "CommentId", "ProductId", "UserId") VALUES (15, 0, '2020-12-07 17:33:30', '2020-12-07 17:33:30', 15, 15, NULL);
INSERT INTO "public"."Rates"("id", "rating", "createdAt", "updatedAt", "CommentId", "ProductId", "UserId") VALUES (16, 1, '2020-12-07 21:12:53', '2020-12-07 21:12:53', 16, 5, NULL);
INSERT INTO "public"."Rates"("id", "rating", "createdAt", "updatedAt", "CommentId", "ProductId", "UserId") VALUES (17, 1, '2020-12-07 22:29:32', '2020-12-07 22:29:32', 17, 6, NULL);
INSERT INTO "public"."Rates"("id", "rating", "createdAt", "updatedAt", "CommentId", "ProductId", "UserId") VALUES (18, 1, '2020-12-07 22:29:56', '2020-12-07 22:29:56', 18, 6, NULL);
INSERT INTO "public"."Rates"("id", "rating", "createdAt", "updatedAt", "CommentId", "ProductId", "UserId") VALUES (19, 1, '2020-12-07 22:33:01', '2020-12-07 22:33:01', 19, 6, NULL);
INSERT INTO "public"."Rates"("id", "rating", "createdAt", "updatedAt", "CommentId", "ProductId", "UserId") VALUES (20, 1, '2020-12-07 22:33:39', '2020-12-07 22:33:39', 20, 6, NULL);
INSERT INTO "public"."Rates"("id", "rating", "createdAt", "updatedAt", "CommentId", "ProductId", "UserId") VALUES (21, 1, '2020-12-07 22:34:22', '2020-12-07 22:34:22', 21, 6, NULL);
INSERT INTO "public"."Rates"("id", "rating", "createdAt", "updatedAt", "CommentId", "ProductId", "UserId") VALUES (22, 1, '2020-12-07 22:35:01', '2020-12-07 22:35:01', 22, 5, NULL);
INSERT INTO "public"."Rates"("id", "rating", "createdAt", "updatedAt", "CommentId", "ProductId", "UserId") VALUES (23, 1, '2020-12-07 22:35:08', '2020-12-07 22:35:08', 23, 5, NULL);
INSERT INTO "public"."Rates"("id", "rating", "createdAt", "updatedAt", "CommentId", "ProductId", "UserId") VALUES (24, 1, '2020-12-07 22:35:31', '2020-12-07 22:35:31', 24, 5, NULL);
INSERT INTO "public"."Rates"("id", "rating", "createdAt", "updatedAt", "CommentId", "ProductId", "UserId") VALUES (25, 5, '2020-12-07 22:53:23', '2020-12-07 22:53:23', 25, 5, NULL);
INSERT INTO "public"."Rates"("id", "rating", "createdAt", "updatedAt", "CommentId", "ProductId", "UserId") VALUES (26, 1, '2020-12-07 23:02:58', '2020-12-07 23:02:58', 26, 5, NULL);
INSERT INTO "public"."Rates"("id", "rating", "createdAt", "updatedAt", "CommentId", "ProductId", "UserId") VALUES (27, 1, '2020-12-07 23:03:26', '2020-12-07 23:03:26', 27, 5, NULL);
INSERT INTO "public"."Rates"("id", "rating", "createdAt", "updatedAt", "CommentId", "ProductId", "UserId") VALUES (28, 1, '2020-12-07 23:04:24', '2020-12-07 23:04:24', 28, 10, NULL);
INSERT INTO "public"."Rates"("id", "rating", "createdAt", "updatedAt", "CommentId", "ProductId", "UserId") VALUES (29, 1, '2020-12-07 23:04:44', '2020-12-07 23:04:44', 29, 6, NULL);
INSERT INTO "public"."Rates"("id", "rating", "createdAt", "updatedAt", "CommentId", "ProductId", "UserId") VALUES (30, 1, '2020-12-07 23:05:13', '2020-12-07 23:05:13', 30, 5, NULL);
INSERT INTO "public"."Rates"("id", "rating", "createdAt", "updatedAt", "CommentId", "ProductId", "UserId") VALUES (31, 1, '2020-12-07 23:05:29', '2020-12-07 23:05:29', 31, 5, NULL);
INSERT INTO "public"."Rates"("id", "rating", "createdAt", "updatedAt", "CommentId", "ProductId", "UserId") VALUES (32, 1, '2020-12-07 23:07:31', '2020-12-07 23:07:31', 32, 6, NULL);
INSERT INTO "public"."Rates"("id", "rating", "createdAt", "updatedAt", "CommentId", "ProductId", "UserId") VALUES (33, 1, '2020-12-07 23:08:47', '2020-12-07 23:08:47', 33, 5, NULL);
INSERT INTO "public"."Rates"("id", "rating", "createdAt", "updatedAt", "CommentId", "ProductId", "UserId") VALUES (34, 1, '2020-12-07 23:11:04', '2020-12-07 23:11:04', 34, 6, NULL);
INSERT INTO "public"."Rates"("id", "rating", "createdAt", "updatedAt", "CommentId", "ProductId", "UserId") VALUES (35, 1, '2020-12-07 23:12:56', '2020-12-07 23:12:56', 35, 5, NULL);
INSERT INTO "public"."Rates"("id", "rating", "createdAt", "updatedAt", "CommentId", "ProductId", "UserId") VALUES (36, 1, '2020-12-07 23:15:14', '2020-12-07 23:15:14', 36, 5, NULL);
INSERT INTO "public"."Rates"("id", "rating", "createdAt", "updatedAt", "CommentId", "ProductId", "UserId") VALUES (37, 1, '2020-12-07 23:16:56', '2020-12-07 23:16:56', 37, 5, NULL);
INSERT INTO "public"."Rates"("id", "rating", "createdAt", "updatedAt", "CommentId", "ProductId", "UserId") VALUES (38, 5, '2020-12-08 04:07:11', '2020-12-08 04:07:11', 38, 5, NULL);
INSERT INTO "public"."Rates"("id", "rating", "createdAt", "updatedAt", "CommentId", "ProductId", "UserId") VALUES (39, 5, '2020-12-08 04:07:14', '2020-12-08 04:07:14', 39, 5, NULL);
INSERT INTO "public"."Rates"("id", "rating", "createdAt", "updatedAt", "CommentId", "ProductId", "UserId") VALUES (40, 5, '2020-12-08 04:15:07', '2020-12-08 04:15:07', 40, 5, NULL);
INSERT INTO "public"."Rates"("id", "rating", "createdAt", "updatedAt", "CommentId", "ProductId", "UserId") VALUES (41, 5, '2020-12-08 04:36:21', '2020-12-08 04:36:21', 41, 5, NULL);
INSERT INTO "public"."Rates"("id", "rating", "createdAt", "updatedAt", "CommentId", "ProductId", "UserId") VALUES (42, 5, '2020-12-08 04:36:39', '2020-12-08 04:36:39', 42, 5, NULL);
INSERT INTO "public"."Rates"("id", "rating", "createdAt", "updatedAt", "CommentId", "ProductId", "UserId") VALUES (43, 1, '2020-12-08 05:06:58', '2020-12-08 05:06:58', 43, 6, NULL);
INSERT INTO "public"."Rates"("id", "rating", "createdAt", "updatedAt", "CommentId", "ProductId", "UserId") VALUES (44, 1, '2020-12-09 06:32:25', '2020-12-09 06:32:25', 44, 23, 21);
INSERT INTO "public"."Rates"("id", "rating", "createdAt", "updatedAt", "CommentId", "ProductId", "UserId") VALUES (45, 1, '2020-12-09 06:32:34', '2020-12-09 06:32:34', 45, 23, 21);

/*
Table structure for table 'public.Roles'
*/

DROP TABLE IF EXISTS "public"."Roles" CASCADE;
CREATE UNLOGGED TABLE "public"."Roles" ("id" SERIAL NOT NULL, "role" VARCHAR(24)  DEFAULT 'User' NOT NULL, "createdAt" TIMESTAMP, "updatedAt" TIMESTAMP) ;
ALTER SEQUENCE "public"."Roles_id_seq" RESTART WITH 5 INCREMENT BY 1;
DROP INDEX IF EXISTS "PRIMARY00008";
ALTER TABLE "public"."Roles" ADD CONSTRAINT "PRIMARY00008" PRIMARY KEY ("id");

/*
Dumping data for table 'public.Roles'
*/

INSERT INTO "public"."Roles"("id", "role", "createdAt", "updatedAt") VALUES (2, 'User', '2020-12-24 16:44:03', '2020-12-24 16:44:03');
INSERT INTO "public"."Roles"("id", "role", "createdAt", "updatedAt") VALUES (3, 'Admin', '2020-12-24 16:44:03', '2020-12-24 16:44:03');
INSERT INTO "public"."Roles"("id", "role", "createdAt", "updatedAt") VALUES (4, 'Operator', '2020-12-25 19:55:33', '2020-12-25 19:55:33');

/*
Table structure for table 'public.UserRoles'
*/

DROP TABLE IF EXISTS "public"."UserRoles" CASCADE;
CREATE UNLOGGED TABLE "public"."UserRoles" ("createdAt" TIMESTAMP, "updatedAt" TIMESTAMP, "RoleId" INTEGER NOT NULL, "UserId" INTEGER NOT NULL) ;
DROP INDEX IF EXISTS "PRIMARY00009";
ALTER TABLE "public"."UserRoles" ADD CONSTRAINT "PRIMARY00009" PRIMARY KEY ("RoleId", "UserId");
DROP INDEX IF EXISTS "UserId00005";
CREATE INDEX "UserId0000500000" ON "public"."UserRoles" ("UserId");

/*
Dumping data for table 'public.UserRoles'
*/

INSERT INTO "public"."UserRoles"("createdAt", "updatedAt", "RoleId", "UserId") VALUES ('2020-12-09', '2020-12-23', 2, 3);
INSERT INTO "public"."UserRoles"("createdAt", "updatedAt", "RoleId", "UserId") VALUES ('2020-12-09', '2020-12-23', 2, 7);
INSERT INTO "public"."UserRoles"("createdAt", "updatedAt", "RoleId", "UserId") VALUES ('2020-12-09', '2020-12-23', 2, 8);
INSERT INTO "public"."UserRoles"("createdAt", "updatedAt", "RoleId", "UserId") VALUES ('2020-12-09', '2020-12-23', 2, 9);
INSERT INTO "public"."UserRoles"("createdAt", "updatedAt", "RoleId", "UserId") VALUES ('2020-12-09', '2020-12-23', 2, 11);
INSERT INTO "public"."UserRoles"("createdAt", "updatedAt", "RoleId", "UserId") VALUES ('2020-12-09', '2020-12-23', 2, 12);
INSERT INTO "public"."UserRoles"("createdAt", "updatedAt", "RoleId", "UserId") VALUES ('2020-12-09', '2020-12-23', 2, 14);
INSERT INTO "public"."UserRoles"("createdAt", "updatedAt", "RoleId", "UserId") VALUES ('2020-12-09', '2020-12-23', 2, 15);
INSERT INTO "public"."UserRoles"("createdAt", "updatedAt", "RoleId", "UserId") VALUES ('2020-12-09', '2020-12-23', 2, 16);
INSERT INTO "public"."UserRoles"("createdAt", "updatedAt", "RoleId", "UserId") VALUES ('2020-12-09', '2020-12-23', 2, 20);
INSERT INTO "public"."UserRoles"("createdAt", "updatedAt", "RoleId", "UserId") VALUES ('2020-12-09', '2020-12-23', 2, 21);
INSERT INTO "public"."UserRoles"("createdAt", "updatedAt", "RoleId", "UserId") VALUES ('2020-12-24 16:44:03', '2020-12-24 16:44:03', 2, 23);
INSERT INTO "public"."UserRoles"("createdAt", "updatedAt", "RoleId", "UserId") VALUES ('2020-12-09', '2020-12-23', 3, 3);
INSERT INTO "public"."UserRoles"("createdAt", "updatedAt", "RoleId", "UserId") VALUES ('2020-12-09', '2020-12-23', 3, 20);
INSERT INTO "public"."UserRoles"("createdAt", "updatedAt", "RoleId", "UserId") VALUES ('2020-12-25 19:55:33', '2020-12-25 19:55:33', 4, 24);

/*
Table structure for table 'public.Users'
*/

DROP TABLE IF EXISTS "public"."Users" CASCADE;
CREATE UNLOGGED TABLE "public"."Users" ("id" SERIAL NOT NULL, "phone" VARCHAR(255)  NOT NULL, "status" SMALLINT DEFAULT 1, "password" VARCHAR(255)  NOT NULL, "tokenCount" INTEGER DEFAULT 0, "createdAt" TIMESTAMP, "updatedAt" TIMESTAMP, "username" VARCHAR(255)  NOT NULL) ;
ALTER SEQUENCE "public"."Users_id_seq" RESTART WITH 25 INCREMENT BY 1;
DROP INDEX IF EXISTS "PRIMARY00010";
ALTER TABLE "public"."Users" ADD CONSTRAINT "PRIMARY00010" PRIMARY KEY ("id");
DROP INDEX IF EXISTS "phone";
CREATE UNIQUE INDEX "phone00000" ON "public"."Users" ("phone");

/*
Dumping data for table 'public.Users'
*/

INSERT INTO "public"."Users"("id", "phone", "status", "password", "tokenCount", "createdAt", "updatedAt", "username") VALUES (3, '251994905126', 1, '$2a$10$TC1w3qnGoS4E2NMffVo0C.h5cfdBIhYOuIX.fm/1dvRozjtKod0ou', 0, '2020-12-08 10:48:16', '2020-12-25 20:07:26', 'ephrem123');
INSERT INTO "public"."Users"("id", "phone", "status", "password", "tokenCount", "createdAt", "updatedAt", "username") VALUES (7, '251932433955', 1, '$2a$10$TC1w3qnGoS4E2NMffVo0C.h5cfdBIhYOuIX.fm/1dvRozjtKod0ou', 0, '2020-12-07 16:49:15', '2020-12-07 16:49:15', 'engida');
INSERT INTO "public"."Users"("id", "phone", "status", "password", "tokenCount", "createdAt", "updatedAt", "username") VALUES (8, '09999999', 1, '$2a$10$k4Mv9YjLHFEYopuQ1QoLCuHtHYxEFAJgR5.ayhiq0BF.yn4WbuUeC', 0, '2020-12-07 16:52:22', '2020-12-07 16:52:22', 'test3');
INSERT INTO "public"."Users"("id", "phone", "status", "password", "tokenCount", "createdAt", "updatedAt", "username") VALUES (9, '09999991', 1, '$2a$10$r2o5y2VgdEM1R9h7eIsoSej7I2Mk9ULz6BMWIFpKukqYfGYF0ye/G', 0, '2020-12-07 16:53:23', '2020-12-07 16:53:23', 'test3');
INSERT INTO "public"."Users"("id", "phone", "status", "password", "tokenCount", "createdAt", "updatedAt", "username") VALUES (11, '0921202020', 1, '$2a$10$M6P5pnYkgdi0pnFDSmAWtuQHVvi51xsDpEh37pqWxNI37woK7UKWm', 0, '2020-12-07 16:53:54', '2020-12-07 16:53:54', 'ermi');
INSERT INTO "public"."Users"("id", "phone", "status", "password", "tokenCount", "createdAt", "updatedAt", "username") VALUES (12, '0921202021', 1, '$2a$10$ngm9OVY38BGfVfkM7MH54.MoS9vv7jb3m9aOCNx5tIjASAxUBq5H.', 0, '2020-12-07 16:55:03', '2020-12-07 16:55:03', 'ermi');
INSERT INTO "public"."Users"("id", "phone", "status", "password", "tokenCount", "createdAt", "updatedAt", "username") VALUES (14, '0925252525', 1, '$2a$10$do3.6Pl6TvVrcGbtNgg3XuYgRCGANDPwDb0BTIw8iom41enQ57kaS', 0, '2020-12-07 17:35:09', '2020-12-07 17:35:09', 'ermi200');
INSERT INTO "public"."Users"("id", "phone", "status", "password", "tokenCount", "createdAt", "updatedAt", "username") VALUES (15, '0913131313', 1, '$2a$10$YrVnA4swH6w9y.qy3GVmZeXlgoQQr1pFUeI/S/RWBkZrJmE1xpZwy', 0, '2020-12-07 18:10:51', '2020-12-07 18:10:51', 'ermi300');
INSERT INTO "public"."Users"("id", "phone", "status", "password", "tokenCount", "createdAt", "updatedAt", "username") VALUES (16, '0920555555', 1, '$2a$10$DzoiifKOooCceHdLt9DikOt4AzzzwhZx3UikZRO59.7.polqPRYBy', 0, '2020-12-07 18:13:14', '2020-12-07 18:13:14', 'ermi400');
INSERT INTO "public"."Users"("id", "phone", "status", "password", "tokenCount", "createdAt", "updatedAt", "username") VALUES (20, '251932433954', 1, '$2a$10$bWPsa07m/UON.f8x7o.Mv.38v50iAZ3A/5GDHUPSCTx9J.HsUNiDm', 0, '2020-12-08 11:54:24', '2020-12-08 11:54:24', 'engu4');
INSERT INTO "public"."Users"("id", "phone", "status", "password", "tokenCount", "createdAt", "updatedAt", "username") VALUES (21, '0920565549', 1, '$2a$10$Vu9V3OCvr9DTZMesOc6UkOAmTx63x6GcUNb0S.HPgoH6cGL9b//96', 0, '2020-12-08 12:05:57', '2020-12-08 12:05:57', 'ermi13');
INSERT INTO "public"."Users"("id", "phone", "status", "password", "tokenCount", "createdAt", "updatedAt", "username") VALUES (23, '0994905126', 1, '$2a$10$/jXREED3VJYQB.SJ2L2mDOwDE.vTcwNOxz2qpyiKl1i4hZWijKdBK', 0, '2020-12-24 16:44:03', '2020-12-24 16:44:03', 'engu123');
INSERT INTO "public"."Users"("id", "phone", "status", "password", "tokenCount", "createdAt", "updatedAt", "username") VALUES (24, '0994905125', 1, '$2a$10$DEEiD8JqUYKYEMHj/DSkV.eiIuEvkaJfI0aVykIkn3M/N0QP.yd6W', 0, '2020-12-25 19:55:33', '2020-12-25 19:55:33', 'engu5123');

/*
Table structure for table 'public.Wishlists'
*/

DROP TABLE IF EXISTS "public"."Wishlists" CASCADE;
CREATE UNLOGGED TABLE "public"."Wishlists" ("id" SERIAL NOT NULL, "createdAt" TIMESTAMP, "updatedAt" TIMESTAMP, "UserId" INTEGER, "ProductId" INTEGER) ;
ALTER SEQUENCE "public"."Wishlists_id_seq" RESTART WITH 21 INCREMENT BY 1;
DROP INDEX IF EXISTS "PRIMARY00011";
ALTER TABLE "public"."Wishlists" ADD CONSTRAINT "PRIMARY00011" PRIMARY KEY ("id");
DROP INDEX IF EXISTS "UserId00006";
CREATE INDEX "UserId0000600000" ON "public"."Wishlists" ("UserId");
DROP INDEX IF EXISTS "ProductId00003";
CREATE INDEX "ProductId0000300000" ON "public"."Wishlists" ("ProductId");

/*
Dumping data for table 'public.Wishlists'
*/

INSERT INTO "public"."Wishlists"("id", "createdAt", "updatedAt", "UserId", "ProductId") VALUES (19, '2020-12-11 12:48:01', '2020-12-11 12:48:01', 3, 21);
INSERT INTO "public"."Wishlists"("id", "createdAt", "updatedAt", "UserId", "ProductId") VALUES (20, '2020-12-28 09:44:18', '2020-12-28 09:44:18', 3, 5);


INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (1, '1607179894211pixel 4a 4.webp', '2020-12-05 14:51:34', '2020-12-05 14:51:34', 5, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (2, '1607179894211pixel 4a 4.webp', '2020-12-05 14:51:34', '2020-12-05 14:51:34', 5, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (3, '1607179894211pixel 4a 3.webp', '2020-12-05 14:51:34', '2020-12-05 14:51:34', 5, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (4, '1607179894211pixel 4a 2.webp', '2020-12-05 14:51:34', '2020-12-05 14:51:34', 5, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (5, '1607179894211pixel 4a 1.webp', '2020-12-05 14:51:34', '2020-12-05 14:51:34', 5, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (6, '1607191279585iphone mini 12 4.webp', '2020-12-05 18:01:19', '2020-12-05 18:01:19', 6, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (7, '1607191279585iphone mini 12 3.webp', '2020-12-05 18:01:19', '2020-12-05 18:01:19', 6, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (8, '1607191279585iphone mini 12 12webp', '2020-12-05 18:01:19', '2020-12-05 18:01:19', 6, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (9, '1607191279586iphone mini 12 1.webp', '2020-12-05 18:01:19', '2020-12-05 18:01:19', 6, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (10, '1607192139546iphone 11 5.webp', '2020-12-05 18:15:39', '2020-12-05 18:15:39', 7, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (11, '1607192139546iphone 11 4.webp', '2020-12-05 18:15:39', '2020-12-05 18:15:39', 7, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (12, '1607192139547iphone 11 3.webp', '2020-12-05 18:15:39', '2020-12-05 18:15:39', 7, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (13, '1607192139548iphone 11 2.webp', '2020-12-05 18:15:39', '2020-12-05 18:15:39', 7, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (14, '1607192139548iphone 11 1.webp', '2020-12-05 18:15:39', '2020-12-05 18:15:39', 7, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (15, '1607192330516pixel 4a 4.webp', '2020-12-05 18:18:50', '2020-12-05 18:18:50', NULL, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (16, '1607192330516pixel 4a 4.webp', '2020-12-05 18:18:50', '2020-12-05 18:18:50', NULL, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (17, '1607192330516pixel 4a 3.webp', '2020-12-05 18:18:50', '2020-12-05 18:18:50', NULL, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (18, '1607192330517pixel 4a 2.webp', '2020-12-05 18:18:50', '2020-12-05 18:18:50', NULL, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (19, '1607192330518pixel 4a 1.webp', '2020-12-05 18:18:50', '2020-12-05 18:18:50', NULL, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (20, '1607192471430samsung s20 3.webp', '2020-12-05 18:21:11', '2020-12-05 18:21:11', 9, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (21, '1607192471433samsung s20 2.webp', '2020-12-05 18:21:11', '2020-12-05 18:21:11', 9, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (22, '1607193003959one plus 8 2.webp', '2020-12-05 18:30:03', '2020-12-05 18:30:03', 10, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (23, '1607193003959one plus 8.webp', '2020-12-05 18:30:03', '2020-12-05 18:30:03', 10, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (24, '1607194670301one plus 8 2.webp', '2020-12-05 18:57:50', '2020-12-05 18:57:50', NULL, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (25, '1607194670302one plus 8.webp', '2020-12-05 18:57:50', '2020-12-05 18:57:50', NULL, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (26, '1607196057221iphone 11 2.webp', '2020-12-05 19:20:57', '2020-12-05 19:20:57', 12, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (27, '1607196057223iphone 11 3.webp', '2020-12-05 19:20:57', '2020-12-05 19:20:57', 12, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (28, '1607196057223iphone 11 4.webp', '2020-12-05 19:20:57', '2020-12-05 19:20:57', 12, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (29, '1607196057224iphone 11.webp', '2020-12-05 19:20:57', '2020-12-05 19:20:57', 12, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (30, '1607197454593iphone 12 mini 3.webp', '2020-12-05 19:44:14', '2020-12-05 19:44:14', 13, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (31, '1607197933050iphone 11 5.webp', '2020-12-05 19:52:13', '2020-12-05 19:52:13', NULL, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (32, '1607197933050iphone 11 4.webp', '2020-12-05 19:52:13', '2020-12-05 19:52:13', NULL, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (33, '1607197933050iphone 11 3.webp', '2020-12-05 19:52:13', '2020-12-05 19:52:13', NULL, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (34, '1607197933051iphone 11 2.webp', '2020-12-05 19:52:13', '2020-12-05 19:52:13', NULL, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (35, '1607197933051iphone 11 1.webp', '2020-12-05 19:52:13', '2020-12-05 19:52:13', NULL, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (36, '1607200159585iphone mini 12 4.webp', '2020-12-05 20:29:19', '2020-12-05 20:29:19', 15, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (37, '1607200159587iphone mini 12 3.webp', '2020-12-05 20:29:19', '2020-12-05 20:29:19', 15, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (38, '1607200159587iphone mini 12 12webp', '2020-12-05 20:29:19', '2020-12-05 20:29:19', 15, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (39, '1607200349381pixel 4a 4webp', '2020-12-05 20:32:29', '2020-12-05 20:32:29', NULL, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (40, '1607200349381pixel 4a 4.webp', '2020-12-05 20:32:29', '2020-12-05 20:32:29', NULL, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (41, '1607200349381pixel 4a 3.webp', '2020-12-05 20:32:29', '2020-12-05 20:32:29', NULL, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (42, '1607200349382pixel 4a 2.webp', '2020-12-05 20:32:29', '2020-12-05 20:32:29', NULL, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (43, '1607200349382pixel 4a 1.webp', '2020-12-05 20:32:29', '2020-12-05 20:32:29', NULL, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (44, '1607200440636pixel 4a 4webp', '2020-12-05 20:34:00', '2020-12-05 20:34:00', 17, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (45, '1607200440636pixel 4a 4.webp', '2020-12-05 20:34:00', '2020-12-05 20:34:00', 17, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (46, '1607200440639pixel 4a 3.webp', '2020-12-05 20:34:00', '2020-12-05 20:34:00', 17, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (47, '1607200440640pixel 4a 2.webp', '2020-12-05 20:34:00', '2020-12-05 20:34:00', 17, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (48, '1607200440640pixel 4a 1.webp', '2020-12-05 20:34:00', '2020-12-05 20:34:00', 17, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (49, '1607274004427iphone 12 max 5.webp', '2020-12-06 17:00:04', '2020-12-06 17:00:04', NULL, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (50, '1607274004428iphone 12 max 4.webp', '2020-12-06 17:00:04', '2020-12-06 17:00:04', NULL, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (51, '1607274004428iphone 12 max 3.webp', '2020-12-06 17:00:04', '2020-12-06 17:00:04', NULL, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (52, '1607274004428iphone 12 max 2.webp', '2020-12-06 17:00:04', '2020-12-06 17:00:04', NULL, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (53, '1607274004429iphone 12 max.webp', '2020-12-06 17:00:04', '2020-12-06 17:00:04', NULL, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (54, '1607410000200pixel 4a 4.webp', '2020-12-08 06:46:40', '2020-12-08 06:46:40', 19, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (55, '1607410000201pixel 4a 3.webp', '2020-12-08 06:46:40', '2020-12-08 06:46:40', 19, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (56, '1607410000201pixel 4a 2.webp', '2020-12-08 06:46:40', '2020-12-08 06:46:40', 19, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (57, '1607410000201pixel 4a 1.webp', '2020-12-08 06:46:40', '2020-12-08 06:46:40', 19, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (58, '1607410198017iphone 12 max 5.webp', '2020-12-08 06:49:58', '2020-12-08 06:49:58', 20, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (59, '1607410198017iphone 12 max 4.webp', '2020-12-08 06:49:58', '2020-12-08 06:49:58', 20, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (60, '1607410198018iphone 12 max 3.webp', '2020-12-08 06:49:58', '2020-12-08 06:49:58', 20, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (61, '1607410198019iphone 12 max 2.webp', '2020-12-08 06:49:58', '2020-12-08 06:49:58', 20, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (62, '1607410198019iphone 12 max.webp', '2020-12-08 06:49:58', '2020-12-08 06:49:58', 20, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (63, '1607424191032Capture.JPG', '2020-12-08 10:43:11', '2020-12-08 10:43:11', 21, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (64, '1607491849364computer-monitor-isolated-on-white-600w-572664949.webp', '2020-12-09 05:30:49', '2020-12-09 05:30:49', 22, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (65, '1607491849364computer-600w-335658254.webp', '2020-12-09 05:30:49', '2020-12-09 05:30:49', 22, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (66, '1607491849365realistic-computer-monitor-screen-isolated-260nw-1363396547.webp', '2020-12-09 05:30:49', '2020-12-09 05:30:49', 22, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (67, '1607492301974Capture.JPG', '2020-12-09 05:38:21', '2020-12-09 05:38:21', 23, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (68, '1607492621362Capture.JPG', '2020-12-09 05:43:41', '2020-12-09 05:43:41', NULL, NULL);
INSERT INTO "public"."Images"("id", "filename", "createdAt", "updatedAt", "ProductId", "ProfileId") VALUES (69, '1607493049625Capture.JPG', '2020-12-09 05:50:49', '2020-12-09 05:50:49', 25, NULL);
