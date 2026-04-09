galunos <- data.frame(
  nome = c("isaque","nathy","thiago", "davi"),
  idade = c(17,17,16,18),
  faltas = c(5,7,17,10)
)

mean(alunos$faltas)
max(alunos$faltas)
min(alunos$faltas)

riscodereprovacao <- alunos[alunos$faltas > 10,]

print(riscodereprovacao)

barplot(alunos$faltas,
  names.arg = alunos$nome,
  main = "faltas por aluno",
  xlab = "alunos",
  ylab = "quantidade de faltas"
)

alunos$status <- ifelse(alunos$faltas > 10, "riscodereprovacao", "ok")
print(alunos)

justificativas <- data.frame(
  nome = c("thiago"),
  atestadomedico = c("sim")
)

dados_completos <- merge(alunos,justificativas,by = "nome",all.x = TRUE)

dados_completos$status <- ifelse(!
  is.na(dados_completos$atestadomedico),"justificado",
          ifelse(dados_completos$faltas > 10,"risco","ok")
)

print(dados_completos)
