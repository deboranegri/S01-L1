class Habilidade {
  usar() {
    throw new Error("O método usar() deve ser sobrescrito!");
  }
}

class Smoke extends Habilidade {
  usar() { console.log("Lançando fumaça para bloquear visão!"); }
}

class Flash extends Habilidade {
  usar() { console.log("Lançando flash para cegar inimigos!"); }
}

class Dash extends Habilidade {
  usar() { console.log("Usando Dash para reposicionar rapidamente!"); }
}

class Armadilha extends Habilidade {
  usar() { console.log("Colocando armadilha para monitorar área!"); }
}

class Agente {
  constructor(nome, funcao, habilidade) {
    this.nome = nome;
    this.funcao = funcao;
    this._habilidade = habilidade;
  }

  entrarEmCombate() {
    console.log(`\n[${this.funcao}] ${this.nome} entrou em combate!`);
    this._habilidade.usar();
  }
}

class Time {
  constructor(agentes) {
    this.agentes = agentes;
  }

  iniciarPartida() {
    console.log("=== Partida iniciada! ===");
    this.agentes.forEach(a => a.entrarEmCombate());
  }

  listarControladores() {
    return this.agentes.filter(a => a._habilidade instanceof Smoke);
  }
}

// Main
const omen   = new Agente("Omen",   "Controlador", new Smoke());
const skye   = new Agente("Skye",   "Iniciador",   new Flash());
const jett   = new Agente("Jett",   "Duelista",    new Dash());
const cypher = new Agente("Cypher", "Sentinela",   new Armadilha());

const time = new Time([omen, skye, jett, cypher]);
time.iniciarPartida();

console.log("\n--- Controladores encontrados ---");
time.listarControladores().forEach(a => console.log(a.nome));
