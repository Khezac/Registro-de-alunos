programa
{
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
	funcao inicio()
	{
		inteiro selecao
		logico rodandoprograma = verdadeiro
		cadeia nome = " "
		
	

	enquanto(rodandoprograma)
		{
	
		menu()
		leia(selecao)
		escolha(selecao)
	
		{	
			
			caso 1:
			limpa()
			escreva("\n Cadastro")
			leia(nome)
			pare

			caso 2:
			limpa()
			escreva("\n Média da Turma")
			pare

			caso 3:
			limpa()
			escreva("\n Situação do Aluno")
			pare

			caso 4:
			limpa()
			escreva("\n Exibição de alunos")
			escreva(nome)
			pare

			caso 5:
			limpa()
			rodandoprograma = falso
			pare

			caso contrario:
			limpa()
			escreva("\n Opção Digitada Invalida \n")
			
		}
		
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 511; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */