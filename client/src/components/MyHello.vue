<template>
  <div :style="{ background: color }" @click="sayHello(); getColor()">
    [[ {{ hello }} ]] [[ {{ color }} ]]
  </div>

  <input v-model="hello" />
</template>

<script setup lang="ts">
import { ref } from 'vue';

let colors: string[] = ["red", "green", "blue", "yellow", "light-purple", "grey", "pink", "orange", "violet", "cyan", "magenta", "brown"];
let messages: string[] = ["Hello World", "Olá Mundo", "Hola Mundo"];
const hello = ref(messages[0]);
const color = ref(colors[0]);

function sayHello() {
  let i = Math.floor(Math.random() * messages.length);
  hello.value = messages[i];
}

function getColor() {
  let j = Math.floor(Math.random() * colors.length);
  color.value = colors[j];
}
</script>