class Hunter {
  constructor(nome) {
    this.nome = nome;
  }

  lutar() {
    console.log(`${this.nome} usou um ataque genérico!`);
  }
}

class Gon extends Hunter {
  lutar() { console.log(`${this.nome} usou Jajanken!`); }
}

class Killua extends Hunter {
  lutar() { console.log(`${this.nome} usou Godspeed!`); }
}

class Kurapika extends Hunter {
  lutar() { console.log(`${this.nome} usou as Correntes Imperativas!`); }
}

class TrupeFantasma {
  constructor(nome, membros) {
    this.nome = nome;
    this.membros = membros;
  }

  revelarMembros() {
    console.log(`\n🕷️ Membros da ${this.nome}:`);
    this.membros.forEach(m => console.log(`  - ${m}`));
  }
}

// Main
const gon      = new Gon("Gon");
const killua   = new Killua("Killua");
const kurapika = new Kurapika("Kurapika");

[gon, killua, kurapika].forEach(h => h.lutar());

const trupe = new TrupeFantasma("Trupe Fantasma", ["Chrollo", "Hisoka", "Feitan"]);
trupe.revelarMembros();
