CREATE TABLE "files" (
	"id" serial NOT NULL,
	"filename" TEXT NOT NULL,
	"filepath" TEXT NOT NULL,
	"file_mode" integer NOT NULL,
	"file_lastmodified" TIME NOT NULL,
	"authors" VARCHAR(255) NOT NULL,
	"index.id" integer NOT NULL,
	CONSTRAINT files_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "findings" (
	"id" serial NOT NULL,
	"data_type" TEXT NOT NULL,
	"data" TEXT NOT NULL,
	"files.id" integer NOT NULL,
	CONSTRAINT findings_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "index" (
	"id" serial NOT NULL,
	"index_name" TEXT NOT NULL UNIQUE,
	"index_desc" TEXT NOT NULL,
	"customer_id" integer NOT NULL,
	CONSTRAINT index_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "customer" (
	"id" serial NOT NULL,
	"customer_name" TEXT NOT NULL UNIQUE,
	"customer_desc" TEXT NOT NULL,
	CONSTRAINT customer_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



ALTER TABLE "files" ADD CONSTRAINT "files_fk0" FOREIGN KEY ("index.id") REFERENCES "index"("id");

ALTER TABLE "findings" ADD CONSTRAINT "findings_fk0" FOREIGN KEY ("files.id") REFERENCES "files"("id");

ALTER TABLE "index" ADD CONSTRAINT "index_fk0" FOREIGN KEY ("customer_id") REFERENCES "customer"("id");


