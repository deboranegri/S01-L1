class Pokemon {
  constructor(nome, tipo) {
    this.nome = nome;
    this.tipo = tipo;
    this._vida = 100;
  }

  get vida() {
    return this._vida;
  }

  atacar() {
    console.log(`${this.nome} usou um ataque genérico!`);
  }

  receber_dano(dano) {
    this._vida = Math.max(0, this._vida - dano);
    console.log(`${this.nome} recebeu ${dano} de dano! Vida restante: ${this._vida}`);
  }
}

class Pikachu extends Pokemon {
  constructor() {
    super("Pikachu", "Elétrico");
  }
  atacar() {
    console.log(`${this.nome} usou Thunderbolt!`);
  }
}

class Charizard extends Pokemon {
  constructor() {
    super("Charizard", "Fogo/Voador");
  }
  atacar() {
    console.log(`${this.nome} usou Lança-Chamas!`);
  }
}

const pikachu = new Pikachu();
const charizard = new Charizard();

pikachu.atacar();
charizard.atacar();

pikachu.receber_dano(40);
console.log(`Vida do ${pikachu.nome}: ${pikachu.vida}`);
