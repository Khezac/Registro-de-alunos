programa
{
	inclua biblioteca Matematica --> m
	inclua biblioteca Tipos --> t
	inclua biblioteca Util
	
	funcao menu()
	{
			escreva("\n Digite o respectivo numero para ser redirecionado")
			escreva("\n [1] Cadastro")
			escreva("\n [2] Média da turma")
			escreva("\n [3] Situação do Aluno")
			escreva("\n [4] Exibição de Alunos")
			escreva("\n [5] Finalizar")
			escreva("\n")
	}
	
	funcao cadastroAluno(cadeia aluno[][]){
		caracter parar
		inteiro linha = Util.numero_linhas(aluno)
		para(inteiro i=0; i < linha; i++)
		{
			real nota1real,nota2real,nota3real,media
			cadeia mediaFinal
			cadeia nome, mesNascimento, turma, nota1, nota2, nota3 					
			escreva("\nNome: ")
			leia(nome)
			
			escreva("\nMês de Nascimento: ")
			leia(mesNascimento)

			escreva("\nTurma: ")
			leia(turma)

			escreva("\nNota 1: ")
			leia(nota1)

			escreva("\nNota 2: ")
			leia(nota2)

			escreva("\nNota 3: ")
			leia(nota3)
			
			aluno[i][0] = nome
			aluno[i][1] = mesNascimento
			aluno[i][2] = turma
			aluno[i][3] = nota1
			aluno[i][4] = nota2
			aluno[i][5] = nota3
	
			nota1real = t.cadeia_para_real(aluno[i][3])
			nota2real = t.cadeia_para_real(aluno[i][4])
			nota3real = t.cadeia_para_real(aluno[i][5])
	
			media = (nota1real + nota2real + nota3real) / 3
			media = m.arredondar(media,1)
			
			mediaFinal = t.real_para_cadeia(media)
						
			aluno[i][6] = mediaFinal

		se(media < 6){
			aluno[i][7] = "Reprovado"
			
		} senao se(media > 6){
			aluno[i][7] = "Aprovado"
			
		}
		escreva("\nDeseja parar?(S ou N): ")
		leia(parar)
			
			se(parar == 'S'ou parar == 's')
			{
				limpa()
				pare
			}
		
	     }
			
	}
	funcao exibirAlunos(cadeia aluno[][])
	{	
		inteiro linha = Util.numero_linhas(aluno)
		inteiro coluna = Util.numero_colunas(aluno)
		
		para(inteiro i = 0;i<linha;i++)
		{
			//para(inteiro j = 0;j<coluna;j++)
			//{
				escreva("\nNome: "+aluno[i][0])
				escreva("\nMes de Nascimento: "+aluno[i][1])
				escreva("\nTurma: "+aluno[i][2])
				escreva("\nNota 1: "+aluno[i][3])
				escreva("\nNota 2: "+aluno[i][4])
				escreva("\nNota 3: "+aluno[i][5])
				escreva("\nMédia: "+aluno[i][6])
				escreva("\nSituação: "+aluno[i][7])
				escreva("\n")
				escreva("------------------------")
			//}	
		}
	
	}
	funcao mediaturma(cadeia aluno[][])
	{	
		inteiro linha = Util.numero_linhas(aluno)
          cadeia turmaescolhida
          inteiro alunos = 0
          real mediaPalunos = 0.0 , mediaPturma = 0.0
          
		escreva("Escreva a turma que quer saber a média: ")
		leia(turmaescolhida)
		
		para(inteiro i=0; i<linha; i++){
			    se(aluno[i][2] == turmaescolhida){
			    		alunos++
			    		mediaPalunos += t.cadeia_para_real(aluno[i][6])
			    	}	
			}
			mediaPturma = mediaPalunos / alunos
			mediaPturma = m.arredondar(mediaPturma,1)
			escreva(mediaPturma+" ")			 		
		}
	funcao inicio()
	{
		inteiro selecao
		logico rodandoprograma = verdadeiro
		const inteiro linha = 2, coluna = 8
		cadeia alunos[linha][coluna]
		
	

	enquanto(rodandoprograma)
		{
	
		menu()
		leia(selecao)
		escolha(selecao)
	
		{	
			
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
			escreva("\n Situação do Aluno\n")
			
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
			escreva("\n Opção digitada inválida. \n")
			
		}
		
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 3527; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {aluno, 18, 29, 5};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */