-- CreateTable
CREATE TABLE "Perfil" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "horario" TEXT,
    "doador" BOOLEAN NOT NULL DEFAULT false,
    "local_cobranca" TEXT,
    "morada" TEXT,
    "freguesia" TEXT,
    "concelho" TEXT,
    "codigo_postal" TEXT,
    "tel_residencial" TEXT,
    "tel_trabalho" TEXT,
    "telemovel" TEXT,
    "observacoes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Perfil_pkey" PRIMARY KEY ("id")
);
