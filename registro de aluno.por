programa
{
	inclua biblioteca Matematica --> m
	inclua biblioteca Tipos --> t
	inclua biblioteca Util --> u

	const inteiro LINHA = 3, COLUNA = 8
	
	funcao menu()
	{
		escreva("-----------------------------------------")
		escreva("\nRegistro de alunos no sistema educacional: ")
		escreva("\n[1] Cadastro")
		escreva("\n[2] Média da turma")
		escreva("\n[3] Situação do Aluno")
		escreva("\n[4] Exibição de Alunos")
		escreva("\n[5] Editar Alunos")
		escreva("\n[6] Mural de Aniversário")
		escreva("\n[7] Finalizar")
		escreva("\n-----------------------------------------")
		escreva("\nInsira o numero da operação que deseja realizar: ")
	}
	
	funcao cadastroAluno(cadeia aluno[][])
	{
		cadeia nome, mesNascimento, turma, nota1, nota2, nota3, mediaFinal
		real nota1real,nota2real,nota3real,media
		inteiro cadastros = 0, numeroErrado = 0, mesInvalido = 0
		caracter parar
		
		para(inteiro i=0; i < LINHA; i++)
		{	
			se(aluno[i][0] == "")
			{
				escreva(i)
			escreva("-----------------------------------------")
			escreva("\nCadastro de aluno: ")
			escreva("\n-----------------------------------------")
			escreva("\nNome: ")
			leia(nome)
			limpa()

			escreva("-----------------------------------------")
			mesInvalido = 0
			
			faca{
				escreva("\nMês de Nascimento: ")
				leia(mesNascimento)

				mesInvalido++
	
				se(mesInvalido > 0){
					limpa()
					escreva("-----------------------------------------")
					escreva("\nAlgo deu errado, mês inserido inválido!\nTente novamente!\n")
					escreva("-----------------------------------------\n")
				}
			}enquanto(mesNascimento != "Janeiro" e
	     			mesNascimento != "Fevereiro" e
	     			mesNascimento != "Marco" e 
	     			mesNascimento != "Março" e 
	     			mesNascimento != "Abril" e 
	     			mesNascimento != "Maio"	e 
			     	mesNascimento != "Junho" e 
			     	mesNascimento != "Julho" e 
			     	mesNascimento != "Agosto" e 
			     	mesNascimento != "Setembro" e 
			     	mesNascimento != "Outubro" e
			     	mesNascimento != "Novembro" e 
			     	mesNascimento != "Dezembro")	
			     	
			limpa()
			escreva("-----------------------------------------")
			escreva("\nTurma: ")
			leia(turma)
			limpa()

			numeroErrado = 0
			
			faca{
				escreva("-----------------------------------------")
				escreva("\nNota 1: ")
				leia(nota1)
				escreva("\nNota 2: ")
				leia(nota2)
				escreva("\nNota 3: ")
				leia(nota3)
	
				se(numeroErrado > 0){
					limpa()
					escreva("---------------------------------------------------------------")
					escreva("\nAlgo deu errado, notas inseridas inválidas!\nTente novamente!\n")
					escreva("---------------------------------------------------------------\n")
				}

				numeroErrado++
				
				nota1real = t.cadeia_para_real(nota1)
				nota2real = t.cadeia_para_real(nota2)
				nota3real = t.cadeia_para_real(nota3)
			}enquanto(nota1real > 10 ou nota1real < 0 ou nota2real > 10 ou nota2real < 0 ou nota3real > 10 ou nota3real < 0)
			
			aluno[i][0] = nome
			aluno[i][1] = mesNascimento
			aluno[i][2] = turma
			aluno[i][3] = nota1
			aluno[i][4] = nota2
			aluno[i][5] = nota3
	
			media = (nota1real + nota2real + nota3real) / 3
			media = m.arredondar(media,1)
			mediaFinal = t.real_para_cadeia(media)
			aluno[i][6] = mediaFinal

			se(media < 6)
			{
				aluno[i][7] = "Reprovado"
			} 
			senao se(media > 6)
			{
				aluno[i][7] = "Aprovado"
			}
			
			cadastros = i
			cadastros++

			limpa()
			se(cadastros < LINHA e cadastros > 0){
				escreva("\nContinuar?(S ou N): ")
				leia(parar)
				limpa()
			
				se(parar == 'N'ou parar == 'n')
				{
					limpa()
					pare
				}
	     	}
	     	}
		}
	}

	funcao ordenadorPorMediaCrescente(cadeia aluno[][]){
		real mediaReal1 = 0.0, mediaReal2 = 0.0
		cadeia matrizAux[LINHA][COLUNA]
		inteiro troca = 0

		enquanto(troca < LINHA)
		{	
			para(inteiro i = 0; i < LINHA; i++){
				mediaReal1 = t.cadeia_para_real(aluno[i][6])
				se(i+1 < LINHA){
					mediaReal2 = t.cadeia_para_real(aluno[i+1][6])
				} senao {
					pare
				}
	
				se(mediaReal1 < mediaReal2){
					matrizAux[i][0] = aluno[i][0]
					matrizAux[i][1] = aluno[i][1]
					matrizAux[i][2] = aluno[i][2]
					matrizAux[i][3] = aluno[i][3]
					matrizAux[i][4] = aluno[i][4]
					matrizAux[i][5] = aluno[i][5]
					matrizAux[i][6] = aluno[i][6]
					matrizAux[i][7] = aluno[i][7]
	
					aluno[i][0] = aluno[i+1][0]
					aluno[i][1] = aluno[i+1][1]
					aluno[i][2] = aluno[i+1][2]
					aluno[i][3] = aluno[i+1][3]
					aluno[i][4] = aluno[i+1][4]
					aluno[i][5] = aluno[i+1][5]
					aluno[i][6] = aluno[i+1][6]
					aluno[i][7] = aluno[i+1][7]
	
					aluno[i+1][0] = matrizAux[i][0]
					aluno[i+1][1] = matrizAux[i][1]
					aluno[i+1][2] = matrizAux[i][2]
					aluno[i+1][3] = matrizAux[i][3]
					aluno[i+1][4] = matrizAux[i][4]
					aluno[i+1][5] = matrizAux[i][5]
					aluno[i+1][6] = matrizAux[i][6]
					aluno[i+1][7] = matrizAux[i][7]
				}
			}
			troca++
		}
	}

	funcao mediaturma(cadeia aluno[][])
	{	
          cadeia turmaescolhida
          inteiro alunos = 0
          real mediaPorAlunos = 0.0 , mediaPorTurma = 0.0
          
		escreva("Escreva a turma que quer saber a média: ")
		leia(turmaescolhida)
		limpa()
		
		para(inteiro i = 0; i < LINHA; i++){
			se(aluno[i][2] == turmaescolhida){
			    	alunos++
			    	mediaPorAlunos += t.cadeia_para_real(aluno[i][6])
			}
		}
		mediaPorTurma = mediaPorAlunos / alunos
		mediaPorTurma = m.arredondar(mediaPorTurma,1)
			
		escreva("-----------------------------------------\n")
		escreva("A média da turma "+turmaescolhida+" é: " + mediaPorTurma +" \n")	
		se(mediaPorTurma < 6){
			escreva("Esta é uma média ruim\n")
		}
		se(mediaPorTurma >= 6 e mediaPorTurma < 8){
			escreva("Dentro da média\n")
		}
		se(mediaPorTurma >= 8 e mediaPorTurma < 10){
			escreva("Esta é uma é boa média\n")
		}
		se(mediaPorTurma == 10){
			escreva("Excelente média\n")
		}
	}

	funcao situacaoAluno(cadeia aluno[][]){
		cadeia nomeAluno
		escreva("Qual o nome do aluno que deseja saber a situação: ")
		leia(nomeAluno)
		limpa()
		
		para(inteiro i = 0; i < LINHA; i++){
			se(aluno[i][0] == nomeAluno){
			escreva("-----------------------------------------")
			escreva("\nNome: "+aluno[i][0])
			escreva("\nTurma: "+aluno[i][2])
			escreva("\nNota 1: "+aluno[i][3])
			escreva("\nNota 2: "+aluno[i][4])
			escreva("\nNota 3: "+aluno[i][5])
			escreva("\nMédia: "+aluno[i][6])
			escreva("\nSituação Final: "+aluno[i][7]+ "\n")
			}
		}
	}

	funcao editarAlunos(cadeia aluno[][])
	{	
		cadeia nome, mesNascimento, turma, nota1, nota2, nota3, mediaFinal,nomeAluno
		real nota1real,nota2real,nota3real,media
		inteiro numeroErrado = 0, mesInvalido = 0
		
		escreva("Qual o nome do aluno que deseja editar: ")
		leia(nomeAluno)
		limpa()

		para(inteiro i = 0; i < LINHA; i++)
		{
			se(aluno[i][0] == nomeAluno)
			{
			escreva("\nEditar cadastro do aluno: ")
			escreva("\n------------------------")
			escreva("\nNome: ")
			leia(nome)
			limpa()
			
			escreva("-----------------------------------------")
			mesInvalido = 0
			
			faca{
				escreva("\nMês de Nascimento: ")
				leia(mesNascimento)

				mesInvalido++
	
				se(mesInvalido > 0){
					limpa()
					escreva("-----------------------------------------")
					escreva("\nAlgo deu errado, mês inserido inválido!\nTente novamente!\n")
					escreva("-----------------------------------------\n")
				}
			}enquanto(mesNascimento != "Janeiro" e
	     			mesNascimento != "Fevereiro" e
	     			mesNascimento != "Marco" e 
	     			mesNascimento != "Março" e 
	     			mesNascimento != "Abril" e 
	     			mesNascimento != "Maio"	e 
			     	mesNascimento != "Junho" e 
			     	mesNascimento != "Julho" e 
			     	mesNascimento != "Agosto" e 
			     	mesNascimento != "Setembro" e 
			     	mesNascimento != "Outubro" e
			     	mesNascimento != "Novembro" e 
			     	mesNascimento != "Dezembro")	
			     	
			limpa()
			escreva("-----------------------------------------")
			escreva("\nTurma: ")
			leia(turma)
			limpa()

			numeroErrado = 0
			
			faca{
				escreva("-----------------------------------------")
				escreva("\nNota 1: ")
				leia(nota1)
				escreva("\nNota 2: ")
				leia(nota2)
				escreva("\nNota 3: ")
				leia(nota3)
	
				se(numeroErrado > 0){
					limpa()
					escreva("---------------------------------------------------------------")
					escreva("\nAlgo deu errado, notas inseridas inválidas!\nTente novamente!\n")
					escreva("---------------------------------------------------------------\n")
				}

				numeroErrado++
				
				nota1real = t.cadeia_para_real(nota1)
				nota2real = t.cadeia_para_real(nota2)
				nota3real = t.cadeia_para_real(nota3)
			}enquanto(nota1real > 10 ou nota1real < 0 ou nota2real > 10 ou nota2real < 0 ou nota3real > 10 ou nota3real < 0)
			
			aluno[i][0] = nome
			aluno[i][1] = mesNascimento
			aluno[i][2] = turma
			aluno[i][3] = nota1
			aluno[i][4] = nota2
			aluno[i][5] = nota3
	
			media = (nota1real + nota2real + nota3real) / 3
			media = m.arredondar(media,1)
			mediaFinal = t.real_para_cadeia(media)
			aluno[i][6] = mediaFinal

			se(media < 6)
			{
				aluno[i][7] = "Reprovado"
			} 
			senao se(media >= 6)
			{
				aluno[i][7] = "Aprovado"
			}
			}
		}limpa()
	}	
	
	funcao exibirAlunos(cadeia aluno[][])
	{	
		para(inteiro i = 0;i < LINHA ; i++)
		{
			se(aluno[i][0] != ""){
		     escreva("-----------------------------------------")
			escreva("\nNome: "+aluno[i][0])
			escreva("\nMes de Nascimento: "+aluno[i][1])
			escreva("\nTurma: "+aluno[i][2])
			escreva("\nNota 1: "+aluno[i][3])
			escreva("\nNota 2: "+aluno[i][4])
			escreva("\nNota 3: "+aluno[i][5])
			escreva("\nMédia: "+aluno[i][6])
			escreva("\nSituação Final: "+aluno[i][7]+"\n")
			}
		}
	}
	
	funcao muralAniversario(cadeia aluno[][])
	{
		cadeia mesSelecionado
		inteiro aniversarios = 0
		
		escreva("-----------------------------------------")
		escreva("\nOlá, deseja acessar o mural de qual mês?\n")
		leia(mesSelecionado)
		limpa()

	     se(mesSelecionado == "Janeiro" ou 
	     	mesSelecionado == "Fevereiro" ou 
	     	mesSelecionado == "Marco" ou 
	     	mesSelecionado == "Março" ou 
	     	mesSelecionado == "Abril" ou 
	     	mesSelecionado == "Maio"	ou 
	     	mesSelecionado == "Junho" ou 
	     	mesSelecionado == "Julho" ou 
	     	mesSelecionado == "Agosto" ou 
	     	mesSelecionado == "Setembro" ou 
	     	mesSelecionado == "Outubro" ou 
	     	mesSelecionado == "Novembro" ou 
	     	mesSelecionado == "Dezembro")
	     {
	     	escreva("-----= Aniversariantes de " + mesSelecionado + " =------")
			para(inteiro i = 0; i < LINHA ; i++)
			{    
				se(aluno[i][1] == mesSelecionado)
				{
						escreva("\n" + aluno[i][0] + "\n")
						aniversarios = 1
				}		
	     	}
	   		se(aniversarios < 1){    
				escreva("\nNão há alunos fazendo aniversário neste mês...\n")
			}
	     } senao {
	     	escreva("-----------------------------------------\n")
	     	escreva("Erro! Mês inserido inválido!\n")
	     }
		
	 }
		
	funcao inicio()
	{
		cadeia alunos[LINHA][COLUNA]
		logico rodandoprograma = verdadeiro
		inteiro selecao
		
	enquanto(rodandoprograma)
	{
		menu()
		leia(selecao)
		escolha(selecao){
			caso 1:
			limpa()
			cadastroAluno(alunos)
			ordenadorPorMediaCrescente(alunos)
			pare

			caso 2:
			limpa()
			mediaturma(alunos)
			pare

			caso 3:
			limpa()
			situacaoAluno(alunos)
			pare

			caso 4:
			limpa()
			se(alunos[0][0] != ""){
				ordenadorPorMediaCrescente(alunos)
				exibirAlunos(alunos)
			} senao {
				exibirAlunos(alunos)
			}
			pare

			caso 5:
			limpa()
			se(alunos[0][0] != ""){
				ordenadorPorMediaCrescente(alunos)
				editarAlunos(alunos)
			} senao {
				escreva("Erro!!! Não há alunos para serem editados!\n")
			}
			pare

			caso 6:
			limpa()
			muralAniversario(alunos)
			pare
			
			caso 7:
			limpa()
			escreva("Finalizando Programa...")
			u.aguarde(600)
			rodandoprograma = falso
			pare

			caso contrario:
			limpa()
			escreva("\n Opção inserida inválida.")
			u.aguarde(800)
			limpa()
			}
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 3936; 
 * @DOBRAMENTO-CODIGO = [8, 23, 190, 225, 245, 349, 367];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {aluno, 143, 42, 5}-{troca, 146, 10, 5}-{i, 150, 16, 1}-{alunos, 194, 18, 6}-{alunos, 413, 9, 6};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */