class Criatura {
  constructor(nome, perigo) {
    this.nome = nome;
    this.perigo = perigo;
  }
}

class Diario {
  constructor() {
    this._criaturas = [];
  }

  registrarCriatura(criatura) {
    this._criaturas.push(criatura);
    console.log(`Criatura registrada: ${criatura.nome}`);
  }

  listarCriaturas() {
    console.log("\n Criaturas no Diário 3:");
    this._criaturas.forEach(c =>
      console.log(`  - ${c.nome} | Perigo: ${c.perigo}`)
    );
  }
}

class Personagem {
  constructor(nome) {
    this.nome = nome;
  }
}

class CabanaMisterio {
  constructor(personagens) {
    this.personagens = personagens;
  }

  listarFuncionarios() {
    console.log("\n Funcionários da Cabana do Mistério:");
    this.personagens.forEach(p => console.log(`  - ${p.nome}`));
  }
}

const diario = new Diario();
diario.registrarCriatura(new Criatura("Gnomo",       "Baixo"));
diario.registrarCriatura(new Criatura("Bill Cipher", "Extremo"));
diario.registrarCriatura(new Criatura("Homem-Veado", "Médio"));
diario.listarCriaturas();

const cabana = new CabanaMisterio([
  new Personagem("Grunkle Stan"),
  new Personagem("Mabel"),
  new Personagem("Soos"),
]);
cabana.listarFuncionarios();
