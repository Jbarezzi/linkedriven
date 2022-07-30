CREATE TABLE states (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL
);

CREATE TABLE cities (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "stateId" INTEGER NOT NULL REFERENCES "states"("id")
);

CREATE TABLE customers (
    "id" SERIAL PRIMARY KEY,
    "fullName" TEXT NOT NULL,
    "cpf" VARCHAR(11) NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL
);

CREATE TYPE "phoneType" AS ENUM ('landline', 'mobile');
CREATE TABLE "customerPhones" (
    "id" SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
    "number" TEXT NOT NULL,
    "type" TEXT phoneType
);

CREATE TABLE "customerAdresses" (
    "id" SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL UNIQUE REFERENCES "customers"("id"),
    "street" TEXT NOT NULL,
    "number" TEXT NOT NULL,
    "complement" TEXT,
    "postalCode" TEXT NOT NULL,
    "cityId" INTEGER NOT NULL REFERENCES "cities"("id")
);

CREATE TABLE "bankAccount" (
    "id" SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL UNIQUE REFERENCES "customers"("id"),
    "accountNumber" TEXT NOT NULL,
    "agency" TEXT NOT NULL,
    "openDate" TIMESTAMP NOT NULL DEFAULT NOW(),
    "closeDate" TIMESTAMP DEFAULT NULL
);

CREATE TYPE "transactionType" AS ENUM ('deposit', 'withdraw');
CREATE TABLE "transactions" (
    "id" SERIAL PRIMARY KEY,
    "bankAccountId" INTEGER NOT NULL UNIQUE REFERENCES "bankAccount"("id"),
    "amount" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "type" TEXT transactionType,
    "time" TIME NOT NULL DEFAULT NOW(),
    "description" TEXT,
    "cancelled" BOOLEAN DEFAULT FALSE
);

CREATE TABLE "creditCards" (
    "id" SERIAL PRIMARY KEY,
    "bankAccountId" INTEGER NOT NULL UNIQUE REFERENCES "bankAccount"("id"),
    "name" TEXT NOT NULL,
    "number" TEXT NOT NULL,
    "securityCode" TEXT NOT NULL,
    "expirationMonth" VARCHAR(2) NOT NULL,
    "expirationYear" VARCHAR(4) NOT NULL,
    "password" TEXT NOT NULL,
    "limit" INTEGER NOT NULL
);