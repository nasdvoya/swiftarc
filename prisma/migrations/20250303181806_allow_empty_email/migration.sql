-- AlterTable
ALTER TABLE "Perfil" ALTER COLUMN "email" DROP NOT NULL;

-- RenameIndex
ALTER INDEX "Perfil_email_key" RENAME TO "unique_non_null_email";
