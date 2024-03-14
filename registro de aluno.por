programa
{
	inclua biblioteca Matematica --> m
	inclua biblioteca Tipos --> t
	inclua biblioteca Util --> u

	const inteiro LINHA = 6, COLUNA = 8
	
	funcao menu()
	{
		escreva("\n------------------------")
		escreva("\nRegistro de alunos no sistema educacional: ")
		escreva("\n[1] Cadastro")
		escreva("\n[2] Média da turma")
		escreva("\n[3] Situação do Aluno")
		escreva("\n[4] Exibição de Alunos")
		escreva("\n[5] Finalizar")
		escreva("\n------------------------\n")
		escreva("Insira o numero da operação que deseja realizar: ")
	}
	
	funcao cadastroAluno(cadeia aluno[][])
	{
		cadeia nome, mesNascimento, turma, nota1, nota2, nota3, mediaFinal
		real nota1real,nota2real,nota3real,media
		inteiro cadastros = 0, numeroErrado = 0
		caracter parar
		
		para(inteiro i=0; i < LINHA; i++)
		{	
			escreva("\nCadastro de aluno: ")
			escreva("\n------------------------")
			escreva("\nNome: ")
			leia(nome)
			escreva("\nMês de Nascimento: ")
			leia(mesNascimento)
			escreva("\nTurma: ")
			leia(turma)
			
			faca{
				escreva("\nNota 1: ")
				leia(nota1)
				escreva("\nNota 2: ")
				leia(nota2)
				escreva("\nNota 3: ")
				leia(nota3)
	
				numeroErrado++
	
				se(numeroErrado > 0){
					limpa()
					escreva("\n------------------------")
					escreva("\nAlgo deu errado, notas inseridas inválidas!\nTente novamente!\n")
					escreva("------------------------")
				}
				
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

	funcao mediaturma(cadeia aluno[][])
	{	
          cadeia turmaescolhida
          inteiro alunos = 0
          real mediaPalunos = 0.0 , mediaPturma = 0.0
          
		escreva("Escreva a turma que quer saber a média: ")
		leia(turmaescolhida)
		
		para(inteiro i = 0; i < LINHA; i++){
			    se(aluno[i][2] == turmaescolhida){
			    		alunos++
			    		mediaPalunos += t.cadeia_para_real(aluno[i][6])
			    	}
			}
			mediaPturma = mediaPalunos / alunos
			mediaPturma = m.arredondar(mediaPturma,1)
			escreva("A média desta turma é: " + mediaPturma +" \n")		

		se(mediaPturma < 6){
			escreva("Esta é uma média ruim")
		}
		se(mediaPturma >= 6 e mediaPturma < 8){
			escreva("Esta dentro da média")
		}
		se(mediaPturma >= 8 e mediaPturma < 10){
			escreva("Esta média é boa")
		}
		se(mediaPturma == 10){
			escreva("Excelente média")
		}
		escreva("\n------------------------\n")
		}

	funcao situacaoAluno(cadeia aluno[][]){
		cadeia nomeAluno
		escreva("Qual o nome do aluno que deseja saber a situação: ")
		leia(nomeAluno)

		para(inteiro i = 0; i < LINHA; i++){
			se(aluno[i][0] == nomeAluno){
			escreva("\n------------------------")
			escreva("\nNome: "+aluno[i][0])
			escreva("\nTurma: "+aluno[i][2])
			escreva("\nNota 1: "+aluno[i][3])
			escreva("\nNota 2: "+aluno[i][4])
			escreva("\nNota 3: "+aluno[i][5])
			escreva("\nMédia: "+aluno[i][6])
			escreva("\nSituação Final: "+aluno[i][7])
			escreva("\n------------------------\n")
			}
		}
	}
	
	funcao exibirAlunos(cadeia aluno[][])
	{	
		para(inteiro i = 0;i < LINHA ; i++)
		{
			se(aluno[i][0] != ""){
			escreva("\nNome: "+aluno[i][0])
			escreva("\nMes de Nascimento: "+aluno[i][1])
			escreva("\nTurma: "+aluno[i][2])
			escreva("\nNota 1: "+aluno[i][3])
			escreva("\nNota 2: "+aluno[i][4])
			escreva("\nNota 3: "+aluno[i][5])
			escreva("\nMédia: "+aluno[i][6])
			escreva("\nSituação Final: "+aluno[i][7])
			escreva("\n------------------------")
			}
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
			escreva("------------------------")
			exibirAlunos(alunos)
			escreva("-----------------")
			pare

			caso 5:
			limpa()
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
 * @POSICAO-CURSOR = 4250; 
 * @DOBRAMENTO-CODIGO = [8, 21, 100, 134];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */