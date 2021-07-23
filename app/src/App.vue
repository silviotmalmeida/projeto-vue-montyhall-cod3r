<template>
  <!-- trecho de código que representa o html do componente -->
  <!-- definindo a div principal com o componente raiz a ser renderizado -->
  <div id="app">
    <!-- texto da página -->
    <h1>Problema de Monty Hall</h1>

    <!-- formulário -->
    <div class="form">
      <!-- se o jogo ainda não foi iniciado: -->
      <div v-if="!started">
        <!-- renderiza o campo de quantidade de portas -->
        <!-- vincula a variável portsAmount ao valor numérico do input -->
        <label for="portsAmount">Quantas portas? </label>
        <input
          type="text"
          id="portsAmount"
          size="3"
          v-model.number="portsAmount"
        />
      </div>

      <!-- se o jogo ainda não foi iniciado: -->
      <div v-if="!started">
        <!-- renderiza o campo de porta premiada -->
        <!-- vincula a variável selectedPort ao valor numérico do input -->
        <label for="selectedPort">Qual porta é premiada? </label>
        <input
          type="text"
          id="selectedPort"
          size="3"
          v-model.number="selectedPort"
        />
      </div>

      <!-- se o jogo ainda não foi iniciado: -->
      <!-- renderiza o botão iniciar -->
      <!-- o atributo @click é responsável por escutar o evento de click padrão e emitir um novo evento que altera a variável started para true -->
      <button v-if="!started" @click="started = true">Iniciar</button>

      <!-- se o jogo já foi iniciado: -->
      <!-- renderiza o botão reiniciar -->
      <!-- o atributo @click é responsável por escutar o evento de click padrão e emitir um novo evento que altera a variável started para false -->
      <button v-if="started" @click="started = false">Reiniciar</button>
    </div>

    <!-- se o jogo já foi iniciado: -->
    <!-- inicia a renderização das portas -->
    <div class="doors" v-if="started">
      <!-- laço de repetição para desenhar a quantidade de portas definida na variável portsAmount -->
      <div v-for="i in portsAmount" :key="i">
        <!-- desenhando a porta de número i -->
        <!-- caso este número seja a porta premiada, seta o atributo :hasGift como true -->
        <Door :hasGift="i === selectedPort" :number="i" />
      </div>
    </div>
  </div>
</template>

<script>
// importando os componentes utilizados na composição
import Door from "./components/Door";

export default {
  name: "App",

  // componentes utilizados na composição deste componente
  components: { Door },

  // função que retorna o estado inicial das variáveis do componente
  data: function() {
    return {
      // indica se o jogo iniciou
      started: false,

      // indica a quantidade de portas do jogo
      portsAmount: 3,

      // indica qual a porta premiada
      selectedPort: null,
    };
  },
};
</script>

<style>
/* trecho de código que representa o css do componente */

* {
  box-sizing: border-box;
  font-family: "Montserrat", sans-serif;
}

body {
  color: #fff;
  background: linear-gradient(to right, rgb(21, 153, 87), rgb(21, 87, 153));
}

#app {
  display: flex;
  flex-direction: column;
  align-items: center;
}

#app h1 {
  border: 1px solid #000;
  background-color: #0004;
  padding: 20px;
  margin-bottom: 60px;
}

.form {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  margin-bottom: 40px;
}

.form,
.form input,
.form button {
  margin-bottom: 10px;
  font-size: 2rem;
}

.doors {
  align-self: stretch;
  display: flex;
  justify-content: space-around;
  flex-wrap: wrap;
}
</style>
