-- CreateTable
CREATE TABLE "profissional" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nome" TEXT NOT NULL,
    "descricao" TEXT NOT NULL,
    "imagemUrl" TEXT NOT NULL,
    "avaliacao" REAL NOT NULL,
    "quantidadeAvaliacoes" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "servico" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nome" TEXT NOT NULL,
    "descricao" TEXT NOT NULL,
    "preco" REAL NOT NULL,
    "qtdeSlots" INTEGER NOT NULL,
    "imagemURL" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "agendamento" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "emailCliente" TEXT NOT NULL,
    "data" DATETIME NOT NULL,
    "profissionalId" INTEGER NOT NULL,
    CONSTRAINT "agendamento_profissionalId_fkey" FOREIGN KEY ("profissionalId") REFERENCES "profissional" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "_AgendamentoToServico" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,
    CONSTRAINT "_AgendamentoToServico_A_fkey" FOREIGN KEY ("A") REFERENCES "agendamento" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "_AgendamentoToServico_B_fkey" FOREIGN KEY ("B") REFERENCES "servico" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "profissional_nome_key" ON "profissional"("nome");

-- CreateIndex
CREATE UNIQUE INDEX "servico_nome_key" ON "servico"("nome");

-- CreateIndex
CREATE UNIQUE INDEX "_AgendamentoToServico_AB_unique" ON "_AgendamentoToServico"("A", "B");

-- CreateIndex
CREATE INDEX "_AgendamentoToServico_B_index" ON "_AgendamentoToServico"("B");
