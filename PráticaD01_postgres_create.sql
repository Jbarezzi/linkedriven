CREATE TABLE "users" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL,
	CONSTRAINT "users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "products" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	"price" real NOT NULL,
	"main_picture" TEXT NOT NULL,
	"size_id" serial,
	"category_id" serial,
	"pictures_id" serial,
	CONSTRAINT "products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "clothes_categories" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	CONSTRAINT "clothes_categories_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "products_pictures" (
	"id" serial NOT NULL,
	"picture1" TEXT NOT NULL,
	"picture2" TEXT NOT NULL,
	"picture3" TEXT NOT NULL,
	"picture4" TEXT NOT NULL,
	CONSTRAINT "products_pictures_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "clothes_size" (
	"id" serial NOT NULL,
	"size" varchar(1) NOT NULL,
	CONSTRAINT "clothes_size_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "purchases" (
	"id" serial NOT NULL,
	"user_id" serial NOT NULL,
	"purchase_state" varchar(10) NOT NULL,
	"products_ids" TEXT NOT NULL,
	"purchase_date" timestamp with time zone NOT NULL,
	"delivery_adress" TEXT NOT NULL,
	CONSTRAINT "purchases_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "products" ADD CONSTRAINT "products_fk0" FOREIGN KEY ("size_id") REFERENCES "clothes_size"("id");
ALTER TABLE "products" ADD CONSTRAINT "products_fk1" FOREIGN KEY ("category_id") REFERENCES "clothes_categories"("id");
ALTER TABLE "products" ADD CONSTRAINT "products_fk2" FOREIGN KEY ("pictures_id") REFERENCES "products_pictures"("id");




ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk0" FOREIGN KEY ("user_id") REFERENCES "users"("id");







