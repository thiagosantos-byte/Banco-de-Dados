public class ContaBancaria {
    private String numeroConta;
    private String titular;
    private double saldo;

    
    public ContaBancaria(String numeroConta, String titular) {
        this.numeroConta = numeroConta;
        this.titular = titular;
        this.saldo = 0.0;
    }

    
    public void depositar(double valor) {
        if (valor > 0) {
            this.saldo += valor;
            System.out.println("Depósito de R$" + valor + " realizado com sucesso.");
        } else {
            System.out.println("Erro: Valor de depósito inválido.");
        }
    }

    
    public void sacar(double valor) {
        if (valor > this.saldo) {
            System.out.println("Erro: Saldo insuficiente. Saldo atual: R$" + this.saldo);
            return;
        }
        if (valor <= 0) {
            System.out.println("Erro: Valor de saque inválido.");
            return;
        }

        this.saldo -= valor;
        System.out.println("Saque de R$" + valor + " realizado.");
        calcularCedulas(valor);
    }

 
    private void calcularCedulas(double valor) {
        int valorInteiro = (int) valor;
        int[] notas = {100, 50, 20, 10, 5, 2, 1};
        
        System.out.print("Cédulas utilizadas: ");
        for (int nota : notas) {
            int quantidade = valorInteiro / nota; 
            if (quantidade > 0) {
                System.out.print(quantidade + " nota(s) de R$" + nota + ", ");
                valorInteiro %= nota;
            }
        }
        System.out.println("\b\b."); 
    }

  
    public double getSaldo() {
        return this.saldo;
    }

   
    public String getNumeroConta() {
        return numeroConta;
    }

    public String getTitular() {
        return titular;
    }
}
