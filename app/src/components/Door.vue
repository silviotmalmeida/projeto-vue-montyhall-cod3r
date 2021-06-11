<template>
  <!-- trecho de código que representa o html do componente -->
  <!-- definindo o componente door -->
  <!-- o atributo :class aplica as classes referenciadas caso as variáveis passadas sejam true -->
  <div class="door-area">
    <!-- moldura da porta selecionada -->
    <!-- aplica a classe selected somente se a variável selected for true -->
    <div class="door-frame" :class="{ selected }">
      <!-- o presente só será renderizado se a porta estiver aberta e se o atributo hasGift dor true -->
      <Gift v-if="open && hasGift" />
    </div>

    <!-- porta -->
    <!-- aplica a classe open somente se a variável open for true -->
    <!-- o atributo @click é responsável por escutar o evento de click padrão e alternar o estado da variável selected -->
    <div class="door" :class="{ open }" @click="selected = !selected">
      <!-- número da porta -->
      <!-- aplica a classe selected somente se a variável selected for true -->
      <!-- recebe o valor do atributo number -->
      <div class="number" :class="{ selected }">{{ number }}</div>

      <!-- maçaneta -->
      <!-- aplica a classe selected somente se a variável selected for true -->
      <!-- o atributo @click.stop é responsável por escutar o evento de click solto padrão e alternar o estado da variável open -->
      <div class="knob" :class="{ selected }" @click.stop="open = true"></div>
    </div>
  </div>
</template>

<script>
// importando os componentes utilizados na composição
import Gift from "./Gift";

export default {
  name: "Door",

  // componentes utilizados na composição deste componente
  components: { Gift },

  // propriedades a serem recebidas para criação do componente
  props: {
    //indica o número da porta
    number: {},

    // indica se a porta possui presente
    hasGift: { type: Boolean },
  },

  // função que retorna o estado inicial das variáveis do componente
  data: function() {
    return {
      // indica se a porta está anerta ou fechada
      open: false,

      // indica se a porta está selecionada ou não
      selected: false,
    };
  },
};
</script>

<style>
/* trecho de código que representa o css do componente */

:root {
  --door-border: 5px solid brown;
  --selected-border: 5px solid yellow;
}

.door-area {
  position: relative;
  width: 200px;
  height: 310px;
  border-bottom: 10px solid #aaa;
  margin-bottom: 20px;
  font-size: 3rem;

  display: flex;
  justify-content: center;
}

.door-frame {
  position: absolute;
  height: 300px;
  width: 180px;

  border-left: var(--door-border);
  border-top: var(--door-border);
  border-right: var(--door-border);

  display: flex;
  justify-content: center;
  align-items: flex-end;
}

.door {
  position: absolute;
  top: 5px;
  height: 295px;
  width: 170px;
  background-color: chocolate;

  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 15px;
}

.door .number {
  color: brown;
}

.door .knob {
  height: 20px;
  width: 20px;
  border-radius: 10px;
  background-color: brown;
  align-self: flex-start;
  margin-top: 60px;
}

.door-frame.selected {
  border-left: var(--selected-border);
  border-top: var(--selected-border);
  border-right: var(--selected-border);
}

.door > .number.selected {
  color: yellow;
}

.door > .knob.selected {
  background-color: yellow;
}

.door.open {
  background-color: #0007;
}

.door.open .knob {
  display: none;
}

.door.open .number {
  display: none;
}
</style>
