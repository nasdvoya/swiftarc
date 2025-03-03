/*
  Warnings:

  - A unique constraint covering the columns `[email]` on the table `Perfil` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[tel_residencial]` on the table `Perfil` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[tel_trabalho]` on the table `Perfil` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[telemovel]` on the table `Perfil` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "Perfil_email_key" ON "Perfil"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Perfil_tel_residencial_key" ON "Perfil"("tel_residencial");

-- CreateIndex
CREATE UNIQUE INDEX "Perfil_tel_trabalho_key" ON "Perfil"("tel_trabalho");

-- CreateIndex
CREATE UNIQUE INDEX "Perfil_telemovel_key" ON "Perfil"("telemovel");
