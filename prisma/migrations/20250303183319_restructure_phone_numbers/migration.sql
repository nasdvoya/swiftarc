/*
  Warnings:

  - You are about to drop the column `tel_residencial` on the `Perfil` table. All the data in the column will be lost.
  - You are about to drop the column `tel_trabalho` on the `Perfil` table. All the data in the column will be lost.
  - You are about to drop the column `telemovel` on the `Perfil` table. All the data in the column will be lost.

*/
-- DropIndex
DROP INDEX "unique_non_null_tel_residencial";

-- DropIndex
DROP INDEX "unique_non_null_tel_trabalho";

-- DropIndex
DROP INDEX "unique_non_null_telemovel";

-- AlterTable
ALTER TABLE "Perfil" DROP COLUMN "tel_residencial",
DROP COLUMN "tel_trabalho",
DROP COLUMN "telemovel";

-- CreateTable
CREATE TABLE "PhoneNumber" (
    "id" TEXT NOT NULL,
    "number" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "perfilId" TEXT NOT NULL,

    CONSTRAINT "PhoneNumber_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "PhoneNumber_number_key" ON "PhoneNumber"("number");

-- AddForeignKey
ALTER TABLE "PhoneNumber" ADD CONSTRAINT "PhoneNumber_perfilId_fkey" FOREIGN KEY ("perfilId") REFERENCES "Perfil"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- RenameIndex
ALTER INDEX "unique_non_null_email" RENAME TO "Perfil_email_key";
